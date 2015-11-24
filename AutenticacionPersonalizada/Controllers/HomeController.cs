using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AutenticacionPersonalizada.Utilidades;

namespace AutenticacionPersonalizada.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        // GET: Home
        //public ActionResult Index()
        //{

        //    // para recuperar una clave desde WebConfig
        //    var clave = ConfigurationManager.AppSettings["ClaveCifrado"];

        //    var cifrado = SeguridadUtilidades.Cifrar("luis.gil@tajamar365.com", clave);

        //    var data = Convert.FromBase64String(cifrado);

        //    var descifrado = SeguridadUtilidades.DesCifrar(data, clave);

        //    return View();
        //}

        public ActionResult Index()
        {
            return View();
        }
    }
}