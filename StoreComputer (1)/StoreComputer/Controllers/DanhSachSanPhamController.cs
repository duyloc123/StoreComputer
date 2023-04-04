using StoreComputer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreComputer.Controllers
{
    public class DanhSachSanPhamController : Controller
    {
        // GET: DanhSachSanPham
        public ActionResult Index(String search)
        {
            StoreComputerEntities db = new StoreComputerEntities();
            List<HangHoa> hangHoas = db.HangHoas.ToList();
            var sanpham = db.HangHoas.Where(p => p.tenHang.Contains(search)).ToList();
            return View(sanpham);
        }
    }
}