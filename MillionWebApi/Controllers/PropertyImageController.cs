using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;
using MillionApplication.Services;
using MillionWebApi.Handlers;
using MillionWebApi.Models;
using System.IO;

namespace MillionWebApi.Controllers
{
    [Route("api/Property")]
    [ApiController]
    [Authorize]
    public class PropertyImageController : ControllerBase
    {
        private readonly IImageService _imageService;

        public PropertyImageController(IImageService imageService)
        {
            _imageService = imageService;
        }

        [HttpPost("{id}/image")]
        [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(ImageDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status500InternalServerError)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> UploadImage(int id,[FromForm] IFormFile image)
        {
            if (image == null || image.Length == 0)
            {
                return BadRequest( new ServiceErrorResponse()
                {
                    Message = "No image file uploaded.",
                    StatusCode = StatusCodes.Status400BadRequest,
                    Detailed = "No image file uploaded."
                });
            }

            var extension = Path.GetExtension(image.FileName);            
            var uniqueFileName = $"{Guid.NewGuid()}{extension}";

            using (var memoryStream = new MemoryStream())
            {
                await image.CopyToAsync(memoryStream);
                var propertyImage = await _imageService.AddPropertyImageAsync(id,memoryStream.ToArray(), uniqueFileName);
                return Ok(propertyImage);
            }
            
        }

        [HttpDelete("image/{id}")]
        [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(typeof(void), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ServiceErrorResponse), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> DeleteImage(int id)
        {
            await _imageService.RemovePropertyImageAsync(id);
            return Ok();
        }
    }
}
