using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AutenticacionPersonalizada.Utilidades;

namespace AutenticacionPersonalizada.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var cifrado = SeguridadUtilidades.Cifrar("Hola don pepito", "zxcvbnmñlkjhgfdsapoiuytrewq098776544332211");

            var data = Convert.FromBase64String(cifrado);

            var descifrado = SeguridadUtilidades.DesCifrar(data, "zxcvbnmñlkjhgfdsapoiuytrewq098776544332211");

            return View();
        }
    }
}