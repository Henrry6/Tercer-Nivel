using System;
using Interface;

namespace Armas1
{
    public class ArmaX : IArma
    {
       public bool Disparar(IPersonaje personaje)
        {
            Console.WriteLine("IronMan esta disparando");
            return true;
        }
        public bool Golpear(IPersonaje personaje)
        {
            Console.WriteLine("{0} esta golpeando", personaje.Nombre);
            return true;
        }

        
    }
    public class Escopeta : IArma
    {
        public bool Disparar(IPersonaje personaje)
        {
            Console.WriteLine("{0} esta golpeando, poom!!", personaje.Nombre);
            return true; 
        }
        public bool Golpear(IPersonaje personaje)
        {
            Console.WriteLine("{0} esta golpeando", personaje.Nombre);
            return true;
        }
    }
}
