using System;

namespace Personajes
{
    public class Hulk
    {
        public string Nombre { get; set; }

        public string Habilidad { get; set; }

        public Hulk(string nombre, string habilidad)
        {
            Nombre = nombre;
            Habilidad = habilidad;
        }
    }
}
