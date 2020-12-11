namespace Matematica.Negocio
{
    public class Complejo
    {
        private int x;
        private int y;

        public Complejo(int x, int y)
        {
            this.x= x;
            this.y = y;
        }

        public int Real { get; internal set; }
        public int Imaginaria { get; internal set; }
    }
}