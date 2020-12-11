
namespace Matematica.Negocio
{ 
    public class Calculadora
    {
        public Calculadora()
        {

        }
        public double Sumar(double primerNumero, double segundoNumero)
        {
            return primerNumero + segundoNumero;
        }
        public Complejo Sumar(Complejo primerComplejo, Complejo segundoComplejo)
        {
            var parteReal = primerComplejo.Real + segundoComplejo.Real;
            var parteImaginaria = primerComplejo.Imaginaria + segundoComplejo.Imaginaria;
            return new Complejo(parteReal, parteImaginaria);
        }
    }
}