using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using StoreComputer.Models;
namespace StoreComputer.Controllers
{
    public class LinkController : Controller
    {
        // GET: Link
        public ActionResult Index(int? page)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();

            return View();
        }
    }
}