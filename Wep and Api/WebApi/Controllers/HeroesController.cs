
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using WebApi.Models;
using WebApi.Service;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HeroesController : ControllerBase
    {
        private readonly HeroesService _heroesService;

        public HeroesController(HeroesService heroesService)
        {
            _heroesService = heroesService;
        }

        [HttpGet]
        public ActionResult<List<Heroes>> Get() =>
            _heroesService.Get();

        [HttpGet("{id:length(24)}", Name = "GetBook")]
        public ActionResult<Heroes> Get(string id)
        {
            var heroes = _heroesService.Get(id);

            if (heroes == null)
            {
                return NotFound();
            }

            return heroes;
        }

        [HttpPost]
        public ActionResult<Heroes> Create(Heroes heroes)
        {
            _heroesService.Create(heroes);

            return CreatedAtRoute("GetBook", new { id = heroes.Id.ToString() }, heroes);
        }

        [HttpPut("{id:length(24)}")]
        public IActionResult Update(string id, Heroes heroesIn)
        {
            var heroes = _heroesService.Get(id);

            if (heroes == null)
            {
                return NotFound();
            }

            _heroesService.Update(id, heroesIn);

            return NoContent();
        }

        [HttpDelete("{id:length(24)}")]
        public IActionResult Delete(string id)
        {
            var heroes = _heroesService.Get(id);

            if (heroes == null)
            {
                return NotFound();
            }

            _heroesService.Remove(heroes.Id);

            return NoContent();
        }
    }
}