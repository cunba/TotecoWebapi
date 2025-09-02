using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TotecoApi.Data;
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
        public async Task<ActionResult<List<User>>> GetAll()
        {
            var est = await _service.GetAllAsync();
            return Ok(est);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetById(int id)
        {
            var est = await _service.GetByIdAsync(id);
            if (est == null) return NotFound();
            return Ok(est);
        }

        [HttpPost]
        public async Task<ActionResult<User>> Create(User est)
        {
            await _service.CreateAsync(est);
            return CreatedAtAction(nameof(GetById), new { id = est.Id }, est);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, User est)
        {
            if (id != est.Id) return BadRequest();

            var exist = await _service.GetByIdAsync(id);
            if (exist == null) return NotFound();

            await _service.UpdateAsync(id, est);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var exist = await _service.GetByIdAsync(id);
            if (exist == null) return NotFound();

            await _service.DeleteAsync(id);
            return NoContent();
        }
    }
}
