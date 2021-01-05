using System;

namespace Adt
{
    public class Nodo
    {
        private Nodo nodo;

        public Nodo()
        {

        }
        public Nodo(string nombre)
        {
            Nombre = nombre;
        }

        public Nodo(string nombre, Nodo nodo) : this(nombre)
        {
            this.nodo = nodo;
        }

        public Nodo(string nombre, Nodo izquierdo, Nodo derecho)
        {
            Nombre = nombre;
            Izquierdo = izquierdo;
            Derecho = derecho;

        }
        public string Nombre { get; set; }
        public Nodo Izquierdo { get; set; }
        public Nodo Derecho { get; set; }
    }
}
