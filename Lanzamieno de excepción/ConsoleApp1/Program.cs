using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            var cont = 0;
            do
            {
                Console.WriteLine("Ingese un número");
                int numero = int.Parse(Console.ReadLine());
                try
                {
                    Console.WriteLine(NombreDelMes(numero));
                }
                catch (Exception e)
                {
                    Console.WriteLine("El mensaje de error: " + e.Message);
                }
                cont++;
            } while (cont <= 3); 
            
            
            // Creen una exception propia Heredar dispara la exception try de esa exception
        }
     

        public static string NombreDelMes(int mes)
        {
            switch (mes)
            {
                case 1:
                    return "Enero";
                case 2:
                    return "Febrero";
                case 3:
                    return "Marzo";
                case 4:
                    return "Abril";
                case 5:
                    return "Mayo";
                case 6:
                    return "Junio";
                case 7:
                    return "Julio";
                case 8:
                    return "Agosto";
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
    }
}
