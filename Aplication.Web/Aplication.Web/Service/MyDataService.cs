using Aplication.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Aplication.Web.Service
{
    public class MyDataService
    {
        public MyData ObtenerDatos()
        {
            return new MyData()
            {
                Name = "Henrry",
                LastName = "Alvarado",
                Institute = "Benito Juarez",
                Level = "Tercer Nivel",
                Activities = "Estudiante - Desarrollador",
                Conctact = "0991345673",
                Publicacion = new DateTime(2020, 12, 16, 5, 30, 15)
            };

        }
    }
}
