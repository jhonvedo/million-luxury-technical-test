using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;
using MillionWebApi.Handlers;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MillionWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PropertyController : ControllerBase
    {
        private readonly IPropertyService _propertyService;

        public PropertyController(IPropertyService propertyService)
        {
            _propertyService = propertyService;
        }

        [HttpGet]
        [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(IEnumerable<PropertyDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetAllPropertiesAsync([FromQuery] PropertyFilterDto filters)
        {
            var properties = await _propertyService.GetAllPropertiesAsync(filters);
            return Ok(properties);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(PropertyDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetPropertyById(int id)
        {
            var property = await _propertyService.GetPropertyByIdAsync(id);
            if (property == null)
            {
                return NotFound();
            }

            return Ok(property);
        }

        [HttpPatch("{id}/price")]
        [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(PropertyDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UpdatePropertyPrice(int id, [FromBody] decimal newPrice)
        {
            var updatedProperty = await _propertyService.ChangePropertyPriceAsync(id, newPrice);

            if (updatedProperty == null)
            {
                return NotFound();
            }

            return Ok(updatedProperty);
        }

        [HttpPost]
        [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(PropertyDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> AddProperty([FromBody] PropertyDto propertyDto)
        {
            var property = await _propertyService.CreatePropertyAsync(propertyDto);
            return Ok(property);
        }

        [HttpPut]
        [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(PropertyDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UpdateProperty([FromBody] PropertyDto propertyDto)
        {
            var property = await _propertyService.UpdatePropertyAsync(propertyDto);
            return Ok(property);
        }
    }
}
