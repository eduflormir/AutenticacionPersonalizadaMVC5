using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace AutenticacionPersonalizada.Utilidades
{
    public class SeguridadUtilidades
    {
        /// <summary>
        /// Recibe un texto y devuelve una cadena convertida utilizando el algoritmo SHA1
        /// </summary>
        /// <param name="texto"></param>
        /// <returns></returns>
        public static String GetSha1(String texto)
        {
            var sha = SHA1.Create(); // crea el codificador de SHA1
            // ASCIIEncoding encoding = new ASCIIEncoding(); // ASCII es la codificación mas primitiva
            UTF8Encoding encoding = new UTF8Encoding(); // UNICODE
            byte[] datos; // para volcar el contenido
            StringBuilder builder = new StringBuilder(); 
            datos = sha.ComputeHash(encoding.GetBytes(texto)); // me convierte en array de bytes 

            for (int i = 0; i < datos.Length; i++)
            {
                // {0:x2} hexadecimal de 2 digitos por byte
                builder.AppendFormat("{0:x2}",datos[i]);
            }

            return datos.ToString();
        }

        public static byte[] GetKey(String txt)
        {
            return new PasswordDeriveBytes(txt, null).GetBytes(32);
        }

        /// <summary>
        /// Recibe un texto plano  y lo devuelve cifrado
        /// Cifrado Simetrico
        /// </summary>
        /// <param name="contenido"></param>
        /// <param name="clave"></param>
        /// <returns></returns>
        public static String Cifrar(String contenido, String clave)
        {
            var encoding = new UTF8Encoding();
            var cripto = new RijndaelManaged(); // es un algotimo de cifrado, para cifrar
            //var iv = cripto.GenerateIV(); // Vector de inicialización: es un vector que tiene la semilla de inicialización
            // Este IV

            byte[] cifrado;
            byte[] retorno;
            byte[] key = encoding.GetBytes(clave); // recibo una clave alfanumerica y devuelvo los bytes desde una cadena UTF8

            cripto.Key = key;
            cripto.GenerateIV(); // genera numeros aleatorios (semillas)
            // voy a crear el encriptador
            byte[] aEncriptar = encoding.GetBytes(contenido); // recibo contenido y lo convierto a array de bites

            // ya lo tengo cifrado
            cifrado = cripto.CreateEncryptor().TransformFinalBlock(aEncriptar,0,aEncriptar.Length); // transforma el contenido desde 0 hasta que termine

            retorno = new byte[cripto.IV.Length + cifrado.Length]; // longitud del IV + el tamaño del cifrado
            cripto.IV.CopyTo(retorno,0); // donde quiero copiar, en que posición quiero copiar
            cifrado.CopyTo(retorno,cripto.IV.Length); // 

            return encoding.GetString(retorno); // te lo devuelvo como cadena UTF8
        }

        /// <summary>
        /// Recibe un texto y lo devuelve descifrado el texto plano
        /// DesCifrado Simetrico
        /// </summary>
        /// <param name="contenido"></param>
        /// <param name="clave"></param>
        /// <returns></returns>
        public static String DesCifrar(String contenido, String clave)
        {
            UTF8Encoding encoding = new UTF8Encoding();
            var cripto = new RijndaelManaged();
            var ivTemp = new byte[cripto.IV.Length]; // array con el tamaño del algoritmo
            var datos = encoding.GetBytes(contenido); // contenido cifrado
            var key = encoding.GetBytes(clave); // es la clave
            var cifrado = new byte[datos.Length - ivTemp.Length]; // longitud de datos - el tamaño de IV temporal

            cripto.Key = key;
            Array.Copy(datos, ivTemp, ivTemp.Length); // Datos, de donde, a donde, hasta la longitud de IV temp
            Array.Copy(datos,ivTemp.Length,cifrado,0,cifrado.Length); // Datos, desde ivTemp.Length,  Destino, de 0, hasta cifrado.Length

            cripto.IV = ivTemp;
            var descifrado = cripto.CreateDecryptor().TransformFinalBlock(cifrado, 0, cifrado.Length);
            return encoding.GetString(descifrado);
        }
    }
}
