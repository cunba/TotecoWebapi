using Microsoft.AspNetCore.Mvc;
using TotecoApi.Models;
using TotecoApi.Services;
using TotecoApi.Auth;
using TotecoApi.Models;

namespace TotecoApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController(IGenericService<User> service, IJwtService jwtService) : ControllerBase
    {
        private readonly IGenericService<User> _service = service;
        private readonly IJwtService _jwtService = jwtService;

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(LoginResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<LoginResponse>> Login(LoginRequest request)
        {
            try
            {
                var user = await _service.FindAsync(u => u.Username == request.Username && u.Password == request.Password);
                if (user.Count == 0) return Unauthorized();

                var token = _jwtService.GenerateToken(user.First());
                return Ok(new LoginResponse(token));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }
    }
}