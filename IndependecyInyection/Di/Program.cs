using Armas1;
using Interface;
using Ninject;
using Personajes;
using DoAction;
using System;

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
            //IPersonaje personaje = new PersonajeNew(name, skill)
            var kernel = new StandardKernel();
            kernel.Bind<IArma>().To<ArmaX>();
            var usuario = kernel.Get<Escopeta>();
            PersonajeNew personaje = new PersonajeNew(name, skill);
            Console.WriteLine(personaje);
            IArma arma = new ArmaX();
            Usuario user = new Usuario(arma);
            usuario.Disparar(name);
        }

    }
}
