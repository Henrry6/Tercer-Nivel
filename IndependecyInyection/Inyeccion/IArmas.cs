
namespace Interface
{
    public interface IArma
    {
        bool Disparar(IPersonaje personaje);
        bool Golpear(IPersonaje personaje);
    }
    public interface IPersonaje
    {
        string Nombre { get; }
        string Habilidad { get; }
    }
}
