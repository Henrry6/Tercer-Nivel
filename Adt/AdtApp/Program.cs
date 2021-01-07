using Adt;
using System;

namespace AdtApp
{
    class Program
    {
        static void Main(string[] args)
        {

            var raiz = new Nodo("*",
                new Nodo("0",
                    new Nodo("00",
                        new Nodo("000"),
                        new Nodo("001")),
                    new Nodo("01",
                        new Nodo("010"),
                        new Nodo("011"))),
                new Nodo("1",
                    new Nodo("10",
                        new Nodo("100"),
                        new Nodo("101")),
                    new Nodo("11",
                        new Nodo("110"),
                        new Nodo("111"))));
            //imprimir recursivo
            AdministradorNodo an = new AdministradorNodo();
      

            //5 + 6 - 2 - 1
            var arbolOperaciones = new Nodo("+",
                new Nodo("5"),
                new Nodo("-",
                    new Nodo("6"),
                    new Nodo("+",
                        new Nodo("-2"),
                        new Nodo("-1"))));
            //Console.WriteLine("lA SUMA ES: " + an.SumarArbol(arbolOperaciones));


            //caracteres validos [0-9] numeros, . searador decimal
            // +- opreadores, para el nombre prop
            //Crear arbol apartir de un string
            Nodo nodoOperacion = new Nodo();
            an.CrearArbol(nodoOperacion, "5+6+2+1");
            an.RecorrerArbol(nodoOperacion);
            //Console.WriteLine(admin.SumarArbol(nodoOperacion));
            int contador = 0;
            Console.WriteLine("El número de nodos es: " + an.ContadorNodos(arbolOperaciones, contador));


        }

    }
}
