using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TotecoApi.Data;
using TotecoApi.Models;
using TotecoApi.Services;

namespace TotecoApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PublicationsController(IGenericService<Publication> service) : ControllerBase
    {
        private readonly IGenericService<Publication> _service = service;

        [HttpGet]
        public async Task<ActionResult<List<Publication>>> GetAll()
        {
            var est = await _service.GetAllAsync();
            return Ok(est);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Publication>> GetById(int id)
        {
            var est = await _service.GetByIdAsync(id);
            if (est == null) return NotFound();
            return Ok(est);
        }

        [HttpPost]
        public async Task<ActionResult<Publication>> Create(Publication est)
        {
            await _service.CreateAsync(est);
            return CreatedAtAction(nameof(GetById), new { id = est.Id }, est);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Publication est)
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

        [HttpGet("/user/{id}")]
        public async Task<ActionResult<List<Publication>>> GetByUser(int id)
        {
            var est = await _service.FindAsync(p => p.UserId == id);
            return Ok(est);
        }

        [HttpGet("/establishment/{id}")]
        public async Task<ActionResult<List<Publication>>> GetByEstablishment(int id)
        {
            var est = await _service.FindAsync(p => p.EstablishmentId == id);
            return Ok(est);
        }

        [HttpGet("/score")]
        public async Task<ActionResult<List<Publication>>> GetByScoreRange([FromQuery] double minScore, [FromQuery] double maxScore)
        {
            var est = await _service.FindAsync(p => p.TotalScore >= minScore && p.TotalScore <= maxScore);
            return Ok(est);
        }

        [HttpGet("/price")]
        public async Task<ActionResult<List<Publication>>> GetByPriceRange([FromQuery] decimal minPrice, [FromQuery] decimal maxPrice)
        {
            var est = await _service.FindAsync(p => p.TotalPrice >= minPrice && p.TotalPrice <= maxPrice);
            return Ok(est);
        }
    }
}
