using PagedList;
using StoreComputer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

using PagedList;
using System.Web.UI;
using System.Collections.ObjectModel;
using System.Web.UI.WebControls.Expressions;
using System.Security.Cryptography;

namespace StoreComputer.Controllers
{
    public class LaptopController : Controller
    {
        StoreComputerEntities1 db = new StoreComputerEntities1();
        // GET: Laptop
        public ActionResult Index(int? page)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            return View();
        }
        public ActionResult DanhSachLaptop(int ?page)
        {
            if (page == null) page = 1;
            int pageNumber = page ?? 1;
            int pageSize = 6; //hiện bao nhiu tên trong 1 trang
            var listdanhSach = (from s in db.HangHoas
                                where s.maLoai == 1
                                orderby s.maHang select s).ToPagedList(pageNumber, pageSize);
            return View(listdanhSach);
        }
        public ActionResult ChiTietLaptop(int id)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            HangHoa hangHoas = db.HangHoas.Find(id);

            return View(hangHoas);
        }
        public ActionResult TimKiemLaptop(String search)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            var laptop = db.HangHoas.Where(p => p.tenHang.Contains(search)).ToList();
            return View(laptop) ;
        }
        public ActionResult DanhMucLaptop(int id)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            var danhMuc = db.HangHoas.Where(p => p.maNCC == id).ToList();
            return View(danhMuc);
        }
        public ActionResult giamDan()
        {
            var laptop = (from s in db.HangHoas where s.LoaiHang.tenLoai == "Laptop" orderby s.giaMoi descending select s).ToList();
            return View(laptop);
        }
        public ActionResult tangDan()
        {
            var laptop = (from s in db.HangHoas where s.LoaiHang.tenLoai == "Laptop" orderby s.giaMoi ascending select s).ToList();
            return View(laptop);
        }
    }
}