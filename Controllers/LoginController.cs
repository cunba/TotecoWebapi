using Microsoft.AspNetCore.Mvc;
using TotecoApi.Models;
using TotecoApi.Services;
using TotecoWebapi.Auth;
using TotecoWebapi.Models;

namespace TotecoWebapi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController(IGenericService<User> service, IJwtService jwtService) : ControllerBase
    {
        private readonly IGenericService<User> _service = service;
        private readonly IJwtService _jwtService = jwtService;

        [HttpPost]
        public async Task<ActionResult<LoginResponse>> Login(LoginRequest request)
        {
            var user = await _service.FindAsync(u => u.Username == request.Username && u.Password == request.Password);
            if (user.Count == 0) return Unauthorized();

            var token = _jwtService.GenerateToken(user.First());
            return Ok(new LoginResponse(token));
        }
    }
}