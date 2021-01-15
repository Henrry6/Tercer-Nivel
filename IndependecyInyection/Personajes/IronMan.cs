using System;

namespace Personajes
{
    public class IronMan
    {
        public string Nombre { get; set; }

        public string Habilidad { get; set; }

        public IronMan(string nombre, string habilidad)
        {
            Nombre = nombre;
            Habilidad = habilidad;
        }
    }
}

