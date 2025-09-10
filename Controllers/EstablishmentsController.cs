using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TotecoApi.Models;
using TotecoApi.Services;
using TotecoApi.Models;

namespace TotecoApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EstablishmentsController(IGenericService<Establishment> service) : ControllerBase
    {

        private readonly IGenericService<Establishment> _service = service;

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Establishment>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Establishment>>> GetAll()
        {
            try
            {
                var est = await _service.GetAllAsync();
                return Ok(est);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Establishment))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(ErrorResponse))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<Establishment>> GetById(string id)
        {
            try
            {
                var est = await _service.GetByIdAsync(id);
                if (est == null) return NotFound(new ErrorResponse("Establecimiento no encontrado."));
                return Ok(est);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created, Type = typeof(Establishment))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult<Establishment>> Create(Establishment est)
        {
            try
            {
                await _service.CreateAsync(est);
                return CreatedAtAction(nameof(GetById), new { id = est.Id }, est);
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
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> Update(string id, Establishment est)
        {
            try
            {
                if (id != est.Id) return BadRequest(new { message = "El Id no coincide con el Id del establecimiento." });

                var exist = await _service.GetByIdAsync(id);
                if (exist == null) return NotFound(new ErrorResponse("Establecimiento no encontrado."));

                await _service.UpdateAsync(id, est);
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
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> Delete(string id)
        {
            try
            {
                var exist = await _service.GetByIdAsync(id);
                if (exist == null) return NotFound(new ErrorResponse("Establecimiento no encontrado."));

                await _service.DeleteAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("name/{name}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Establishment>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Establishment>>> GetByName(string name)
        {
            try
            {
                var est = await _service.FindAsync(e => e.Name == name);
                return Ok(est);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("open/{open}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Establishment>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Establishment>>> GetByOpen(bool open)
        {
            var est = await _service.FindAsync(e => e.IsOpen == open);
            return Ok(est);
        }

        [HttpGet("score/{score}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Establishment>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Establishment>>> GetByScore(decimal score)
        {
            try
            {
                var est = await _service.FindAsync(e => e.Score >= score);
                return Ok(est);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }

        [HttpGet("score-range")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(List<Establishment>))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(ErrorResponse))]
        public async Task<ActionResult<List<Establishment>>> GetByScoreRange([FromQuery] decimal minScore, [FromQuery] decimal maxScore)
        {
            try
            {
                var est = await _service.FindAsync(e => e.Score >= minScore && e.Score <= maxScore);
                return Ok(est);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ErrorResponse(ex.Message));
            }
        }
    }
}
