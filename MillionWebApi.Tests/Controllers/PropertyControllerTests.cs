using Microsoft.AspNetCore.Mvc;
using MillionApplication.DTOs;
using MillionApplication.Interfaces;
using MillionWebApi.Controllers;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionWebApi.Tests.Controllers
{
    public class PropertyControllerTests
    {
        private Mock<IPropertyService> _propertyServiceMock;
        private PropertyController _propertyController;

        [SetUp]
        public void Setup()
        {
            _propertyServiceMock = new Mock<IPropertyService>();
            _propertyController = new PropertyController(_propertyServiceMock.Object);
        }

        [Test]
        public async Task GetAllPropertiesAsync_ReturnOk_WithEmptyPropertiesFilter()
        {            
            var filters = new PropertyFilterDto();
            var properties = new List<PropertyDto>
            {
                new PropertyDto { IdProperty = 1, Name = "Property 1" },
                new PropertyDto { IdProperty = 2, Name = "Property 2" }
            };

            _propertyServiceMock.Setup(x => x.GetAllPropertiesAsync(filters)).ReturnsAsync(properties);
            
            var result = await _propertyController.GetAllPropertiesAsync(filters);
          
            var okResult = result.Result as OkObjectResult;
            Assert.IsNotNull(okResult);
            Assert.AreEqual(200, okResult.StatusCode);
            var returnedProperties = okResult.Value as IEnumerable<PropertyDto>;
            Assert.IsNotNull(returnedProperties);
            Assert.AreEqual(2, returnedProperties.Count());
        }

        [Test]
        public async Task GetPropertyById_ReturnOkResult_ExistingId()
        {           
            var propertyId = 1;
            var property = new PropertyDto { IdProperty = propertyId, Name = "Property 1" };

            _propertyServiceMock.Setup(x => x.GetPropertyByIdAsync(propertyId)).ReturnsAsync(property);
          
            var result = await _propertyController.GetPropertyById(propertyId);
        
            var okResult = result as OkObjectResult;
            Assert.IsNotNull(okResult);
            Assert.AreEqual(200, okResult.StatusCode);
            var returnedProperty = okResult.Value as PropertyDto;
            Assert.IsNotNull(returnedProperty);
            Assert.AreEqual(propertyId, returnedProperty.IdProperty);
        }

        [Test]
        public async Task GetPropertyById_ReturnNotFound_IdNotFound()
        {          
            var propertyId = 1;

            _propertyServiceMock.Setup(x => x.GetPropertyByIdAsync(propertyId)).ReturnsAsync((PropertyDto)null);
          
            var result = await _propertyController.GetPropertyById(propertyId);

            Assert.IsInstanceOf<NotFoundResult>(result);
        }

        [Test]
        public async Task UpdatePropertyPrice_ReturnOkResult_ExistingId()
        {
            var propertyId = 1;
            var newPrice = 500m;
            var updatedProperty = new PropertyDto { IdProperty = propertyId, Price = newPrice };

            _propertyServiceMock.Setup(x => x.ChangePropertyPriceAsync(propertyId, newPrice)).ReturnsAsync(updatedProperty);

            var result = await _propertyController.UpdatePropertyPrice(propertyId, newPrice);

            var okResult = result as OkObjectResult;
            Assert.IsNotNull(okResult);
            Assert.AreEqual(200, okResult.StatusCode);
            var returnedProperty = okResult.Value as PropertyDto;
            Assert.IsNotNull(returnedProperty);
            Assert.AreEqual(newPrice, returnedProperty.Price);
        }

        [Test]
        public async Task UpdatePropertyPrice_ReturnNotFound_IdNotFound()
        {
            var propertyId = 1;
            var newPrice = 500m;

            _propertyServiceMock.Setup(x => x.ChangePropertyPriceAsync(propertyId, newPrice)).ReturnsAsync((PropertyDto)null);

            var result = await _propertyController.UpdatePropertyPrice(propertyId, newPrice);

            Assert.IsInstanceOf<NotFoundResult>(result);
        }

        [Test]
        public async Task AddProperty_ReturnOkResult_ValidInput()
        {
            var propertyDto = new PropertyDto { Name = "New Property" };
            var createdProperty = new PropertyDto { IdProperty = 1, Name = "New Property" };

            _propertyServiceMock.Setup(x => x.CreatePropertyAsync(propertyDto)).ReturnsAsync(createdProperty);

            var result = await _propertyController.AddProperty(propertyDto);

            var okResult = result as OkObjectResult;
            Assert.IsNotNull(okResult);
            Assert.AreEqual(200, okResult.StatusCode);
            var returnedProperty = okResult.Value as PropertyDto;
            Assert.IsNotNull(returnedProperty);
            Assert.AreEqual(createdProperty.IdProperty, returnedProperty.IdProperty);
            Assert.AreEqual(createdProperty.Name, returnedProperty.Name);
        }

        [Test]
        public async Task UpdateProperty_ReturnOkResult_ValidInput()
        {
            var propertyDto = new PropertyDto { IdProperty = 1, Name = "Updated Property" };
            var updatedProperty = new PropertyDto { IdProperty = propertyDto.IdProperty, Name = "Updated Property" };

            _propertyServiceMock.Setup(x => x.UpdatePropertyAsync(propertyDto)).ReturnsAsync(updatedProperty);

            var result = await _propertyController.UpdateProperty(propertyDto);

            var okResult = result as OkObjectResult;
            Assert.IsNotNull(okResult);
            Assert.AreEqual(200, okResult.StatusCode);
            var returnedProperty = okResult.Value as PropertyDto;
            Assert.IsNotNull(returnedProperty);
            Assert.AreEqual(updatedProperty.IdProperty, returnedProperty.IdProperty);
            Assert.AreEqual(updatedProperty.Name, returnedProperty.Name);
        }
    }
}
