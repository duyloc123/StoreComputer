using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreComputer.Models;

using PagedList;
using System.Web.UI;
using System.Collections.ObjectModel;
using System.Security.Cryptography;

namespace StoreComputer.Controllers
{
    public class LinhKienController : Controller
    {
        StoreComputerEntities1 db = new StoreComputerEntities1();
        // GET: LinhKien
        public ActionResult DanhSachLinhKien(int ?page)
        {
            if (page == null) page = 1;
            int pageNumber = page ?? 1;
            int pageSize = 6; //hiện bao nhiu tên trong 1 trang
            var danhSach = (from s in db.HangHoas
                            where s.maLoai != 1
                            orderby s.maHang
                            select s).ToPagedList(pageNumber, pageSize);

            return View(danhSach);
        }
        public ActionResult ChiTietLinhKien(int id)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            HangHoa hangHoas = db.HangHoas.Find(id);

            return View(hangHoas);
        }
        public ActionResult TimKiemLinhKien(String search)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            var linhkien = db.HangHoas.Where(p => p.tenHang.Contains(search)).ToList();
            return View(linhkien);
        }
        public ActionResult DanhMucLinhKien(int id)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            var danhMuc = db.HangHoas.Where(p => p.maLoai == id).ToList();
            return View(danhMuc);
        }
        public ActionResult TangDan()
        {
            var tangdan = (from s in db.HangHoas
                           where s.maLoai != 1
                           orderby s.giaMoi ascending
                           select s).ToList();
            return View(tangdan);
        }
        public ActionResult GiamDan()
        {
            var giamdan = (from s in db.HangHoas
                           where s.maLoai != 1
                           orderby s.giaMoi descending
                           select s).ToList();
            return View(giamdan);
        }
    }
}