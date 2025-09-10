using Microsoft.AspNetCore.Authorization;
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
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Product>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Product>>> GetAll()
        {
            try
            {
                var prod = await _service.GetAllAsync();
                return Ok(prod);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Product))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<Product>> GetById(string id)
        {
            try
            {
                var prod = await _service.GetByIdAsync(id);
                if (prod == null) return NotFound(new ErrorResponse("Producto no encontrado."));
                return Ok(prod);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created, Type = typeof(Product))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        [Authorize]
        public async Task<ActionResult<Product>> Create(Product prod)
        {
            try
            {
                await _service.CreateAsync(prod);
                return CreatedAtAction(nameof(GetById), new { id = prod.Id }, prod);
            }
            catch (DbUpdateException ex) when (ex.InnerException is MySqlConnector.MySqlException sqlEx && sqlEx.Number == 1452)
            {
                return BadRequest(new ErrorResponse("El PublicationId proporcionado no existe."));
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
        public async Task<IActionResult> Update(string id, Product prod)
        {
            try
            {
                if (id != prod.Id) return BadRequest(new ErrorResponse("El Id no coincide con el Id del producto."));

                var exist = await _service.GetByIdAsync(id);
                if (exist == null) return NotFound(new ErrorResponse("Producto no encontrado."));

                await _service.UpdateAsync(id, prod);
                return NoContent();
            }
            catch (DbUpdateException ex) when (ex.InnerException is MySqlConnector.MySqlException sqlEx && sqlEx.Number == 1452)
            {
                return BadRequest(new ErrorResponse("El EstablishmentId proporcionado no existe."));
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
                if (exist == null) return NotFound(new ErrorResponse("Producto no encontrado."));

                await _service.DeleteAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("publication/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Product>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Product>>> GetByScoreRange(string id)
        {
            try
            {
                var products = await _service.FindAsync(e => e.PublicationId == id);
                return Ok(products);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }
    }
}
