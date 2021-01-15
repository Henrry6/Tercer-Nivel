
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
            var nuevoComplejo = new Complejo(parteReal, parteImaginaria);

            return nuevoComplejo;
        }
        public Complejo Restar(Complejo primerComplejo, Complejo segundoComplejo)
        {
            var parteReal = primerComplejo.Real - segundoComplejo.Real;
            var parteImaginaria = primerComplejo.Imaginaria - segundoComplejo.Imaginaria;
            var nuevoComplejo = new Complejo(parteReal, parteImaginaria);

            return nuevoComplejo;
        }
        public double Dividir (double dividiendo, double divisor)
        {
            if(divisor == 0)
            {
                throw new System.ArgumentException();
            }
            return dividiendo / divisor;
        }
        public double Multiplicar(double primerNumero, double segundoNumero)
        {
            return primerNumero * segundoNumero;
        }
        public double Exponente(double primerNumero)
        {
            return primerNumero * primerNumero;
        }
    }
}