using MillionApplication.Interfaces;
using MillionApplication.Services;
using MillionCore.Entities;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Test.Services
{
    public class ImageServiceTests
    {


        [Test]
        public async Task AddPropertyImageTestAsync()
        {
            var fakeFilePath = "/images/fakeImage.jpg";
            var propertyId = 1;
            var idPropertyImage = 10;
            var imageBytes = new byte[] { 1, 2, 3 }; 
            var fileName = "fakeImage.jpg";
            var fakePropertyImage = new PropertyImage
            {
                IdProperty = propertyId,
                IdPropertyImage = idPropertyImage,
                File = fakeFilePath,
                Enabled = true
            };

            Mock<IImageStorageService> imageStorageServideMock = new Mock<IImageStorageService>();
            Mock<IImageRepository> imageRepositoryMock = new Mock<IImageRepository>();


            imageStorageServideMock
            .Setup(service => service.SaveImageAsync(imageBytes, fileName))
            .ReturnsAsync(fakeFilePath);            

            imageRepositoryMock
                .Setup(repo => repo.AddAsync(It.IsAny<PropertyImage>()))
                .ReturnsAsync(fakePropertyImage);

            ImageService imageService = new ImageService(imageStorageServideMock.Object, imageRepositoryMock.Object);


            var savedImage = await imageService.AddPropertyImageAsync(propertyId, imageBytes, fileName);


            imageStorageServideMock.Verify(repo => repo.SaveImageAsync(imageBytes, fileName), Times.Once);

            imageRepositoryMock.Verify(repo => repo.AddAsync(It.Is<PropertyImage>(
            image => image.IdProperty == propertyId &&
                     image.File == fakeFilePath &&
                     image.Enabled == true
            )), Times.Once);     

            Assert.That(savedImage.IdPropertyImage,Is.EqualTo(idPropertyImage));
            Assert.That(savedImage.File, Is.EqualTo(fakeFilePath));
            Assert.True(savedImage.Enabled);
           
        }



        [Test]
        public async Task RemovePropertyImageWhenNotExist()
        {
           
            var idPropertyImage = 10;           
            Mock<IImageRepository> imageRepositoryMock = new Mock<IImageRepository>();
            Mock<IImageStorageService> imageStorageServideMock = new Mock<IImageStorageService>();

            imageRepositoryMock
                .Setup(repo => repo.GetByIdAsync(idPropertyImage))
                .ReturnsAsync((PropertyImage)null);

            ImageService imageService = new ImageService(imageStorageServideMock.Object, imageRepositoryMock.Object);


            await imageService.RemovePropertyImageAsync(idPropertyImage);

            imageStorageServideMock.Verify(repo => repo.DeleteImageAsync(It.IsAny<string>(), It.IsAny<string>()), Times.Never);

            imageRepositoryMock.Verify(repo => repo.GetByIdAsync(idPropertyImage), Times.Once);

        }



        [Test]
        public async Task RemovePropertyImageWhenExist()
        {
            var fakeFilePath = "https://fake.blob.core.windows.net/images/dog.jpg";
            var propertyId = 1;
            var containerName = "images";//same of the fakeFilePath
            var idPropertyImage = 10;
            var imageBytes = new byte[] { 1, 2, 3 };
            var fileName = "dog.jpg";//same of the fakeFilePath
            var fakePropertyImage = new PropertyImage
            {
                IdProperty = propertyId,
                IdPropertyImage = idPropertyImage,
                File = fakeFilePath,
                Enabled = true
            };

            Mock<IImageStorageService> imageStorageServideMock = new Mock<IImageStorageService>();
            Mock<IImageRepository> imageRepositoryMock = new Mock<IImageRepository>();

            imageRepositoryMock
               .Setup(repo => repo.GetByIdAsync(idPropertyImage))
               .ReturnsAsync(fakePropertyImage);

            imageStorageServideMock
            .Setup(service => service.DeleteImageAsync(containerName, fileName));

            ImageService imageService = new ImageService(imageStorageServideMock.Object, imageRepositoryMock.Object);

            await imageService.RemovePropertyImageAsync(idPropertyImage);


            imageRepositoryMock.Verify(repo => repo.GetByIdAsync(idPropertyImage), Times.Once);
            imageStorageServideMock.Verify(repo => repo.DeleteImageAsync(containerName, fileName), Times.Once);


        }


    }
}
