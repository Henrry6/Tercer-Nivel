using System;
using System.Threading;

namespace Hilo
{
    class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hello World!");
            //Thread Hilo1 = new Thread(MetodoEjecutar);
            //Thread Hilo2 = new Thread(MetodoEjecutar);
            //Console.WriteLine("Voy ejecturar hilo1");
            //Console.WriteLine("La cultura dle hilo principal es: {0}", Thread.CurrentThread.CurrentCulture);

            //Hilo1.Start();
            //Console.WriteLine("Voy ejecturar hilo1");
            //Hilo2.Start();

            //Thread.Sleep(1000);

            //Console.WriteLine("El hilo1 se junta");
            //Hilo1.Join();
            //Console.WriteLine("El hilo2 se junta");
            //Hilo2.Join();
            Thread corredor1 = new Thread(Carrera.Corredor);
            Thread corredor2 = new Thread(Carrera.Corredor);

            corredor1.Start("Henrry");
            corredor2.Start("David");

            corredor1.Join();
            corredor2.Join();



        }
        public static void MetodoEjecutar()
        {
            //To do:Here the code
            var hiloActual = Thread.CurrentThread;
            hiloActual.CurrentCulture = new System.Globalization.CultureInfo("es-Es");
            Console.WriteLine("Hilo actual {0}: ", hiloActual.ManagedThreadId);
            Console.WriteLine("Mi cultura {0}: ", hiloActual.CurrentCulture);
            var random = new Random();
            for (int i = 0; i <= 10; i++)
            {
                Console.WriteLine("Hilo {0} indice {i}", hiloActual.ManagedThreadId, i);
                Thread.Sleep(random.Next(100, 500));
            }

        }

    }
}
