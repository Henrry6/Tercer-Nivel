using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Transacciones
{
    public partial class Form1 : Form
    {
        string parametros = "Server=localhost; Port=5432; User Id=postgres; Password=192021; Database=SystemBank";
        string query = "";
        string numero_cuenta1 = "";
        string numero_cuenta2 = "";
        int monto = 0;
        //int saldo = 0;
        
        DataSet datos = new DataSet();
        NpgsqlConnection con = new NpgsqlConnection();
        public Form1()
        {
            InitializeComponent();

            con.ConnectionString = parametros;
            try
            {
                con.Open();

            }catch (Exception error)
            {
                MessageBox.Show("ERRORrr: " + error.Message);
            }
            query = "SELECT * FROM \"Movimiento\".\"Cuenta\"";
            NpgsqlDataAdapter add = new NpgsqlDataAdapter(query, con);
            add.Fill(datos);
            dataGridView1.DataSource = datos.Tables[0];
            con.Close();


        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow fila = dataGridView1.CurrentRow;
            textBox4.Text = Convert.ToString(fila.Cells[0].Value);
            textBox5.Text = Convert.ToString(fila.Cells[5].Value);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            numero_cuenta2 = textBox1.Text;
            monto = Convert.ToInt32(textBox3.Text);
            DataGridViewRow fila1 = dataGridView1.CurrentRow;
            numero_cuenta1 = (string)fila1.Cells[0].Value;
            transferir(numero_cuenta1, numero_cuenta2, monto);
            query = "SELECT * FROM \"Movimiento\".\"Cuenta\"";
            NpgsqlDataAdapter add = new NpgsqlDataAdapter(query, con);
            add.Fill(datos);
            dataGridView1.DataSource = datos.Tables[0];
            con.Close();
            MessageBox.Show("Transferencia exitosa");
        }

        private void transferir(string numero_cuenta1, string numero_cuenta2, int monto)
        {
            try
            {
                var comand = new NpgsqlCommand();
                comand.Connection = con;
                comand.CommandText =
                    "BEGIN;";
                comand.ExecuteNonQuery();

                comand.CommandText =
                    "UPDATE " +
                    "\"Movimiento\".\"Cuenta\" SET saldo = saldo+'" + monto + "'" +
                    "WHERE numero_cuenta= '" + numero_cuenta2 + "';";
                comand.ExecuteNonQuery();
                comand.CommandText =
                    "UPDATE " +
                    "\"Movimiento\".\"Cuenta\" SET saldo = saldo-'" + monto + "'" +
                    "WHERE numero_cuenta= '" + numero_cuenta1 + "';";
                comand.ExecuteNonQuery();
                comand.CommandText =
                    "COMMIT;";
                comand.ExecuteNonQuery();
               

            }
            catch (Exception error)
            {
                MessageBox.Show("ERRORrr: " + error.Message);
                var comand = new NpgsqlCommand();
                comand.CommandText =
                    "ROLLBACK;";
                comand.ExecuteNonQuery();
            }
        }


        private void textBox3_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            
            con.Open();
            numero_cuenta2 = textBox1.Text;
            monto = Convert.ToInt32(textBox3.Text);
            DataGridViewRow fila1 = dataGridView1.CurrentRow;
            numero_cuenta1 = (string)fila1.Cells[0].Value;
            transferir2(numero_cuenta1, numero_cuenta2, monto);

            query = "SELECT * FROM \"Movimiento\".\"Cuenta\"";
            NpgsqlDataAdapter add = new NpgsqlDataAdapter(query, con);
            add.Fill(datos);
            dataGridView1.DataSource = datos.Tables[0];
            con.Close();
            MessageBox.Show("Transferencia exitosa");
        }

        private void transferir2(string numero_cuenta1, string numero_cuenta2, int monto)
        {
            try
            {
                var comand = new NpgsqlCommand();
                comand.Connection = con;
                comand.CommandText =
                    "BEGIN;";
                comand.ExecuteNonQuery();

                comand.CommandText =
                    "UPDATE " +
                    "\"Movimiento\".\"Cuenta\" SET saldo = saldo+'" + monto + "'" +
                    "WHERE numero_cuenta= '" + numero_cuenta2 + "';";
                comand.ExecuteNonQuery();
                comand.CommandText =
                    "UPDATE " +
                    "\"Movimiento\".\"Cuenta\" SET saldo = saldo-'" + monto + "'" +
                    "WHERE numero_cuenta= '" + numero_cuenta1 + "';";
                //problemas de conexion
                comand.ExecuteNonQuery();
                comand.CommandText =
                    "COMMIT;";
                comand.ExecuteNonQuery();
                comand.CommandText =
                    "ROLLBACK;";
                comand.ExecuteNonQuery();

                comand.CommandText =
                    "UPDATE " +
                    "\"Movimiento\".\"Cuenta\" SET saldo = saldo-'" + monto + "'" +
                    "WHERE numero_cuenta= '" + numero_cuenta2 + "';";
                comand.ExecuteNonQuery();
                comand.CommandText =
                    "UPDATE " +
                    "\"Movimiento\".\"Cuenta\" SET saldo = saldo+'" + monto + "'" +
                    "WHERE numero_cuenta= '" + numero_cuenta1 + "';";
                comand.ExecuteNonQuery();

            }
            catch (Exception error)
            {
                MessageBox.Show("ERRORrr: " + error.Message);
                var comand = new NpgsqlCommand();
                comand.CommandText =
                   "ROLLBACK;";
                comand.ExecuteNonQuery();
            }

        }
    }
}
