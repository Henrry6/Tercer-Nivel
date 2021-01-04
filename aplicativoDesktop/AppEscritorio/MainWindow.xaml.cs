using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AppEscritorio
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public object Filename { get; private set; }

        public MainWindow()
        {
            InitializeComponent();
        }

        string contraseña ;

        private void Button_Click(object sender, EventArgs e)
        {
            string user = boxUser.Text;
            string password = boxPassword.Text;
            string tempurl = "C:\\pruebas\\" + user + ".txt";
            if (File.Exists(tempurl))
            {
                contraseña = File.ReadAllText(tempurl);
                if (password.Equals(contraseña)) 
                {
                    //loguin exitoso
                    System.Windows.MessageBox.Show("Loguin exitoso");
                } else
                {
                    //falla por contraseña
                    System.Windows.MessageBox.Show("Contraseña incorrecta");
                }

            } else
            {
                //falla por usuario
                System.Windows.MessageBox.Show("Usuario incorrecto");
            }

        }
        private void Button_Registrar(object sender, EventArgs e)
        {
            string user = boxUser.Text;
            string password = boxPassword.Text;
            string tempurl = "C:\\pruebas\\" + user + ".txt";
            if (File.Exists(tempurl))
            {
                //Registro no valido
                System.Windows.MessageBox.Show("No se pudo registrar");

            } else
            {
                File.WriteAllText(tempurl, password);
                System.Windows.MessageBox.Show("Registro Exitoso");
                boxUser.Text = "";
                boxPassword.Text = "";

            }

        }
    }
}
