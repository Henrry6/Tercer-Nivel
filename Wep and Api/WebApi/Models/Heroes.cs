using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class Heroes
    {
        [BsonId]
        public ObjectId id { get; set; }
        public string Id { get; internal set; }

        //public int id { get; set; }
        public string nombre { get; set; }

        public string poder { get; set; }
    }
}
