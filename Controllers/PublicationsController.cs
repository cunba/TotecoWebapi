using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TotecoApi.Models;
using TotecoApi.Services;

namespace TotecoApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Consumes("application/json")]
    [Produces("application/json")]
    public class PublicationsController(
        IGenericService<Publication> servicePublication,
        IGenericService<Product> serviceProduct,
        IGenericService<Establishment> serviceEstablishment
        ) : ControllerBase
    {
        private readonly IGenericService<Publication> _servicePublication = servicePublication;
        private readonly IGenericService<Product> _serviceProduct = serviceProduct;
        private readonly IGenericService<Establishment> _serviceEstablishment = serviceEstablishment;

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Publication>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Publication>>> GetAll()
        {
            try
            {
                var pub = await _servicePublication.GetAllAsync();
                foreach (Publication p in pub)
                {
                    p.Establishment = await _serviceEstablishment.GetByIdAsync(p.EstablishmentId);
                    p.Products = await _serviceProduct.FindAsync(prod => prod.PublicationId == p.Id);
                }
                return Ok(pub);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Publication))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<Publication>> GetById(string id)
        {
            try
            {
                var pub = await _servicePublication.GetByIdAsync(id);
                if (pub == null) return NotFound(new ErrorResponse("Publicación no encontrada."));
                pub.Establishment = await _serviceEstablishment.GetByIdAsync(pub.EstablishmentId);
                pub.Products = await _serviceProduct.FindAsync(prod => prod.PublicationId == pub.Id);
                return Ok(pub);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created, Type = typeof(Publication))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        [Authorize]
        public async Task<ActionResult<Publication>> Create(Publication pub)
        {
            try
            {
                await _servicePublication.CreateAsync(pub);
                return CreatedAtAction(nameof(GetById), new { id = pub.Id }, pub);
            }
            catch (DbUpdateException ex) when (ex.InnerException is MySqlConnector.MySqlException sqlEx && sqlEx.Number == 1452)
            {
                return BadRequest(new ErrorResponse("El EstablishmentId o UserId proporcionado no existe."));
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
        public async Task<IActionResult> Update(string id, Publication pub)
        {
            try
            {
                if (id != pub.Id) return BadRequest(new ErrorResponse("El Id no coincide con el Id de la publicación"));

                var exist = await _servicePublication.GetByIdAsync(id);
                if (exist == null) return NotFound(new ErrorResponse("Publicación no encontrada"));

                await _servicePublication.UpdateAsync(id, pub);
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
                var exist = await _servicePublication.GetByIdAsync(id);
                if (exist == null) return NotFound(new ErrorResponse("Publicación no encontrada"));

                await _servicePublication.DeleteAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("user/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Product>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Publication>>> GetByUser(string id)
        {
            try
            {
                var pub = await _servicePublication.FindAsync(p => p.UserId == id);
                foreach (Publication p in pub)
                {
                    p.Establishment = await _serviceEstablishment.GetByIdAsync(p.EstablishmentId);
                    p.Products = await _serviceProduct.FindAsync(prod => prod.PublicationId == p.Id);
                }
                return Ok(pub);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("establishment/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Product>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Publication>>> GetByEstablishment(string id)
        {
            try
            {
                var pub = await _servicePublication.FindAsync(p => p.EstablishmentId == id);
                foreach (Publication p in pub)
                {
                    p.Establishment = await _serviceEstablishment.GetByIdAsync(p.EstablishmentId);
                    p.Products = await _serviceProduct.FindAsync(prod => prod.PublicationId == p.Id);
                }
                return Ok(pub);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("score")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Product>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Publication>>> GetByScoreRange([FromQuery] decimal minScore, [FromQuery] decimal maxScore)
        {
            try
            {
                var pub = await _servicePublication.FindAsync(p => p.TotalScore >= minScore && p.TotalScore <= maxScore);
                foreach (Publication p in pub)
                {
                    p.Establishment = await _serviceEstablishment.GetByIdAsync(p.EstablishmentId);
                    p.Products = await _serviceProduct.FindAsync(prod => prod.PublicationId == p.Id);
                }
                return Ok(pub);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("price")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Product>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Publication>>> GetByPriceRange([FromQuery] decimal minPrice, [FromQuery] decimal maxPrice)
        {
            try
            {
                var pub = await _servicePublication.FindAsync(p => p.TotalPrice >= minPrice && p.TotalPrice <= maxPrice);
                foreach (Publication p in pub)
                {
                    p.Establishment = await _serviceEstablishment.GetByIdAsync(p.EstablishmentId);
                    p.Products = await _serviceProduct.FindAsync(prod => prod.PublicationId == p.Id);
                }
                return Ok(pub);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }
    }
}
