using System;
using System.IO;
using System.Threading;

namespace HiloPool
{
    class Program
    {
        const string path = @"C:\Users\princ\Documentos\Pool\"; 
        static void Main(string[] args)
        {


            //UN POOL de hilos tiene un conjunto de hilos lo cuales
            //se van reutilizando segun se vayan desocupando
            Console.WriteLine("Hello World!");
            int max, c = 0;
            ThreadPool.GetMaxThreads(out max, out c);
            Console.WriteLine(max);

            for (int i=0; i<50; i++)
            {
                ThreadPool.QueueUserWorkItem(CrearArchivo, i);
                while (ThreadPool.PendingWorkItemCount > 0) ;
            }

        }
        static void CrearArchivo(object data)
        {
            int i= (int)data;
            using (var sw = new StreamWriter(path + i + "txt"))
            {
                sw.WriteLine("El hilo # " + Thread.CurrentThread.ManagedThreadId);
            }
            Console.WriteLine("Es el hilo # " + Thread.CurrentThread.ManagedThreadId);
        }
    }
}
