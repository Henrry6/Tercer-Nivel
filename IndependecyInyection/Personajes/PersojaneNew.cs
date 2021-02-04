using Interface;
using System;

namespace Personajes
{
    public class PersonajeNew : IPersonaje
    {
        public string Nombre { get; set; }

        public string Habilidad { get; set; }

        public PersonajeNew(string nombre, string habilidad)
        {
            Nombre = nombre;
            Habilidad = habilidad;
        }
    }
}

