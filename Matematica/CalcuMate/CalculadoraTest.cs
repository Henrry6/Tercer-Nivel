using Microsoft.VisualStudio.TestTools.UnitTesting;
using Matematica.Negocio;


namespace Matematica.Test
{
    [TestClass]
    public class CalculadoraTest
    {
        [TestMethod]
        public void SumaDeDosNumeros()
        {
            var primerNumero = 18;
            var segundoNumero = 3.7;
            var esperado = 21.7;

            var miCalculadora = new Calculadora();
            var resultado = miCalculadora.Sumar(primerNumero, segundoNumero);

            /*Metodo para verificar si son iguales*/
            Assert.AreEqual(esperado, resultado);
        }
        [TestMethod]
        public void SumarComplejos()
        {
            var primerComplejo = new Complejo(3, 2);
            var segundoComplejo = new Complejo(5, 6);
            var esperadoComplejo = new Complejo(5, 8);

            var miCalculadora = new Calculadora();
            var resultado = miCalculadora.Sumar(primerComplejo, segundoComplejo);
            Assert.AreEqual(esperadoComplejo, resultado);
        }

    }
}