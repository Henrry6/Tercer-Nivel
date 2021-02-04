using Armas1;
using Interface;
using Ninject;
using Personajes;
using DoAction;
using System;
using System.Reflection;

namespace Di
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ingrese un nombre");
            var name = Console.ReadLine();

            Console.WriteLine("Ingrese una habilidad");
            var skill = Console.ReadLine();

            var kernel = new StandardKernel();
            kernel.Load(Assembly.GetExecutingAssembly());
            IArma nuevaArma = kernel.Get<IArma>();

            PersonajeNew personaje = new PersonajeNew(name, skill);
            Usuario user = new Usuario(nuevaArma);
            user.Jugar(personaje);
           
        }

    }
}
