namespace Matematica.Negocio
{
    public class Complejo
    {

        public Complejo(double real, double imaginario)
        {
            Real= real;
            Imaginaria = imaginario;
        }

        public double Real { get;  set; }
        public double Imaginaria { get;  set; }
    }
}