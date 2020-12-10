using System;
using System.Collections.Generic;
using System.Text;

namespace Matematica
{
    class Calculadora
    {
        public int Sumar(int num1, int num2)
        {
            return num1 + num2;
        }
        public int Restar(int num1, int num2) 
        {  
            return num1 - num2;
        }
        public int Multiplicar(int num1, int num2)
        {
            return num1 * num2;
        }
        public int Dividir(int num1, int num2)
        {
            return num1 / num2;
        }
        //public float Inverso( float num1 )
        //{
        //    //double elevadoalcuadrado = Math.Pow(num1, 2);
        //    //Console.WriteLine(string.Format("{0} elevado a la potencia{1} es {2}", num1, 2, elevadoalcuadrado));
        //    var cal = 1 / num1;
        //    return cal;
        //}
        public void Calcular()
        {
            Console.WriteLine("Qué operación desea ejecutar???");
            Console.WriteLine("sumar, restar, multiplicar, dividir, exponencial, inverso, raiz");


            var valor = Console.ReadLine();
           
            if( valor == "inverso")
            {
                Console.WriteLine("Ingrese un número");
            }else
            {
                Console.WriteLine("Ingrese dos numeros");

            }
            var num1 = Console.ReadLine();
            var num2 = Console.ReadLine();
            var calculadora = new Calculadora();

            switch (valor)
            {
                case "sumar":
                    var result = calculadora.Sumar(int.Parse(num1), int.Parse(num2));
                    Console.WriteLine(" La suma de los numeros es: " + result);
                    break;
                case "restar":
                    result = calculadora.Restar(int.Parse(num1), int.Parse(num2));
                    Console.WriteLine(" La resta de los numeros es: " + result);
                    break;
                case "multiplicar":
                    result = calculadora.Multiplicar(int.Parse(num1), int.Parse(num2));
                    Console.WriteLine(" La multiplicación de los numeros es: " + result);
                    break;
                case "dividir":
                    result = calculadora.Dividir(int.Parse(num1), int.Parse(num2));
                    Console.WriteLine(" La divición de los numeros es: " + result);
                    break;
                //case "inverso":
                //    result = calculadora.Inverso(String num1);
                //    Console.WriteLine(" La respuesta es: " + result);
                //    break;
                default:
                    Console.WriteLine("Algo salió mal, intentalo de nuevo");
                    break;
            }
            Console.ReadKey();
            Console.WriteLine("Deseas realizar otra operación???");
            Console.WriteLine("si - no");
            var answer = Console.ReadLine();
            if (answer == "si")
            {
                Calcular();
            }
            else if (answer == "no")
            {
                return;
            }

        }
    }
}
