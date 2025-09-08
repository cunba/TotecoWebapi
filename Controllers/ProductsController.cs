using Microsoft.AspNetCore.Mvc;
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
            var prod = await _service.GetAllAsync();
            return Ok(prod);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetById(int id)
        {
            var prod = await _service.GetByIdAsync(id);
            if (prod == null) return NotFound();
            return Ok(prod);
        }

        [HttpPost]
        public async Task<ActionResult<Product>> Create(Product prod)
        {
            await _service.CreateAsync(prod);
            return CreatedAtAction(nameof(GetById), new { id = prod.Id }, prod);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Product prod)
        {
            if (id != prod.Id) return BadRequest();

            var exist = await _service.GetByIdAsync(id);
            if (exist == null) return NotFound();

            await _service.UpdateAsync(id, prod);
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
