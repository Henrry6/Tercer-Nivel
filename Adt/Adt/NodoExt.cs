using System;
using System.Collections.Generic;
using System.Linq;

namespace Adt
{
    public class NodoExt
    {
        public NodoExt ()
        {

        }
        public object Contenido { get; set; }
        public List<NodoExt> Hijos { get; set; }
        public static int ContarNodos(NodoExt nodo)
        {
            if (nodo == null)
                return 0;

            if (nodo.Hijos == null)
                return 1;

            int nietos = 0;
            for (int i = 0; i < nodo.Hijos.Count(); i++)
            {
                nietos += ContarNodos(nodo.Hijos[i]);
            }
            return nietos + 1;
        }
        public void PonerValor(object obj)
        {
            this.Contenido = obj;
        }
        public static int ContarHojas(NodoExt nodo)
        {
            if (nodo.Hijos == null)
                return 1;

            int nietos = 0;
            for (int i = 0; i < nodo.Hijos.Count(); i++)
            {
                nietos += ContarHojas(nodo.Hijos[i]);
            }
            return nietos + 1;
        }

    }

}
