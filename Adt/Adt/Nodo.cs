using System;

namespace Adt
{
    public class Nodo
    {
        public Nodo()
        {

        }
        public Nodo(string nombre)
        {
            Nombre = nombre;
        }
        public Nodo(string nombre, Nodo izquierdo, Nodo derecho)
        {
            Nombre = nombre;
            Izquierdo = izquierdo;
            Derecho = derecho;
        }
        public string Nombre { get; set; }
        // public List<Nodo> Hijos { get; set }
        public Nodo Izquierdo { get; set; }
        public Nodo Derecho { get; set; }
    }
    //metodo imprimir recursivo
    //AdministradorNodo  an = new AdministradorNodo();
    //an.Imprimir(raiz);
}
