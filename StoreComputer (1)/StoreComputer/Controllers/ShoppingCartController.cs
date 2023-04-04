using StoreComputer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using StoreComputer.Models;
using System.Web.DynamicData;
using System.Web.UI.WebControls.WebParts;

namespace StoreComputer.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        StoreComputerEntities1 db = new StoreComputerEntities1();
        public ActionResult Index()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return View(cart.items);
            }
            return View();
        }
        public ActionResult ShowCount()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return Json(new { Count = cart.items.Count},JsonRequestBehavior.AllowGet);
            }
            return Json(new {Count = 0},JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AddToCart(int id,int soLuong)
        {
            var code = new
            {
                Success = false,
                msg = "",
                code = -1,
                Count = 0,
            };
            var db = new StoreComputerEntities1();
            var checkHangHoa = db.HangHoas.FirstOrDefault(x => x.maHang == id);
            if(checkHangHoa != null)
            {
                ShoppingCart cart = (ShoppingCart)Session["Cart"];
                if(cart == null)
                {
                    cart = new ShoppingCart();
                }
                ShoppingCartItem item = new ShoppingCartItem
                {
                    maHang = checkHangHoa.maHang,
                    tenHang = checkHangHoa.tenHang,
                    loaiHang = checkHangHoa.LoaiHang.tenLoai,
                    soLuong = soLuong,
                    hinhAnh = checkHangHoa.hinhAnh,

                };
                item.giaTien = (float)checkHangHoa.giaMoi;
                item.tongTien = item.soLuong * (decimal)item.giaTien;
                cart.AddToCart(item, soLuong);
                Session["Cart"] = cart;
                code = new
                {
                    Success = true,
                    msg = "Thêm sản phẩm vào giỏ hàng thành công! ",
                    code = 1,
                    Count = cart.items.Count,
                };
            }
            return Json(code);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            var code = new { msg = "", code = - 1, Count = 0 };
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if(cart != null)
            {
                var checkHangHoa = cart.items.FirstOrDefault(x => x.maHang == id);
                if(checkHangHoa != null)
                {
                    cart.remove(id);
                    code = new { msg = "", code = 1, Count = cart.items.Count };
                }
            }
            return Json(code);
        }
        [HttpPost]
        public ActionResult DeleteAll()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if(cart != null)
            {
                cart.clearCart();
                return Json(new { Success = true });
            }
            return Json(new { Success = false });
        }
        [HttpPost]
        public ActionResult Update(int id, int soLuong)
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                cart.capnhapSL(id,soLuong);
                return Json(new { Success = true });
            }
            return Json(new { Success = false });
        }
        public ActionResult thanhToan()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult thanhToan(DatHangViewModel req)
        {
            var code = new { Success = false, Code = -1 };
            if (ModelState.IsValid)
            {
                ShoppingCart cart = (ShoppingCart)Session["Cart"];
                if (cart != null)
                {
                    DatHang dh = new DatHang();
                    dh.tenKhachHang = req.tenKhachHang;
                    dh.sdtKhachHang = req.sdtKhachHang;
                    dh.diaChi = req.diaChi;
                    dh.ghiChu = req.ghiChu;
                    dh.tinhtrangThanhToan = "Chưa thanh toán";
                    dh.tinhtrangDonHang = "Chưa giao hàng";
                    cart.items.ForEach(x => dh.ChiTietDatHangs.Add(new ChiTietDatHang
                    {
                        maHang = x.maHang,
                        soLuong = x.soLuong,
                        thanhTien = x.giaTien,
                    }));
                    dh.tongTien = cart.items.Sum(x => (x.giaTien * x.soLuong));
                    dh.ptThanhToan = req.ptThanhToan;
                    Random rand = new Random(10000);
                    dh.maHD = rand.Next();
                    db.DatHangs.Add(dh);
                    db.SaveChanges();
                    code = new { Success = true, Code = 1 };
                    return RedirectToAction("thanhToanThanhCong");
                }
            }
            return Json(code);
        }
        public ActionResult thanhToanThanhCong()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            cart.clearCart();
            return View();
        }
        public ActionResult partial_item_thanhToan()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return View(cart.items);
            }
            return PartialView();
        }
    }
}