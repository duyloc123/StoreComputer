using StoreComputer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace StoreComputer.Controllers
{
    public class NguoiDungController : Controller
    {
        StoreComputerEntities1 db = new StoreComputerEntities1();
        // GET: NguoiDung
        public ActionResult Index()
        {
            return View();
        }
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] formData = Encoding.UTF8.GetBytes(str);
            byte[] tg = md5.ComputeHash(formData);
            string byte2String = null;
            for(int i = 0; i < tg.Length; i++)
            {
                byte2String += tg[i].ToString("x2");
            }
            return byte2String;
        }
        public ActionResult dangKy()
        {
            var khachHang = db.KhachHangs.ToList();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult dangKy(KhachHang kh)
        {
            if (ModelState.IsValid)
            {
                var check = db.KhachHangs.FirstOrDefault(p => p.taiKhoan == kh.taiKhoan);
                if(check == null)
                {
                    kh.matKhau = GetMD5(kh.matKhau);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.KhachHangs.Add(kh);
                    db.SaveChanges();
                    return RedirectToAction("DangNhap");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng ký tài khoản không thành công , vui lòng kiểm tra lại thông tin");
                    return View();
                }
            }
            return View();
        }

        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangNhap(String user , string password)
        {
            if (ModelState.IsValid)
            {
                var datas = db.TaiKhoans.Where(p=>p.TaiKhoan1.Equals(user) && p.MatKhau.Equals(password));
                if(datas.Count() > 0)
                {
                    return RedirectToAction("Index", "Admin");
                }else
                {
                    var _password = GetMD5(password);
                    var data = db.KhachHangs.Where(p => p.taiKhoan.Equals(user) && p.matKhau.Equals(_password));
                    if (data.Count() > 0)
                    {
                        Session["taiKhoan"] = data.FirstOrDefault().taiKhoan;
                        Session["maKH"] = data.FirstOrDefault().maKH;
                        return RedirectToAction("TrangChu", "Home");
                    }
                }
            }
            else
            {
                ModelState.AddModelError("", "Đăng nhập không thành công , vui lòng kiểm tra lại thông tin");
                return View();
            }
            return View();
        }
        public ActionResult Thoat()
        {
            Session.Clear();
            return RedirectToAction("DangNhap");
        }
    }
}