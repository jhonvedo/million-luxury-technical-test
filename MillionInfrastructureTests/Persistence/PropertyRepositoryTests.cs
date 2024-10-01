using Microsoft.EntityFrameworkCore;
using MillionApplication.Interfaces;
using MillionDomain.Entities;
using MillionDomain.Specifications;
using MillionInfrastructure.Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionInfrastructureTests.Persistence
{
    public class PropertyRepositoryTests
    {
        private MillionDbContext _dbContext;
        private PropertyRepository _propertyRepository;

        [SetUp]
        public void Setup()
        {
            var options = new DbContextOptionsBuilder<MillionDbContext>()
                .UseInMemoryDatabase(databaseName: System.Guid.NewGuid().ToString())
                .Options;

            _dbContext = new MillionDbContext(options);
            _dbContext.Owners.Add(new Owner()
            {
                Photo = "http://fake-images-storage/img1",
                Address = "123, Fake city",
                Birthday = new DateTime(1990,11,8),
                Name = "John Doe"
            });
            _dbContext.Properties.AddRange(new List<Property>
            {
                new Property()
                {
                    Address = "111, Fake av",
                    IdOwner = 1,
                    CodeInternal = "NX-001",
                    Name = "Building Dreams",
                    Price = 25000,
                    Year = 2024,
                    PropertyImages = new List<PropertyImage>()
                    {
                        new PropertyImage()
                        {
                            Enabled = true,
                            File = "http://fake-images-storage/prf1"                            
                        }
                    },
                    PropertyTraces = new List<PropertyTrace>()
                    {
                        new PropertyTrace() {
                            DateSale = new DateTime(2020,01,15),
                            Name = "sale 2",
                            Tax = 10.16m,
                            Value = 22000

                        },
                        new PropertyTrace() {
                            DateSale = new DateTime(2000,01,15),
                            Name = "sale 1",
                            Tax = 8.9m,
                            Value = 20000

                        }
                    }
                }
            });
            _dbContext.SaveChanges();

            _propertyRepository = new PropertyRepository(_dbContext);
        }

        [TearDown]
        public void TearDown()
        {
            _dbContext.Dispose();
        }


        [Test]
        public async Task GetByIdAsync_VerifyRelationship()
        {        
            var existingProperty = await _propertyRepository.GetByIdAsync(1);

            Assert.IsNotNull(existingProperty);
            Assert.IsNotNull(existingProperty.Owner);
            Assert.IsNotNull(existingProperty.PropertyImages);
            Assert.IsNotNull(existingProperty.PropertyTraces);

            Assert.AreEqual(1, existingProperty.PropertyImages.Count);
            Assert.AreEqual(2, existingProperty.PropertyTraces.Count);

        }

        [Test]
        public async Task ListAsync_VerifyPropertiesCount()
        {
            var existingProperties = await _propertyRepository.ListAsync();

            Assert.AreEqual(1, existingProperties.Count()); 
        }


        [Test]
        public async Task AddAsync_AddProperty()
        {
            var newProperty = new Property {
                Address = "222, Fake av",
                IdOwner = 1,
                CodeInternal = "NX-002",
                Name = "Building Red",
                Price = 30000,
                Year = 2020
            };

            var result = await _propertyRepository.AddAsync(newProperty);

            Assert.IsNotNull(result);
            Assert.AreEqual(newProperty.IdProperty, result.IdProperty);
            Assert.AreEqual(2, _dbContext.Properties.Count());

            var propertySaved = _dbContext.Properties.Find(result.IdProperty);
           
            Assert.AreEqual(newProperty.Address, propertySaved.Address);
            Assert.AreEqual(newProperty.IdOwner, propertySaved.IdOwner);
            Assert.AreEqual(newProperty.CodeInternal, propertySaved.CodeInternal);
            Assert.AreEqual(newProperty.Name, propertySaved.Name);
            Assert.AreEqual(newProperty.Price, propertySaved.Price);
            Assert.AreEqual(newProperty.Year, propertySaved.Year);
        }

        [Test]
        public async Task DeleteAsync_RemoveProperty()
        {
            int imageIdToDelete = 1;

            await _propertyRepository.DeleteAsync(imageIdToDelete);

            var deletedProperty = await _dbContext.Properties.FindAsync(imageIdToDelete);
            Assert.IsNull(deletedProperty);
        }

        [Test]
        public async Task GetByIdAsync_ReturnProperty_WhenPropertyExists()
        {
            int existingPropertyId = 1;

            var result = await _propertyRepository.GetByIdAsync(existingPropertyId);

            Assert.IsNotNull(result);
            Assert.AreEqual(existingPropertyId, result.IdProperty);
        }

        [Test]
        public async Task GetByIdAsync_ReturnNull_WhenPropertyDoesNotExist()
        {
            int nonExistingPropertyId = 99;

            var result = await _propertyRepository.GetByIdAsync(nonExistingPropertyId);

            Assert.IsNull(result);
        }

        [Test]
        public async Task GetAllAsync_VerifyCriteria()
        {
            _dbContext.Owners.Add(new Owner()
            {
                Photo = "http://fake-images-storage/img2",
                Address = "123, Fake city",
                Birthday = new DateTime(1990, 11, 8),
                Name = "Lin Smith"
            });
            _dbContext.SaveChanges();

            await _propertyRepository.AddAsync(new Property//IdProperty = 2
            {
                Address = "222, Fake av",
                IdOwner = 1,
                CodeInternal = "NX-002",
                Name = "Building Red 1",
                Price = 10000,
                Year = 1990
            });

            await _propertyRepository.AddAsync(new Property//IdProperty = 3
            {
                Address = "222, Fake street",
                IdOwner = 1,
                CodeInternal = "NX-003",
                Name = "Building Red 2",
                Price = 20000,
                Year = 2000
            });


            await _propertyRepository.AddAsync(new Property//IdProperty = 4
            {
                Address = "new avenue",
                IdOwner = 1,
                CodeInternal = "NX-004",
                Name = "Building Red 3",
                Price = 30000,
                Year = 2010
            });


            await _propertyRepository.AddAsync(new Property//IdProperty = 5
            {
                Address = "444, fake street",
                IdOwner = 2,
                CodeInternal = "NX-005",
                Name = "a Building Red",
                Price = 30000,
                Year = 2020
            });
          


            await _propertyRepository.DeleteAsync(1);
            var result1 = await _propertyRepository.GetAllAsync(new PropertyFilterSpecification(location: "fake"));
            Assert.IsNotNull(result1);
            Assert.AreEqual(3, result1.Count());
            Assert.True(result1.Select(p => p.IdProperty).SequenceEqual(new List<int> { 2,3,5 }));


            var result2 = await _propertyRepository.GetAllAsync(new PropertyFilterSpecification(minPrice: 20000));
            Assert.IsNotNull(result2);
            Assert.AreEqual(3, result2.Count());
            Assert.True(result2.Select(p => p.IdProperty).SequenceEqual(new List<int> { 3, 4, 5 }));

            var result3 = await _propertyRepository.GetAllAsync(new PropertyFilterSpecification(maxPrice: 20000));
            Assert.IsNotNull(result3);
            Assert.AreEqual(2, result3.Count());
            Assert.True(result3.Select(p => p.IdProperty).SequenceEqual(new List<int> { 2, 3 }));

            var result4 = await _propertyRepository.GetAllAsync(new PropertyFilterSpecification(yearBuilt: 1990));
            Assert.IsNotNull(result4);
            Assert.AreEqual(1, result4.Count());
            Assert.AreEqual(2, result4.FirstOrDefault().IdProperty);

            var result5 = await _propertyRepository.GetAllAsync(new PropertyFilterSpecification(ownerName: "smith"));
            Assert.IsNotNull(result5);
            Assert.AreEqual(1, result5.Count());
            Assert.AreEqual(5, result5.FirstOrDefault().IdProperty);

            var result6 = await _propertyRepository.GetAllAsync(new PropertyFilterSpecification(internalCode: "NX-004"));
            Assert.IsNotNull(result6);
            Assert.AreEqual(1, result6.Count());
            Assert.AreEqual(4, result6.FirstOrDefault().IdProperty);


            var paginationFilter7 = new PropertyFilterSpecification();
            paginationFilter7.AddPagination(0, 2);
            var result7 = await _propertyRepository.GetAllAsync(paginationFilter7);
            Assert.IsNotNull(result7);
            Assert.AreEqual(2, result7.Count());
            Assert.True(result7.Select(p => p.IdProperty).SequenceEqual(new List<int> { 2, 3 }));


            var paginationFilter8 = new PropertyFilterSpecification();
            paginationFilter8.AddOrderBy(x => x.Name);
            var result8 = await _propertyRepository.GetAllAsync(paginationFilter8);
            Assert.IsNotNull(result8);
            Assert.AreEqual(4, result8.Count());
            Assert.True(result8.Select(p => p.IdProperty).SequenceEqual(new List<int> { 5, 2, 3, 4 }));


            var paginationFilter9 = new PropertyFilterSpecification();
            paginationFilter9.AddOrderByDescending(x => x.Year);
            var result9 = await _propertyRepository.GetAllAsync(paginationFilter9);
            Assert.IsNotNull(result9);
            Assert.AreEqual(4, result9.Count());
            Assert.True(result9.Select(p => p.IdProperty).SequenceEqual(new List<int> { 5, 4, 3, 2 }));

        }


        [Test]
        public async Task UpdateAsync_VerifyChanges()
        {
            var updateInput = new Property()
            {
                IdProperty = 1,
                Address = "111, Fake V2",
                IdOwner = 1,
                CodeInternal = "NX-001 V2",
                Name = "Building Dreams V2",
                Price = 2000,
                Year = 2000
            };
            await _propertyRepository.UpdateAsync(updateInput);

            var propertyUpdated = _dbContext.Properties.Find(1);

            Assert.IsNotNull(propertyUpdated);
            Assert.AreEqual(updateInput.Address, propertyUpdated.Address);
            Assert.AreEqual(updateInput.IdOwner, propertyUpdated.IdOwner);
            Assert.AreEqual(updateInput.CodeInternal, propertyUpdated.CodeInternal);
            Assert.AreEqual(updateInput.Name, propertyUpdated.Name);
            Assert.AreEqual(updateInput.Price, propertyUpdated.Price);
            Assert.AreEqual(updateInput.Year, propertyUpdated.Year);
        }


        [Test]
        public async Task UpdateAsync_ThrowExceptionWhenOwnerNotFound()
        {
            var updateInput = new Property()
            {
                IdProperty = 99,
                Address = "111, Fake V2",
                IdOwner = 1,
                CodeInternal = "NX-001 V2",
                Name = "Building Dreams V2",
                Price = 2000,
                Year = 2000
            };

            var exception = Assert.ThrowsAsync<InvalidOperationException>(() => _propertyRepository.UpdateAsync(updateInput));

            Assert.That(exception.Message, Is.EqualTo("Property with Id 99 not found."));
        }
    }
}

