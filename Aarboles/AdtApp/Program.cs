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

        public static void contarNiveles()
        {
            NodoExt nodoA = new NodoExt("A");
            NodoExt nodoB = new NodoExt("B");
            NodoExt nodoC = new NodoExt("C");
            NodoExt nodoD = new NodoExt("D");
            NodoExt nodoE = new NodoExt("E");
            NodoExt nodoF = new NodoExt("F");
            NodoExt nodoG = new NodoExt("G");

            NodoExt nodoN = new NodoExt("N");
            NodoExt nodoX = new NodoExt("X");

            //Raiz
            nodoA.Hijos.Add(nodoB);
            nodoA.Hijos.Add(nodoC);

            //
            nodoB.Hijos.Add(nodoD);
            nodoB.Hijos.Add(nodoE);
            //
            nodoC.Hijos.Add(nodoF);
            nodoC.Hijos.Add(nodoG);
            //
            nodoD.Hijos.Add(new NodoExt("H"));
            nodoD.Hijos.Add(new NodoExt("I"));
            nodoE.Hijos.Add(new NodoExt("J"));
            nodoE.Hijos.Add(new NodoExt("K"));

            nodoF.Hijos.Add(new NodoExt("L"));
            nodoF.Hijos.Add(new NodoExt("M"));
            nodoG.Hijos.Add(nodoN);
            nodoG.Hijos.Add(new NodoExt("Ñ"));

            nodoN.Hijos.Add(nodoX);

            NodoExt.ImprmirArbolMultiplesHijos(nodoA);

            Console.WriteLine("EL ARBOL TIENE {0} NIVELES !!!", NodoExt.ContarNiveles(nodoA));
        }


    }
}
