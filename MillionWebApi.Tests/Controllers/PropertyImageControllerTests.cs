using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;
using MillionWebApi.Controllers;
using MillionWebApi.Handlers;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionWebApi.Tests.Controllers
{
    public class PropertyImageControllerTests
    {
        private PropertyImageController _propertyImageController;
        private Mock<IImageService> _imageServiceMock;

        [SetUp]
        public void Setup()
        {
            _imageServiceMock = new Mock<IImageService>();
            _propertyImageController = new PropertyImageController(_imageServiceMock.Object);
        }

        [Test]
        public async Task UploadImage_WhenThereIsImage_ReturnsOk()
        {
           
            var propertyId = 1;
            var imageFileMock = new Mock<IFormFile>();
            var imageName = "testImage.jpg";
            var imageContent = "image content";

            var memoryStream = new MemoryStream();
            var writer = new StreamWriter(memoryStream);
            await writer.WriteAsync(imageContent);
            await writer.FlushAsync();
            memoryStream.Position = 0;

            imageFileMock.Setup(f => f.FileName).Returns(imageName);
            imageFileMock.Setup(f => f.Length).Returns(memoryStream.Length);
            imageFileMock.Setup(f => f.CopyToAsync(It.IsAny<Stream>(), It.IsAny<CancellationToken>()))
                 .Callback<Stream, CancellationToken>((stream, cancellationToken) =>
                 {                    
                     memoryStream.Position = 0; 
                     memoryStream.CopyTo(stream);
                 });

            _imageServiceMock.Setup(x => x.AddPropertyImageAsync(propertyId, It.IsAny<byte[]>(), It.IsAny<string>()))
                             .ReturnsAsync(new ImageDto { IdPropertyImage = 1, File = "http://example.com/image.jpg" });

           
            var result = await _propertyImageController.UploadImage(propertyId, imageFileMock.Object);

         
            var okResult = result as OkObjectResult;
            Assert.IsNotNull(okResult); 
            Assert.AreEqual(200, okResult.StatusCode);
            var propertyImage = okResult.Value as ImageDto;
            Assert.IsNotNull(propertyImage); 
            Assert.AreEqual(1, propertyImage.IdPropertyImage);
            Assert.AreEqual("http://example.com/image.jpg", propertyImage.File);
        }

        [Test]
        public async Task UploadImage_WhenThereIsNotImage_ReturnsBadRequest()
        {           
            var propertyId = 1;
            IFormFile imageFileMock = null;
          
            var result = await _propertyImageController.UploadImage(propertyId, imageFileMock);
          
            var badRequestResult = result as BadRequestObjectResult;
            Assert.IsNotNull(badRequestResult); 
            Assert.AreEqual(400, badRequestResult.StatusCode);
            var apiReturn = badRequestResult.Value as ServiceErrorResponse;
            Assert.AreEqual("No image file uploaded.", apiReturn.Message);
            Assert.AreEqual("No image file uploaded.", apiReturn.Detailed);
            Assert.AreEqual(StatusCodes.Status400BadRequest, apiReturn.StatusCode);
        }

        [Test]
        public async Task DeleteImage_ReturnsOkResult()
        {            
            var propertyImageId = 1;
            _imageServiceMock.Setup(x => x.RemovePropertyImageAsync(propertyImageId)).Returns(Task.CompletedTask); 
           
            var result = await _propertyImageController.DeleteImage(propertyImageId);
           
            var okResult = result as OkResult;
            Assert.IsNotNull(okResult); 
            Assert.AreEqual(200, okResult.StatusCode); 
        }
    }
}
