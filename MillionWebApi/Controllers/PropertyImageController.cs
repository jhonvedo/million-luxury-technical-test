using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MillionApplication.Interfaces;
using MillionApplication.Services;
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
        public async Task<IActionResult> UploadImage(int id,[FromForm] IFormFile image)
        {
            if (image == null || image.Length == 0)
            {
                return BadRequest("No image file uploaded.");
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
        public async Task<IActionResult> DeleteImage(int id)
        {
            await _imageService.RemovePropertyImageAsync(id);
            return Ok();
        }
    }
}
