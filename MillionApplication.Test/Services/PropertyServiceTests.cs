using AutoMapper;
using AutoMapper.Execution;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;
using MillionApplication.Mapping;
using MillionApplication.Services;
using MillionCore.Entities;
using MillionCore.Specifications;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MillionApplication.Test.Services
{
    public class PropertyServiceTests
    {


        private readonly IMapper _mapper;

        public PropertyServiceTests()
        {            
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new MillionMappingProfile()); 
            });
            _mapper = config.CreateMapper();
        }

        [Test]
        public async Task GetPropertyByIdWhenNotExistTest()
        {           

            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
               .Setup(repo => repo.GetByIdAsync(2))
               .ReturnsAsync((Property)null);



            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);
            var propertyResponse = await propertyService.GetPropertyByIdAsync(1);

            propertyRepositoryMock.Verify(x=> x.GetByIdAsync(1), Times.Once);

            Assert.IsNull(propertyResponse);



        }

        [Test]
        public async Task GetPropertyByIdAsync_ShouldReturnAllPropertyMappedWithPropertyDTO()
        {

            Property property = new Property()
            {
                IdProperty = 1,
                Address = "Fake city, 123",
                CodeInternal = "RX001",
                Name = "dreams building",
                Price = 22000000,
                Year = 2024,
                IdOwner = 100,
                Owner = new Owner()
                {
                    IdOwner = 100,
                    Address = "123 street",
                    Name = "John Doe",
                    Birthday = new DateTime(1990,11,10),
                    Photo = "https://fake.blob.core.windows.net/images/john-doe.jpg"
                },
                PropertyImages = new List<PropertyImage>() { 
                    new PropertyImage()
                    {
                        Enabled = true,
                        File = "https://fake.blob.core.windows.net/images/property1-1.jpg",
                        IdPropertyImage = 1,
                        IdProperty = 1                        
                    },
                    new PropertyImage()
                    {
                        Enabled = false,
                        File = "https://fake.blob.core.windows.net/images/property1-2.jpg",
                        IdPropertyImage = 2,
                        IdProperty = 1
                    }
                },
                PropertyTraces = new List<PropertyTrace>() { 
                    new PropertyTrace()
                    {
                        Value = 20000,
                        Tax = 10.25m,
                        Name = "dreams",
                        DateSale = new DateTime(2021,05,04),
                        IdPropertyTrace = 1,
                        IdProperty = 1
                    },
                    new PropertyTrace()
                    {
                        Value = 22000,
                        Tax = 8.25m,
                        Name = "dreams 1",
                        DateSale = new DateTime(2021,10,15),
                        IdPropertyTrace = 2,
                        IdProperty = 1
                    }

                },

            };

            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
               .Setup(repo => repo.GetByIdAsync(property.IdProperty))
               .ReturnsAsync(property);



            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);


            var propertyResponse = await propertyService.GetPropertyByIdAsync(property.IdProperty);
            propertyRepositoryMock.Verify(x => x.GetByIdAsync(property.IdProperty), Times.Once);


            Assert.IsNotNull(propertyResponse);
            Assert.That(propertyResponse.Name, Is.EqualTo(property.Name));
            Assert.That(propertyResponse.CodeInternal, Is.EqualTo(property.CodeInternal));
            Assert.That(propertyResponse.Price, Is.EqualTo(property.Price));
            Assert.That(propertyResponse.Address, Is.EqualTo(property.Address));
            Assert.That(propertyResponse.IdOwner, Is.EqualTo(property.IdOwner));
            Assert.That(propertyResponse.Year, Is.EqualTo(property.Year));

            Assert.IsNotNull(propertyResponse.Owner);
            Assert.That(propertyResponse.Owner.IdOwner, Is.EqualTo(property.Owner.IdOwner));
            Assert.That(propertyResponse.Owner.Name, Is.EqualTo(property.Owner.Name));
            Assert.That(propertyResponse.Owner.Address, Is.EqualTo(property.Owner.Address));
            Assert.That(propertyResponse.Owner.Birthday, Is.EqualTo(property.Owner.Birthday));
            Assert.That(propertyResponse.Owner.Photo, Is.EqualTo(property.Owner.Photo));


            Assert.IsNotNull(propertyResponse.Images);
            Assert.That(propertyResponse.Images.Count, Is.EqualTo(2));

            for (int i = 0; i < propertyResponse.Images.Count(); i++)
            {
                Assert.That(propertyResponse.Images.ElementAt(i).File, Is.EqualTo(property.PropertyImages.ElementAt(i).File));
                Assert.That(propertyResponse.Images.ElementAt(i).Enabled, Is.EqualTo(property.PropertyImages.ElementAt(i).Enabled));
                Assert.That(propertyResponse.Images.ElementAt(i).IdPropertyImage, Is.EqualTo(property.PropertyImages.ElementAt(i).IdPropertyImage));
            }

            Assert.IsNotNull(propertyResponse.Traces);
            Assert.That(propertyResponse.Traces.Count, Is.EqualTo(2));
            for (int i = 0; i < propertyResponse.Traces.Count(); i++)
            {
                Assert.That(propertyResponse.Traces.ElementAt(i).IdPropertyTrace, Is.EqualTo(property.PropertyTraces.ElementAt(i).IdPropertyTrace));
                Assert.That(propertyResponse.Traces.ElementAt(i).Value, Is.EqualTo(property.PropertyTraces.ElementAt(i).Value));
                Assert.That(propertyResponse.Traces.ElementAt(i).Tax, Is.EqualTo(property.PropertyTraces.ElementAt(i).Tax));
                Assert.That(propertyResponse.Traces.ElementAt(i).Name, Is.EqualTo(property.PropertyTraces.ElementAt(i).Name));
                Assert.That(propertyResponse.Traces.ElementAt(i).DateSale, Is.EqualTo(property.PropertyTraces.ElementAt(i).DateSale));
            }

        }

        [Test]
        public async Task UpdatePropertyAsync_ShouldReturnNull_WhenPropertyNotExist()
        {
            PropertyDto property = new PropertyDto()
            {
                IdProperty = 1,
                Address = "Fake city, 123",
                CodeInternal = "RX001",
                Name = "dreams building",
                Price = 22000000,
                Year = 2024,
                IdOwner = 100
            };


            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
               .Setup(repo => repo.GetByIdAsync(1))
               .ReturnsAsync((Property)null);

            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);

            var updateResult = await propertyService.UpdatePropertyAsync(property);

            Assert.IsNull(updateResult);


        }

        [Test]
        public async Task UpdatePropertyAsync_ShouldReturnUpdatedProperty_AndVerifyUpdateInput()
        {
          

            var propertyBeforeUpdate = new Property
            {
                IdProperty = 1,
                Name = "Old Name",
                Address = "Old Address",
                CodeInternal = "Old Code",
                Price=1000,
                Year = 1990,
                IdOwner = 1
            };

            var updateModel = new PropertyDto
            {
                IdProperty = 1,               
                Name = "New Name",
                Address = "New Address",
                CodeInternal = "New Code",
                Price = 2000,
                Year = 2022,
                IdOwner = 2
            };

            var propertyAfterUpdate = new Property
            {
                IdProperty = 1,
                Name = "New Name",
                Address = "New Address",
                CodeInternal = "New Code",
                Price = 1000,
                Year = 2022,
                IdOwner = 2
            };


            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
               .SetupSequence(repo => repo.GetByIdAsync(1))
               .ReturnsAsync(propertyBeforeUpdate)
               .ReturnsAsync(propertyAfterUpdate);

            propertyRepositoryMock.Setup(repo => repo.UpdateAsync(It.IsAny<Property>()))
               .ReturnsAsync(propertyAfterUpdate);

            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);

            var updateResult = await propertyService.UpdatePropertyAsync(updateModel);

            Assert.IsNotNull(updateResult);


            Assert.That(updateResult.Name, Is.EqualTo("New Name"));
            Assert.That(updateResult.Address, Is.EqualTo("New Address"));
            Assert.That(updateResult.CodeInternal, Is.EqualTo("New Code"));
            Assert.That(updateResult.Year, Is.EqualTo(2022));
            Assert.That(updateResult.IdOwner, Is.EqualTo(2));
            Assert.That(updateResult.Price, Is.EqualTo(1000));//don't change price


            propertyRepositoryMock.Verify(repo => repo.GetByIdAsync(It.IsAny<int>()), Times.Exactly(2));        
            propertyRepositoryMock.Verify(repo => repo.UpdateAsync(It.Is<Property>(p =>
                p.IdProperty == 1 &&
                p.Name == "New Name" &&
                p.Address == "New Address" &&
                p.CodeInternal == "New Code" &&
                p.Year == 2022 &&
                p.Price == 1000 &&
                p.IdOwner == 2
            )), Times.Once());
        }

        [Test]
        public async Task ChangePropertyPriceAsync_ShouldReturnUpdatedProperty_AndVerifyPriceChanges()
        {


            var propertyBeforeUpdate = new Property
            {
                IdProperty = 1,
                Name = "Old Name",
                Address = "Old Address",
                CodeInternal = "Old Code",
                Price = 1000,
                Year = 1990,
                IdOwner = 1
            };
          

            var propertyAfterUpdate = new Property
            {
                IdProperty = 1,
                Name = "Old Name",
                Address = "Old Address",
                CodeInternal = "Old Code",
                Price = 2000,
                Year = 1990,
                IdOwner = 1
            };


            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
               .SetupSequence(repo => repo.GetByIdAsync(1))
               .ReturnsAsync(propertyBeforeUpdate)
               .ReturnsAsync(propertyAfterUpdate);

            propertyRepositoryMock.Setup(repo => repo.UpdateAsync(It.IsAny<Property>()))
               .ReturnsAsync(propertyAfterUpdate);

            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);

            var updateResult = await propertyService.ChangePropertyPriceAsync(1, 2000);

            Assert.IsNotNull(updateResult);
            Assert.That(updateResult.Name, Is.EqualTo("Old Name"));
            Assert.That(updateResult.Address, Is.EqualTo("Old Address"));
            Assert.That(updateResult.CodeInternal, Is.EqualTo("Old Code"));
            Assert.That(updateResult.Year, Is.EqualTo(1990));
            Assert.That(updateResult.IdOwner, Is.EqualTo(1));
            Assert.That(updateResult.Price, Is.EqualTo(2000));


            propertyRepositoryMock.Verify(repo => repo.GetByIdAsync(It.IsAny<int>()), Times.Exactly(2));
            propertyRepositoryMock.Verify(repo => repo.UpdateAsync(It.Is<Property>(p =>
                p.IdProperty == 1 &&
                p.Name == "Old Name" &&
                p.Address == "Old Address" &&
                p.CodeInternal == "Old Code" &&
                p.Year == 1990 &&
                p.Price == 2000 && //verify UpdateAsync is called with the price changed 
                p.IdOwner == 1
            )), Times.Once());
        }

        [Test]
        public async Task ChangePropertyPriceAsync_ShouldReturnNull_WhenPropertyNotExist()
        {
            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
               .Setup(repo => repo.GetByIdAsync(1))
               .ReturnsAsync((Property)null);


            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);

            var updateResult = await propertyService.ChangePropertyPriceAsync(1, 2000);

            Assert.IsNull(updateResult);            
        }

        [Test]
        public void TaskCreatePropertyAsync_ShouldThrowException_IfInternalCodeAlreadyExist()
        {
            var existingProperty = new Property
            {
                IdProperty = 1,
                Name = "Old Name",
                Address = "Old Address",
                CodeInternal = "Old Code",
                Price = 1000,
                Year = 1990,
                IdOwner = 1
            };

            var newPropertyInput = new PropertyDto
            {                
                Name = "new Name",
                Address = "new Address",
                CodeInternal = "Old Code",
                Price = 1000,
                Year = 1990,
                IdOwner = 1
            };

            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
            .Setup(repo => repo.GetAllAsync(It.IsAny<PropertyFilterSpecification>()))
            .ReturnsAsync(new List<Property> { existingProperty });

            var filters = new PropertyFilterDto
            {
                Address = null,
                MinPrice = null,
                MaxPrice = null,
                OwnerName = null,
                Year = null,
                InternalCode = "Old Code"
            };

            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);


            var exception = Assert.ThrowsAsync<Exception>(() => propertyService.CreatePropertyAsync(newPropertyInput));
    
            Assert.That(exception.Message, Is.EqualTo("Internal code already exists"));

            // Verify GetAllAsync was called with existing internal code
            propertyRepositoryMock.Verify(repo => repo.GetAllAsync(It.Is<PropertyFilterSpecification>(spec =>
                 spec.Criteria.Count == 1 &&
                 AreCriteriaValid(spec, filters)
             )), Times.Once);
        }

        [Test]
        public async Task TaskCreatePropertyAsync_ShouldReturnPropertySaved_IfInternalCodeNotAlreadyExistAsync()
        {
            var existingProperty = new Property
            {
                IdProperty = 1,
                Name = "Old Name",
                Address = "Old Address",
                CodeInternal = "Old Code",
                Price = 1000,
                Year = 1990,
                IdOwner = 1
            };

            var newPropertyInput = new PropertyDto
            {
                Name = "new Name",
                Address = "new Address",
                CodeInternal = "new Code",
                Price = 1000,
                Year = 1990,
                IdOwner = 1
            };

            var newProperty = new Property
            {
                IdProperty = 2,
                Name = "new Name",
                Address = "new Address",
                CodeInternal = "new Code",
                Price = 1000,
                Year = 1990,
                IdOwner = 1
            };

            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
            .Setup(repo => repo.GetAllAsync(It.IsAny<PropertyFilterSpecification>()))
            .ReturnsAsync((List<Property>)null);

            propertyRepositoryMock.Setup(x=> x.AddAsync(It.IsAny<Property>()))
                .ReturnsAsync(newProperty);

            propertyRepositoryMock.Setup(x => x.GetByIdAsync(newProperty.IdProperty))
                .ReturnsAsync(newProperty);


            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);
            var propertySaved = await propertyService.CreatePropertyAsync(newPropertyInput);

            Assert.That(propertySaved.IdProperty, Is.EqualTo(2));
            Assert.That(propertySaved.Name, Is.EqualTo("new Name"));
            Assert.That(propertySaved.Address, Is.EqualTo("new Address"));
            Assert.That(propertySaved.CodeInternal, Is.EqualTo("new Code"));
            Assert.That(propertySaved.Price, Is.EqualTo(1000));
            Assert.That(propertySaved.Year, Is.EqualTo(1990));
            Assert.That(propertySaved.IdOwner, Is.EqualTo(1));

          
            propertyRepositoryMock.Verify(repo => repo.AddAsync(It.Is<Property>(prop =>
                 prop.Name.Equals("new Name") &&
                 prop.Address.Equals("new Address") &&
                 prop.CodeInternal.Equals("new Code") &&
                 prop.Price.Equals(1000) &&
                 prop.Year.Equals(1990) &&
                 prop.IdOwner.Equals(1) 


             )), Times.Once);
        }

        [Test]
        public async Task GetAllPropertiesAsync_ShouldReturnPropertiesMappedWithDTO_AndVerifyCriterias()
        {
            var existingProperty = new List<Property>() {
                new Property
                {
                    IdProperty = 1,
                    Name = "Old Name",
                    Address = "Old Address",
                    CodeInternal = "Old Code",
                    Price = 1000,
                    Year = 1990,
                    IdOwner = 1
                },
                new Property
                {
                    IdProperty = 1,
                    Name = "Old Name",
                    Address = "Old Address",
                    CodeInternal = "Old Code",
                    Price = 1000,
                    Year = 1990,
                    IdOwner = 1
                },
            };

            var filters = new PropertyFilterDto
            {
                Address = "123, Fake city",
                MinPrice = 10000,
                MaxPrice = 20000,
                OwnerName = "Mr. Smith",
                Year = 2024,
                InternalCode = "Old Code"
            };


            Mock<IPropertyRepository> propertyRepositoryMock = new Mock<IPropertyRepository>();

            propertyRepositoryMock
            .Setup(repo => repo.GetAllAsync(It.IsAny<PropertyFilterSpecification>()))
            .ReturnsAsync(existingProperty);



            PropertyService propertyService = new PropertyService(propertyRepositoryMock.Object, _mapper);
            var propertySaved = await propertyService.GetAllPropertiesAsync(filters);

            propertyRepositoryMock.Verify(repo => repo.GetAllAsync(It.Is<PropertyFilterSpecification>(spec =>
                  spec.Criteria.Count == 6 &&
                  AreCriteriaValid(spec, filters)
              )), Times.Once);
        }

        private bool AreCriteriaValid(PropertyFilterSpecification spec, PropertyFilterDto expectedFilters)
        {
            
            var expectedValues = new Dictionary<string, object>
            {
                { "Address", expectedFilters.Address },
                { "Price.GreaterThanOrEqual", expectedFilters.MinPrice },
                { "Price.LessThanOrEqual", expectedFilters.MaxPrice }, 
                { "CodeInternal", expectedFilters.InternalCode },
                { "Name", expectedFilters.OwnerName },
                { "Year", expectedFilters.Year }
            };

         
            foreach (var criterion in spec.Criteria)
            {
                var (propertyName, comparisonType) = GetPropertyNameFromCriteria(criterion);
                var propertyNameLabel = propertyName;
                if (comparisonType != null && (comparisonType == ExpressionType.GreaterThanOrEqual || comparisonType == ExpressionType.LessThanOrEqual))
                {
                    propertyNameLabel = $"{propertyName}.{comparisonType.ToString()}";
                }
                if (expectedValues.ContainsKey(propertyNameLabel))
                {
                    var expectedValue = expectedValues[propertyNameLabel];
                    if (!IsCorrectExpressionForProperty(criterion, propertyName, expectedValue))
                    {
                        return false; // return false if any criteria doesn't match
                    }
                }
            }

            return true; // all criteria match
        }

        private bool IsCorrectExpressionForProperty<T>(Expression<Func<Property, bool>> expression, string propertyName, T expectedValue)
        {
            if (expression.Body is MethodCallExpression methodCall)
            {
                // contains expressions
                if (methodCall.Method.Name == "Contains" && methodCall.Object is MemberExpression memberExpression)
                {
                    if (memberExpression.Member.Name == propertyName)
                    {
                        var value = ExtractValueFromExpression(methodCall.Arguments[0]);
                        return value.Equals(expectedValue.ToString());
                    }
                }
            }
            else if (expression.Body is BinaryExpression binaryExpression)
            {
                // binary expressions like >= , <= , ==
                if (binaryExpression.Left is MemberExpression memberExpression &&
                    memberExpression.Member.Name == propertyName)
                {
                    var value = ExtractValueFromExpression(binaryExpression.Right);
                    return value.Equals(expectedValue.ToString());
                }
            }

            return false;
        }
        private string ExtractValueFromExpression(Expression expression)
        {
            if (expression is ConstantExpression constantExpression)
            {
                return constantExpression.Value.ToString();
            }
            else if (expression is MemberExpression memberExpression)
            {
                var compiledLambda = Expression.Lambda(memberExpression).Compile();
                var result = compiledLambda.DynamicInvoke();
                return result.ToString();
            }
            else if (expression is UnaryExpression unaryExpression)
            {
                return ExtractValueFromExpression(unaryExpression.Operand);
            }

            return null;
        }
        private (string PropertyName, ExpressionType? ComparisonType) GetPropertyNameFromCriteria(Expression<Func<Property, bool>> criterion)
        {
            if (criterion.Body is MethodCallExpression methodCall)
            {
                if (methodCall.Object is MemberExpression memberExpression)
                {
                    return (memberExpression.Member.Name, null); 
                }
            }
            else if (criterion.Body is BinaryExpression binaryExpression)
            {
                if (binaryExpression.Left is MemberExpression leftMemberExpression)
                {                   
                    return (leftMemberExpression.Member.Name, binaryExpression.NodeType);
                }
            }
            return (null, null); 
        }

    }
}
