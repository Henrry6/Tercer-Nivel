using System;
using System.Threading;

namespace Hilo
{
    class Carrera
    {
        public static void Corredor(object obj)
        {
            var nombre = (string)obj;

            //var hiloActual = Thread.CurrentThread;
            var pasos = 0;
            var random = new Random();

            while (pasos < 1000)
            {
                pasos += random.Next(0, 4);
                Console.WriteLine("Corredor {0} dio {1} pasos", nombre, pasos);
                Thread.Sleep(10);

            }
            Console.WriteLine("El corredor {0} llego a la meta ", nombre);
        }
    }

}

