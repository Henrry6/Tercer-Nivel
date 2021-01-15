using Interface;
using Ninject.Modules;
using Armas1;
using System;

namespace DependecyInyection
{
    public class Fussion : NinjectModule
    {
        public override void load()
        {
            Bind<IArmas>().To<Armasx>();
        }
    }
}
