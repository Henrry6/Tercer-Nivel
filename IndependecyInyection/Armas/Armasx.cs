using System;
using Interface;
using Personajes;

namespace Armas1
{
    public class Armasx : IArmas
    {
       public bool Disparar(IronMan iroman)
        {
            Console.WriteLine("IronMan esta disparando");
            return true;
        }
        public bool Golpear(IronMan iroman)
        {
            Console.WriteLine("IronMan esta disparando");
            return true;
        }
        public bool Disparar(Hulk hulk)
        {
            Console.WriteLine("IronMan esta disparando");
            return true;
        }
        public bool Golpear(Hulk hulk)
        {
            Console.WriteLine("IronMan esta disparando");
            return true;
        }
    }
}
