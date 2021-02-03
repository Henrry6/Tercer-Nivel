using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    //BASE DE DATOS CON MONGODB
    public class HeroesDatabaseSettings : IHeroesDatabaseSettings
    {
        public string HeroesCollectionName { get; set; }
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }

    public interface IHeroesDatabaseSettings
    {
        public string HeroesCollectionName { get; set; }
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }
}
