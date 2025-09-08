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
        public async Task<ActionResult<List<User>>> GetAll()
        {
            var user = await _service.GetAllAsync();
            return Ok(user);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetById(int id)
        {
            var user = await _service.GetByIdAsync(id);
            if (user == null) return NotFound();
            return Ok(user);
        }

        [HttpPost]
        public async Task<ActionResult<User>> Create(User user)
        {
            await _service.CreateAsync(user);
            return CreatedAtAction(nameof(GetById), new { id = user.Id }, user);
        }

        [HttpPut("{id}")]
        [Authorize]
        public async Task<IActionResult> Update(int id, User user)
        {
            if (id != user.Id) return BadRequest();

            var exist = await _service.GetByIdAsync(id);
            if (exist == null) return NotFound();

            await _service.UpdateAsync(id, user);
            return NoContent();
        }

        [HttpDelete("{id}")]
        [Authorize]
        public async Task<IActionResult> Delete(int id)
        {
            var exist = await _service.GetByIdAsync(id);
            if (exist == null) return NotFound();

            await _service.DeleteAsync(id);
            return NoContent();
        }
    }
}
