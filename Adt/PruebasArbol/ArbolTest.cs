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

    }
}
