using System;
using System.Threading;

namespace HenrryAlvaradoPruebaConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Thread persona = new Thread(Metodo);
            persona.Start();
            for (int i = 0; i <= 96; i++)
            {
                var cantidad = new Random();
                //cantidad.Next(1, 6);
                Console.Write("perona#" + cantidad);
            }
            //Console.Read();

            static void Metodo()
            {

                var edificio = 12;
                var departamentos = 8;
                var totalDepartamentos = edificio * departamentos;


                for (int i = 0; i <= totalDepartamentos; i++)
                {
                    //pasos += random.Next(0, 4);
                    var personas = new Random();
                    Console.WriteLine("Persona");
                    Thread.Sleep(personas.Next(1, 6));

                }

            }
        }
    }

}
