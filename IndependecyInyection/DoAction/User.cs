using Interface;
using Personajes;
using System;

namespace DoAction
{
    public class Usuario 
    {
        public IArma Arma { get; set; }

        public Usuario(IArma arma)
        {
            this.Arma = arma;
        }
        //public string Jugar(IPersonaje personaje)
        //{
        //    Arma.Disparar(personaje);
        //    Arma.Golpear(personaje);
        //    return string.Format("El personaje se llama {0} y tiene la habilidad de {1}"
        //        , personaje.Nombre
        //        , personaje.Habilidad);

        //}

        public string Jugar(PersonajeNew personaje)
        {
            Arma.Disparar(personaje);
            Arma.Golpear(personaje);
            return string.Format("El personaje se llama {0} y tiene la habilidad de {1}"
                , personaje.Nombre
                , personaje.Habilidad);
        }
    }
}
