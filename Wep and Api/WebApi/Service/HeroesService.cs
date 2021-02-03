using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Service
{
    public class HeroesService
    {

        private readonly IMongoCollection<Heroes> _heroes;
        public HeroesService (IHeroesDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _heroes = database.GetCollection<Heroes>(settings.HeroesCollectionName);

        }

        public List<Heroes> Get() =>
            _heroes.Find(heroes => true).ToList();

        public Heroes Get(string id) =>
            _heroes.Find(heroes => heroes.Id == id).FirstOrDefault();

        public Heroes Create(Heroes heroes)
        {
            _heroes.InsertOne(heroes);
            return heroes;
        }

        public void Update(string id, Heroes heroesIn) =>
            _heroes.ReplaceOne(heroes => heroes.Id == id, heroesIn);

        public void Remove(Heroes heroesIn) =>
            _heroes.DeleteOne(heroes => heroes.Id == heroesIn.Id);

        public void Remove(string id) =>
            _heroes.DeleteOne(heroes => heroes.Id == id);



    }
}
