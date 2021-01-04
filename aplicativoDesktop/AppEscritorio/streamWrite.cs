using System.IO;

namespace AppEscritorio
{
    internal class streamWrite
    {
        private FileStream stream;

        public streamWrite(FileStream stream)
        {
            this.stream = stream;
        }
    }
}