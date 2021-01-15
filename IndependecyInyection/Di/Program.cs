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
            IronMan ironman = new IronMan("IronMan", "pisparar");
             Hulk hulk = new Hulk("Hulk", "Golpear");

            var kernel = new StandardKernel();
            kernel.Bind<IArmas>().To<Armasx>();
            var usuario = kernel.Get<Usuario>();
            usuario.Jugar(ironman, hulk);
            IArmas armas = new Armasx();
            Usuario user = new Usuario(armas);
            user.Jugar(ironman, hulk);
        }

    }
}
