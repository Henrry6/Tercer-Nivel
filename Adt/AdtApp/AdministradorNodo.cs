using Adt;
using System;

namespace AdtApp
{
    internal class AdministradorNodo
    {
        public void Imprimir(Nodo Nodo)
        {
            if (Nodo == null) return;

            Console.WriteLine(Nodo.Nombre);
            Imprimir(Nodo.Izquierdo);
            Imprimir(Nodo.Derecho);
        }
    }
}