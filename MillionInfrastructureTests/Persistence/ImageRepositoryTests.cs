using Microsoft.EntityFrameworkCore;
using MillionDomain.Entities;
using MillionInfrastructure.Persistence;
using Moq;
using Moq.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionInfrastructureTests.Persistence
{
    public class ImageRepositoryTests
    {
        private MillionDbContext _dbContext;
        private ImageRepository _imageRepository;

        [SetUp]
        public void Setup()
        {           
            var options = new DbContextOptionsBuilder<MillionDbContext>()
                .UseInMemoryDatabase(databaseName: System.Guid.NewGuid().ToString())
                .Options;

            _dbContext = new MillionDbContext(options);           
            _dbContext.PropertyImages.AddRange(new List<PropertyImage>
            {
                new PropertyImage { IdPropertyImage = 1, IdProperty = 1, File = "image1.jpg", Enabled = true },
                new PropertyImage { IdPropertyImage = 2, IdProperty = 1, File = "image2.jpg", Enabled = true }
            });
            _dbContext.SaveChanges();
           
            _imageRepository = new ImageRepository(_dbContext);
        }

        [TearDown]
        public void TearDown()
        {           
            _dbContext.Dispose();
        }

        [Test]
        public async Task AddAsync_AddImage()
        {          
            var newImage = new PropertyImage { IdPropertyImage = 3, IdProperty = 1, File = "image3.jpg", Enabled = true };
            
            var result = await _imageRepository.AddAsync(newImage);
          
            Assert.IsNotNull(result);
            Assert.AreEqual(newImage.IdPropertyImage, result.IdPropertyImage);
            Assert.AreEqual(3, _dbContext.PropertyImages.Count());

            var imageSaved = _dbContext.PropertyImages.Find(result.IdPropertyImage);
            Assert.AreEqual(newImage.IdProperty, imageSaved.IdProperty);
            Assert.AreEqual(newImage.File, imageSaved.File);
            Assert.AreEqual(newImage.Enabled, imageSaved.Enabled);
        }

        [Test]
        public async Task DeleteAsync_RemoveImage()
        {          
            int imageIdToDelete = 1;
           
            await _imageRepository.DeleteAsync(imageIdToDelete);
           
            var deletedImage = await _dbContext.PropertyImages.FindAsync(imageIdToDelete);
            Assert.IsNull(deletedImage);
        }

        [Test]
        public async Task GetByIdAsync_ReturnImage_WhenImageExists()
        {          
            int existingImageId = 1;
          
            var result = await _imageRepository.GetByIdAsync(existingImageId);
         
            Assert.IsNotNull(result);
            Assert.AreEqual(existingImageId, result.IdPropertyImage);
        }

        [Test]
        public async Task GetByIdAsync_ReturnNull_WhenImageDoesNotExist()
        {           
            int nonExistingImageId = 99;
           
            var result = await _imageRepository.GetByIdAsync(nonExistingImageId);
           
            Assert.IsNull(result);
        }
    }
}
