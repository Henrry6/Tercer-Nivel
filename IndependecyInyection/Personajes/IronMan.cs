﻿using Interface;

namespace Personajes
{   
    public class IronMan : IPersonaje
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

