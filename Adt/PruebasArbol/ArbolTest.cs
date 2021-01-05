using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace PruebasArbol
{
    [TestClass]
    public class ArbolTest
    {

        [TestMethod]
        public void CalcularArbolDeOperaciones()
        {
            var expresionMatematica = "5+6-2-1";
            var esperado = 8;

            var calculadoraDeArbol = new CalculadoraDeArbol();
            var resultado = calculadoraDeArbol.Calcular(expresionMatematica);

            /*Metodo para verificar si son iguales*/
            Assert.AreEqual(esperado, resultado);
        }
    }
}
