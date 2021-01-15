using Microsoft.VisualStudio.TestTools.UnitTesting;
using Adt;
using System.Collections.Generic;

namespace PruebasArbol
{
    [TestClass]
    public class ArbolTest
    {

        [TestMethod]
        public void TestArbolSuma()
        {
            var arbolOperaciones = new Nodo("+",
                new Nodo("5"),
                new Nodo("+",
                    new Nodo("6"),
                    new Nodo("+",
                        new Nodo("-2"),
                            new Nodo("-1"))));
            var admin = new AdministradorNodo();
            var resultadoEsperado = 8;

            var resultado = admin.SumarArbol(arbolOperaciones);

            Assert.AreEqual(resultadoEsperado, resultado);
        }
        [TestMethod]
        public void TestContarNodos()
        {
            NodoExt nodo = new NodoExt();
            int resultadoEsperado = 1;
            int resultado = NodoExt.ContarNodos(nodo);

            Assert.AreEqual(resultadoEsperado, resultado);
        }
        [TestMethod]
        public void TestContarNodosSiNuloRetorno0()
        {
            NodoExt nodo = null;

            int resultadoEsperado = 0;
            int resultado = NodoExt.ContarNodos(nodo);

            Assert.AreEqual(resultadoEsperado, resultado);
        }
        [TestMethod]
        public void TestContarNodosConHijos()
        {
            NodoExt nodo = new NodoExt();

            nodo.Hijos = new List<NodoExt>();
            nodo.Hijos.Add(new NodoExt());

            int resultadoEsperado = 2;
            int resultado = NodoExt.ContarNodos(nodo);

            Assert.AreEqual(resultadoEsperado, resultado);
        }
        public void TestContadorHojas()
        {
            NodoExt nodo = new NodoExt();
            int resultadoEsperado = 1;
            int resultado = NodoExt.ContarHojas(nodo);

            Assert.AreEqual(resultadoEsperado, resultado);
        }

        [TestMethod]
        public void TestContarNiveles()
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

            int resultadoEsperado = 5;
            int resultado = NodoExt.ContarNiveles(nodoA);

            Assert.AreEqual(resultadoEsperado, resultado);
        }
    }
}