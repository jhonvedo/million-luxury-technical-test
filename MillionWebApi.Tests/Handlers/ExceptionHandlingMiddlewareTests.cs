using Microsoft.AspNetCore.Http;
using MillionWebApi.Handlers;
using Moq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace MillionWebApi.Tests.Handlers
{
    public class ExceptionHandlingMiddlewareTests
    {
        private ExceptionHandlingMiddleware _middleware;
        private Mock<RequestDelegate> _next;
        private DefaultHttpContext _httpContext;

        [SetUp]
        public void SetUp()
        {
            _middleware = new ExceptionHandlingMiddleware();
            _next = new Mock<RequestDelegate>();
            _httpContext = new DefaultHttpContext
            {
                Response = { Body = new MemoryStream() } 
            };
        }

        [Test]
        public async Task InvokeAsync_WhenThereIsNotException()
        {            
            _next.Setup(n => n(It.IsAny<HttpContext>())).Returns(Task.CompletedTask);
           
            await _middleware.InvokeAsync(_httpContext, _next.Object);
          
            Assert.AreEqual(StatusCodes.Status200OK, _httpContext.Response.StatusCode);
            _httpContext.Response.Body.Seek(0, SeekOrigin.Begin); 
            var responseBody = await new StreamReader(_httpContext.Response.Body).ReadToEndAsync();
            Assert.IsEmpty(responseBody); 
        }

        [Test]
        public async Task InvokeAsync_WhenThereIsException()
        {           
            var exceptionMessage = "Test exception";
            _next.Setup(n => n(It.IsAny<HttpContext>())).ThrowsAsync(new Exception(exceptionMessage));

          
            await _middleware.InvokeAsync(_httpContext, _next.Object);
           
            Assert.AreEqual((int)HttpStatusCode.InternalServerError, _httpContext.Response.StatusCode);
            
            _httpContext.Response.Body.Seek(0, SeekOrigin.Begin);
            var responseBody = await new StreamReader(_httpContext.Response.Body).ReadToEndAsync();
           
            Assert.IsNotNull(responseBody);
            Assert.IsNotEmpty(responseBody);

            var responseJson = JsonConvert.DeserializeObject<dynamic>(responseBody);
          
            Assert.AreEqual((int)HttpStatusCode.InternalServerError, (int)responseJson.StatusCode);
            Assert.AreEqual("An error occurred while processing your request.", (string)responseJson.Message);
            Assert.AreEqual(exceptionMessage, (string)responseJson.Detailed);
        }
    }
}
