using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TotecoApi.Models;
using TotecoApi.Services;

namespace TotecoApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController(IGenericService<Product> service) : ControllerBase
    {
        private readonly IGenericService<Product> _service = service;

        [HttpGet]
        public async Task<ActionResult<List<Product>>> GetAll()
        {
            var est = await _service.GetAllAsync();
            return Ok(est);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetById(int id)
        {
            var est = await _service.GetByIdAsync(id);
            if (est == null) return NotFound();
            return Ok(est);
        }

        [HttpPost]
        public async Task<ActionResult<Product>> Create(Product est)
        {
            await _service.CreateAsync(est);
            return CreatedAtAction(nameof(GetById), new { id = est.Id }, est);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Product est)
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
