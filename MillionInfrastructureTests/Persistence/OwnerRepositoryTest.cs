using Microsoft.EntityFrameworkCore;
using MillionApplication.Services;
using MillionDomain.Entities;
using MillionInfrastructure.Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionInfrastructureTests.Persistence
{
    public class OwnerRepositoryTest
    {
        private MillionDbContext _dbContext;
        private OwnerRepository _ownerRepository;

        [SetUp]
        public void Setup()
        {
            var options = new DbContextOptionsBuilder<MillionDbContext>()
                .UseInMemoryDatabase(databaseName: System.Guid.NewGuid().ToString())
                .Options;

            _dbContext = new MillionDbContext(options);
            _dbContext.Owners.AddRange(new List<Owner>
            {
                new Owner()
                {
                    Address = "123, fake city",
                    Birthday = new DateTime(2020,02,10),
                    Name = "John Doe",
                    Photo = "http://fake-image-storage/profile1"
                },
                  new Owner()
                {
                    Address = "111, fake Avenue",
                    Birthday = new DateTime(2000,04,18),
                    Name = "Lia Doe",
                    Photo = "http://fake-image-storage/profile2"
                }

            });
            _dbContext.SaveChanges();

            _ownerRepository = new OwnerRepository(_dbContext);
        }

        [TearDown]
        public void TearDown()
        {
            _dbContext.Dispose();
        }

        [Test]
        public async Task AddAsync_AddOwner()
        {
            var newOwner = new Owner()
            {
                Address = "444, fake street",
                Birthday = new DateTime(1995, 09, 28),
                Name = "Nataly Smith",
                Photo = "http://fake-image-storage/profile3"
            };

            var result = await _ownerRepository.AddAsync(newOwner);

            Assert.IsNotNull(result);
            Assert.AreEqual(newOwner.IdOwner, result.IdOwner);
            Assert.AreEqual(3, _dbContext.Owners.Count());

            var imageSaved = _dbContext.Owners.Find(result.IdOwner);
            Assert.AreEqual(newOwner.Name, imageSaved.Name);
            Assert.AreEqual(newOwner.Birthday, imageSaved.Birthday);
            Assert.AreEqual(newOwner.Address, imageSaved.Address);
            Assert.AreEqual(newOwner.Photo, imageSaved.Photo);           
        }

        [Test]
        public async Task DeleteAsync_RemoveOwner()
        {
            int imageIdToDelete = 1;

            await _ownerRepository.DeleteAsync(imageIdToDelete);

            var deletedOwner = await _dbContext.Owners.FindAsync(imageIdToDelete);
            Assert.IsNull(deletedOwner);
        }

        [Test]
        public async Task GetByIdAsync_ReturnOwner_WhenOwnerExists()
        {
            int existingOwnerId = 1;

            var result = await _ownerRepository.GetByIdAsync(existingOwnerId);

            Assert.IsNotNull(result);
            Assert.AreEqual(existingOwnerId, result.IdOwner);
        }

        [Test]
        public async Task GetByIdAsync_ReturnNull_WhenOwnerDoesNotExist()
        {
            int nonExistingOwnerId = 99;

            var result = await _ownerRepository.GetByIdAsync(nonExistingOwnerId);

            Assert.IsNull(result);
        }

        [Test]
        public async Task ListAsync_VerifyOwnerCount()
        {        
            var result = await _ownerRepository.ListAsync();

            Assert.AreEqual(2, result.Count());
        }

        [Test]
        public async Task UpdateAsync_VerifyChanges()
        {
            var updateInput = new Owner()
            {
                IdOwner = 2,
                Address = "444, street",
                Birthday = new DateTime(2000, 02, 10),
                Name = "John Doe edited",
                Photo = "http://fake-image-storage/profile1-edited"
            };
            await _ownerRepository.UpdateAsync(updateInput);

            var ownerUpdated = _dbContext.Owners.Find(2);

            Assert.IsNotNull(ownerUpdated);
            Assert.AreEqual(updateInput.Name, ownerUpdated.Name);
            Assert.AreEqual(updateInput.Birthday, ownerUpdated.Birthday);
            Assert.AreEqual(updateInput.Address, ownerUpdated.Address);
            Assert.AreEqual(updateInput.Photo, ownerUpdated.Photo);
        }


        [Test]
        public async Task UpdateAsync_ThrowExceptionWhenOwnerNotFound()
        {
            var updateInput = new Owner()
            {
                IdOwner = 999,
                Address = "444, street",
                Birthday = new DateTime(2000, 02, 10),
                Name = "John Doe edited",
                Photo = "http://fake-image-storage/profile1-edited"
            };  

            var exception = Assert.ThrowsAsync<InvalidOperationException>(() => _ownerRepository.UpdateAsync(updateInput));

            Assert.That(exception.Message, Is.EqualTo("Owner with Id 999 not found."));
        }
    }
}
