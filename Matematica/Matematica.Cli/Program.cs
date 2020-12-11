using System;

namespace Matematica.Cli
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ingrese el primer numero");
            var primerNumero = Console.ReadLine();
            Console.WriteLine("Ingrese el segundo numero");
            var segundoNumero = Console.ReadLine();
            var calculadora = new Negocio.Calculadora();
            var resultado = calculadora.Sumar(int.Parse(primerNumero), int.Parse(segundoNumero));
            Console.WriteLine("La suma de los numeros es: " + resultado);
        }
    }
}
