using System;
using Personajes;

namespace Interface
{
    public interface IArmas
    {
        bool Disparar(IronMan ironman);
        bool Golpear(IronMan ironman);

        bool Disparar(Hulk hulk);
        bool Golpear(Hulk hulk);
    }
}
