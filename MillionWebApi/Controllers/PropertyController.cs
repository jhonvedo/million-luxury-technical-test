using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;

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
        public async Task<ActionResult<IEnumerable<PropertyDto>>> GetAllPropertiesAsync([FromQuery] PropertyFilterDto filters)
        {
            var properties = await _propertyService.GetAllPropertiesAsync(filters);
            return Ok(properties);
        }

        [HttpGet("{id}")]
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
        public async Task<IActionResult> AddProperty([FromBody] PropertyDto propertyDto)
        {
            var property = await _propertyService.CreatePropertyAsync(propertyDto);
            return Ok(property);
        }

        [HttpPut]
        public async Task<IActionResult> UpdateProperty([FromBody] PropertyDto propertyDto)
        {
            var property = await _propertyService.UpdatePropertyAsync(propertyDto);
            return Ok(property);
        }
    }
}
