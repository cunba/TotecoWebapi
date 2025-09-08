using Microsoft.AspNetCore.Mvc;
using TotecoApi.Models;
using TotecoApi.Services;
using TotecoWebapi.Models;

namespace TotecoWebapi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController(IGenericService<User> service) : ControllerBase
    {
        private readonly IGenericService<User> _service = service;

        [HttpPost]
        public async Task<ActionResult<LoginResponse>> Login(LoginRequest request)
        {
            var user = await _service.FindAsync(u => u.Username == request.Username && u.Password == request.Password);
            if (user.Count == 0) return Unauthorized();
            return Ok(user);
        }
    }
}