using Adt;
using System;

namespace AdtApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Arbol binario");
            var raiz = new Nodo();
            raiz.Nombre = "1";

            var nodo1 = new Nodo();
            nodo1.Nombre = "1.1";

            var nodo2 = new Nodo();
            nodo2.Nombre = "1.2";
            raiz.Izquierdo = nodo1;
            raiz.Derecho = nodo2;
            //imprimir recursivo
            AdministradorNodo an = new AdministradorNodo();
            an.Imprimir(raiz);
        }

    }
}
