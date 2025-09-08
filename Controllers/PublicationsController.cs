using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
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
            var pub = await _service.GetAllAsync();
            return Ok(pub);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Publication>> GetById(int id)
        {
            var pub = await _service.GetByIdAsync(id);
            if (pub == null) return NotFound();
            return Ok(pub);
        }

        [HttpPost]
        [Authorize]
        public async Task<ActionResult<Publication>> Create(Publication pub)
        {
            await _service.CreateAsync(pub);
            return CreatedAtAction(nameof(GetById), new { id = pub.Id }, pub);
        }

        [HttpPut("{id}")]
        [Authorize]
        public async Task<IActionResult> Update(int id, Publication pub)
        {
            if (id != pub.Id) return BadRequest();

            var exist = await _service.GetByIdAsync(id);
            if (exist == null) return NotFound();

            await _service.UpdateAsync(id, pub);
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

        [HttpGet("user/{id}")]
        public async Task<ActionResult<List<Publication>>> GetByUser(int id)
        {
            var pub = await _service.FindAsync(p => p.UserId == id);
            return Ok(pub);
        }

        [HttpGet("establishment/{id}")]
        public async Task<ActionResult<List<Publication>>> GetByEstablishment(int id)
        {
            var pub = await _service.FindAsync(p => p.EstablishmentId == id);
            return Ok(pub);
        }

        [HttpGet("score")]
        public async Task<ActionResult<List<Publication>>> GetByScoreRange([FromQuery] decimal minScore, [FromQuery] decimal maxScore)
        {
            var pub = await _service.FindAsync(p => p.TotalScore >= minScore && p.TotalScore <= maxScore);
            return Ok(pub);
        }

        [HttpGet("price")]
        public async Task<ActionResult<List<Publication>>> GetByPriceRange([FromQuery] decimal minPrice, [FromQuery] decimal maxPrice)
        {
            var pub = await _service.FindAsync(p => p.TotalPrice >= minPrice && p.TotalPrice <= maxPrice);
            return Ok(pub);
        }
    }
}
