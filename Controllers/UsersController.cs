using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TotecoApi.Models;
using TotecoApi.Services;

namespace TotecoApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController(IGenericService<User> service) : ControllerBase
    {
        private readonly IGenericService<User> _service = service;

        [HttpGet]
        [Authorize(Roles = "ADMIN")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<User>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<User>>> GetAll()
        {
            try
            {
                var user = await _service.GetAllAsync();
                return Ok(user);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(User))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<User>> GetById(string id)
        {
            try
            {
                var user = await _service.GetByIdAsync(id);
                if (user == null) return NotFound(new ErrorResponse("Usuario no encontrado."));
                return Ok(user);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created, Type = typeof(User))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<User>> Create(User user)
        {
            try
            {
                await _service.CreateAsync(user);
                return CreatedAtAction(nameof(GetById), new { id = user.Id }, user);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        [Authorize]
        public async Task<IActionResult> Update(string id, User user)
        {
            try
            {
                if (id != user.Id) return BadRequest(new ErrorResponse("El Id no coincide con el Id del usuario."));

                var exist = await _service.GetByIdAsync(id);
                if (exist == null) return NotFound(new ErrorResponse("Usuario no encontrado."));

                await _service.UpdateAsync(id, user);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        [Authorize]
        public async Task<IActionResult> Delete(string id)
        {
            try
            {
                var exist = await _service.GetByIdAsync(id);
                if (exist == null) return NotFound(new ErrorResponse("Usuario no encontrado."));

                await _service.DeleteAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }
    }
}
