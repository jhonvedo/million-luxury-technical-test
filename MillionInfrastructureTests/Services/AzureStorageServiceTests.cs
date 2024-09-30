using Azure;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using MillionInfrastructure.Services;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionInfrastructureTests.Services
{
    public class AzureStorageServiceTests
    {
        private Mock<BlobServiceClient> _mockBlobServiceClient;
        private Mock<BlobContainerClient> _mockContainerClient;
        private Mock<BlobClient> _mockBlobClient;
        private AzureStorageService _service;
        private AzureStorageSettings settings = new AzureStorageSettings
        {
            ConnectionString = "UseDevelopmentStorage=true",
            ContainerName = "test-container"
        };

        [SetUp]
        public void Setup()
        {
          
            _mockBlobServiceClient = new Mock<BlobServiceClient>();
            _mockContainerClient = new Mock<BlobContainerClient>();
            _mockBlobClient = new Mock<BlobClient>(); 

            _mockBlobServiceClient
                .Setup(x => x.GetBlobContainerClient(settings.ContainerName))
                .Returns(_mockContainerClient.Object);
          
            _service = new AzureStorageService(settings, _mockBlobServiceClient.Object);
        }

        [Test]
        public async Task SaveImageAsync_ShouldUploadImageAndReturnUri()
        {
          
            var imageData = new byte[] { 1, 2, 3, 4, 5 };
            var fileName = "test-image.jpg";

           
            _mockContainerClient
                .Setup(x => x.CreateIfNotExistsAsync(It.IsAny<PublicAccessType>(), It.IsAny<IDictionary<string, string>>(), It.IsAny<CancellationToken>() ))
                .ReturnsAsync(It.IsAny<Response<BlobContainerInfo>>);

            _mockContainerClient
                .Setup(x => x.GetBlobClient(fileName))
                .Returns(_mockBlobClient.Object);

            _mockBlobClient.Setup(m => m.Uri).Returns(new Uri("http://www.blob.mocktest/test-container/test-image.jpg"));

            _mockBlobClient
                .Setup(x => x.UploadAsync(It.IsAny<Stream>(), true, It.IsAny<CancellationToken>()))
                .ReturnsAsync(It.IsAny<Response<BlobContentInfo>>);

            var result = await _service.SaveImageAsync(imageData, fileName);

            Assert.NotNull(result);
            Assert.That(result, Does.Contain(fileName));
            _mockBlobClient.Verify(x => x.UploadAsync(It.IsAny<Stream>(), true, It.IsAny<CancellationToken>()), Times.Once);

            _mockBlobServiceClient
               .Verify(x => x.GetBlobContainerClient(settings.ContainerName), Times.Once);
        }

        [Test]
        public async Task DeleteImageAsync_ShouldDeleteImage()
        {           
            var fileName = "test-image.jpg";
         
            _mockContainerClient
                .Setup(x => x.GetBlobClient(fileName))
                .Returns(_mockBlobClient.Object);
           
            _mockBlobClient
                .Setup(x => x.DeleteIfExistsAsync(It.IsAny<DeleteSnapshotsOption>(), It.IsAny<BlobRequestConditions>(), It.IsAny<CancellationToken>()))
                .ReturnsAsync(It.IsAny<Response<bool>>);

            await _service.DeleteImageAsync(fileName);

            _mockBlobClient.Verify(x => x.DeleteIfExistsAsync(It.IsAny<DeleteSnapshotsOption>(), It.IsAny<BlobRequestConditions>(), It.IsAny<CancellationToken>()), Times.Once);
            _mockBlobServiceClient.Verify(x => x.GetBlobContainerClient(settings.ContainerName), Times.Once);
        }

        [Test]
        public async Task DeleteImageAsync_ShouldDeleteImageWithCustomContainer()
        {         
            var containerName = "other-container";
            var fileName = "test-image.jpg";

            _mockContainerClient
                .Setup(x => x.GetBlobClient(fileName))
                .Returns(_mockBlobClient.Object);

            _mockBlobServiceClient
             .Setup(x => x.GetBlobContainerClient(containerName))
             .Returns(_mockContainerClient.Object);

            _mockBlobClient
                .Setup(x => x.DeleteIfExistsAsync(It.IsAny<DeleteSnapshotsOption>(), It.IsAny<BlobRequestConditions>(), It.IsAny<CancellationToken>()))
                .ReturnsAsync(It.IsAny<Response<bool>>);

            await _service.DeleteImageAsync(containerName, fileName);

            _mockBlobClient.Verify(x => x.DeleteIfExistsAsync(It.IsAny<DeleteSnapshotsOption>(), It.IsAny<BlobRequestConditions>(), It.IsAny<CancellationToken>()), Times.Once);
            _mockBlobServiceClient.Verify(x => x.GetBlobContainerClient(containerName), Times.Once);
        }
    }
}
