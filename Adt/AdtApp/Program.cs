using Adt;
using System;

namespace AdtApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Arbol binario");
            string valor = Console.ReadLine();
            var raiz = new Nodo(
                "*",
                new Nodo("0", new Nodo("00")),
                new Nodo("1", new Nodo("10")));
            raiz.Nombre = "1";

            var nodo1 = new Nodo(valor);
            nodo1.Nombre = "1.1";

            var nodo2 = new Nodo();
            nodo2.Nombre = "1.2";
            var nodo3 = new Nodo();
            nodo3.Nombre = "1.3";

            raiz.Izquierdo = nodo1;
            raiz.Derecho = nodo2;
            //imprimir recursivo
            AdministradorNodo an = new AdministradorNodo();
            an.Imprimir(raiz);

            //5 + 6 - 2 - 1
            var arbolOpreaciones = new Nodo("+",
                new Nodo("5"),
                new Nodo("-",
                    new Nodo("6"),
                    new Nodo("-",
                        new Nodo("2"),
                        new Nodo("1"))));
            //caracteres validos [0-9] numeros, . searador decimal
            // +- opreadores, para el nombre prop


        }

    }
}
