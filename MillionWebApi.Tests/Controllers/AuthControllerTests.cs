using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using MillionWebApi.Controllers;
using MillionWebApi.Services;
using MillionWebApi.Utils;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MillionWebApi.Tests.Controllers
{
    public class AuthControllerTests
    {
        private AuthController _authController;
        private Mock<IAuthService> _authServiceMock;
        private Mock<ITokenService> _tokenServiceMock;

        [SetUp]
        public void Setup()
        {
            _authServiceMock = new Mock<IAuthService>();
            _tokenServiceMock = new Mock<ITokenService>();
            _authController = new AuthController(_tokenServiceMock.Object, _authServiceMock.Object);
        }

        [Test]
        public void Login_ValidCredentials_ReturnsToken()
        {

           
            var request = new LoginRequest { Email = "test@example.com", Password = "password" };
            _authServiceMock.Setup(x => x.ValidateCredentials(request.Email, request.Password)).Returns(true);
            _tokenServiceMock.Setup(x => x.GenerateFakeJwtToken(request.Email)).Returns("fakeToken");

           
            var result = _authController.Login(request);

        
            var okResult = result as OkObjectResult;
            Assert.IsNotNull(okResult); 
            Assert.AreEqual(200, okResult.StatusCode); 
            var response = okResult.Value as LoginResponse;
            Assert.IsNotNull(response);
            Assert.AreEqual("fakeToken", response.Token); 
        }

        [Test]
        public void Login_InvalidCredential_ReturnUnauthorized()
        {
           
            var request = new LoginRequest { Email = "test@example.com", Password = "wrongpassword" };
            _authServiceMock.Setup(x => x.ValidateCredentials(request.Email, request.Password)).Returns(false);

            
            var result = _authController.Login(request);

            
            Assert.IsInstanceOf<UnauthorizedResult>(result);
        }
    }

}