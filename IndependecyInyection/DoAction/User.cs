using Interface;
using Personajes;
using System;

namespace DoAction
{
    class Usuario
    {
        public IArmas Armas { get; set; }

        public Usuario(IArmas armas)
        {
            this.Armas = armas;
        }


        public string Jugar(IronMan ironman, Hulk hulk)
        {
            Armas.Disparar(ironman);
            Armas.Golpear(hulk);


            return string.Format("El personaje se llama {0} y tiene la habilidad de {1}"
                , ironman.Nombre
                , ironman.Habilidad);

        }
    }
}
