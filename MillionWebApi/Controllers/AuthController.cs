using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using MillionWebApi.Services;
using MillionWebApi.Utils;

namespace MillionWebApi.Controllers
{
    public class LoginResponse
    {
        public string Token { get; set; }
    }

    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly ITokenService _tokenService;
        private readonly IAuthService _authService;


        public AuthController(ITokenService tokenService, IAuthService authService)
        {
            _tokenService = tokenService;
            _authService = authService;
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginRequest request)
        {
            if (_authService.ValidateCredentials(request.Email, request.Password))
            {
                var token = _tokenService.GenerateFakeJwtToken(request.Email);
                return Ok(new LoginResponse { Token = token });
            }

            return Unauthorized();
        }
    }
}
