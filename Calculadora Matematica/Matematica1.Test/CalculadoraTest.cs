using Microsoft.VisualStudio.TestTools.UnitTesting;
using Matematica.Negocio;


namespace Matematica1.Test
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
            var segundoComplejo = new Complejo(1.5, 6);
            var esperadoComplejo = new Complejo(4.5, 8);

            var miCalculadora = new Calculadora();
            var resultado = miCalculadora.Sumar(primerComplejo, segundoComplejo);
            Assert.AreEqual(esperadoComplejo.Real, resultado.Real);
            Assert.AreEqual(esperadoComplejo.Imaginaria, resultado.Imaginaria);
        }
        [TestMethod]
        public void RestarComplejos()
        {
            var primerComplejo = new Complejo(7, 9);
            var segundoComplejo = new Complejo(1.5, 3);
            var esperadoComplejo = new Complejo(5.5, 6);

            var miCalculadora = new Calculadora();
            var resultado = miCalculadora.Restar(primerComplejo, segundoComplejo);
            Assert.AreEqual(esperadoComplejo.Real, resultado.Real);
            Assert.AreEqual(esperadoComplejo.Imaginaria, resultado.Imaginaria);
        }
        /*impletar la operaciones de numeros complejos suma resta division multiplicacion x un escalar*/
        [TestMethod]
        [ExpectedException(typeof(System.ArgumentException))]
        public void DividirPorCero()
        {
            var dividendo = 5;
            var divisor = 0;

            var miCalculadora = new Calculadora();
            _ = miCalculadora.Dividir(dividendo, divisor);

        }
        public void DividirDosNumeros()
        {
            var primerNumero = 6.50;
            var segundoNumero = 2;
            var esperado = 3.25;

            var calculadora = new Calculadora();
            var resultado = calculadora.Dividir(primerNumero, segundoNumero);

            Assert.AreEqual(esperado, resultado);
        }
        [TestMethod]
        public void MultiplicarDosNumeros()
        {
            var primerNumero = 5;
            var segundoNumero = 2.5;
            var esperado = 12.5;

            var calculadora = new Calculadora();
            var resultado = calculadora.Multiplicar(primerNumero, segundoNumero);

            Assert.AreEqual(esperado, resultado);
        }
        [TestMethod]
        public void ExponentesComplejos()
        {
            var primerNumero = 5;
            var esperado = 25;

            var calculadora = new Calculadora();
            var resultado = calculadora.Exponente(primerNumero);

            Assert.AreEqual(esperado, resultado);
        }
    }
}