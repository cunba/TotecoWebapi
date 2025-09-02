using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TotecoApi.Data;
using TotecoApi.Models;
using TotecoApi.Repositories;
using TotecoApi.Services;

namespace TotecoApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EstablishmentsController(IGenericService<Establishment> service) : ControllerBase
    {

        private readonly IGenericService<Establishment> _service = service;

        [HttpGet]
        public async Task<ActionResult<List<Establishment>>> GetAll()
        {
            var est = await _service.GetAllAsync();
            return Ok(est);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Establishment>> GetById(int id)
        {
            var est = await _service.GetByIdAsync(id);
            if (est == null) return NotFound();
            return Ok(est);
        }

        [HttpPost]
        public async Task<ActionResult<Establishment>> Create(Establishment est)
        {
            await _service.CreateAsync(est);
            return CreatedAtAction(nameof(GetById), new { id = est.Id }, est);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Establishment est)
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

        [HttpGet("/name/{name}")]
        public async Task<ActionResult<List<Establishment>>> GetByName(string name)
        {
            var est = await _service.FindAsync(e => e.Name == name);
            return Ok(est);
        }

        [HttpGet("/open/{open}")]
        public async Task<ActionResult<List<Establishment>>> GetByOpen(bool open)
        {
            var est = await _service.FindAsync(e => e.IsOpen == open);
            return Ok(est);
        }

        [HttpGet("/score/{score}")]
        public async Task<ActionResult<List<Establishment>>> GetByScore(decimal score)
        {
            var est = await _service.FindAsync(e => e.Score >= score);
            return Ok(est);
        }

        [HttpGet("/score")]
        public async Task<ActionResult<List<Establishment>>> GetByScore([FromQuery] decimal minScore, [FromQuery] decimal maxScore)
        {
            var est = await _service.FindAsync(e => e.Score >= minScore && e.Score <= maxScore);
            return Ok(est);
        }
    }
}
