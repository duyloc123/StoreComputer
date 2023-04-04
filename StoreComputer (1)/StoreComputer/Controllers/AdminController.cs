using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreComputer.Models;

using PagedList;
using System.Web.UI;
using System.Collections.ObjectModel;

namespace StoreComputer.Controllers
{
    public class AdminController : Controller
    {

        StoreComputerEntities1 db = new StoreComputerEntities1();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult dangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult dangNhap(FormCollection collection)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            var tendn = collection["user"];
            var matkhau = collection["password"];
            TaiKhoan kh = db.TaiKhoans.SingleOrDefault(n => n.TaiKhoan1 == tendn && n.MatKhau == matkhau);
            if (kh != null)
            {
                return RedirectToAction("Index", "Admin");
            }
            return View();
        }

        public ActionResult HangHoa(int? page)
        {

            StoreComputerEntities1 db = new StoreComputerEntities1();

            if (page == null) page = 1;
            int pageNumber = page ?? 1;
            int pageSize = 5; //hiện bao nhiu tên trong 1 trang
            var listHangHoa = db.HangHoas.OrderBy(x => x.maHang).ToPagedList(pageNumber, pageSize);

            return View(listHangHoa);
        }
        public ActionResult timKiemHangHoa(string SearchHH)
        {
            var hangHoa = db.HangHoas.Where(p => p.tenHang.Contains(SearchHH)).ToList();
            return View(hangHoa);
        }
        public ActionResult ThemHangHoa()
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            var hangHoa = db.HangHoas.ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemHangHoa(HangHoa model,HttpPostedFileBase fileAnh)
        {
            if(fileAnh.ContentLength > 0)
            {
                string rootFolder = Server.MapPath("/Data/");
                string pathImage = rootFolder + fileAnh.FileName;
                fileAnh.SaveAs(pathImage);
                model.hinhAnh = "Data/" + fileAnh.FileName;
            }
            StoreComputerEntities1 db = new StoreComputerEntities1();
                db.HangHoas.Add(model);
                db.SaveChanges();
                return RedirectToAction("HangHoa");
        }

        public ActionResult editHangHoa(int? id)
        {
            var listhangHoa = db.HangHoas.ToList();
            if (id == null)
            {
                return HttpNotFound();
            }
            HangHoa hangHoa = listhangHoa.Find(p => p.maHang == id);
            if (hangHoa == null)
            {
                return HttpNotFound();
            }
            return View(hangHoa);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult editHangHoa(HangHoa hangHoa, HttpPostedFileBase fileAnh)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var listhangHoa = db.HangHoas.ToList();
                    var updateModel = listhangHoa.Find(p => p.maHang == hangHoa.maHang);
                    updateModel.maHang = hangHoa.maHang;
                    updateModel.maLoai = hangHoa.maLoai;
                    updateModel.maNCC = hangHoa.maNCC;
                    updateModel.tenHang = hangHoa.tenHang;
                    updateModel.ngayNhap = hangHoa.ngayNhap;
                    updateModel.giaMoi = hangHoa.giaMoi;
                    updateModel.giaCu = hangHoa.giaCu;
                    updateModel.giamGia = hangHoa.giamGia;
                    updateModel.soLuong = hangHoa.soLuong;
                    string rootFolder = Server.MapPath("/Data/");
                    string pathImage = rootFolder + fileAnh.FileName;
                    fileAnh.SaveAs(pathImage);
                    hangHoa.hinhAnh = "Data/" + fileAnh.FileName;
                    updateModel.hinhAnh = hangHoa.hinhAnh;
                    updateModel.moTa = hangHoa.moTa;
                    updateModel.maTaChiTiet = hangHoa.maTaChiTiet;
                    updateModel.trangThaiSP = hangHoa.trangThaiSP;

                    db.SaveChanges();

                }
                catch (Exception ex)
                {
                    return HttpNotFound();
                }
            }
            else
            {
                ModelState.AddModelError("", "Sửa dữ liệu thông tin hàng hóa không thành công");
                return View(hangHoa);
            }

            return RedirectToAction("HangHoa");
        }
        public ActionResult DetailHangHoa(int? id)
        {
            var listhangHoa = db.HangHoas.ToList();
            if (id == null)
            {
                return HttpNotFound();
            }
            HangHoa hangHoa = listhangHoa.Find(p => p.maHang == id);
            if (hangHoa == null)
            {
                return HttpNotFound();
            }
            return View(hangHoa);
        }
        public ActionResult XoaHangHoa(int? id)
        {
            var listhangHoas = db.HangHoas.ToList();
            HangHoa hangHoa = listhangHoas.Find(p => p.maHang == id);
            db.HangHoas.Remove(hangHoa);
            db.SaveChanges();
            return RedirectToAction("HangHoa");
        }
            /*-- Nha Cung Cap --*/
            public ActionResult DanhSachNhaCungCap(int? page)
        {
            if (page == null) page = 1;
            int pageNumber = page ?? 1;
            int pageSize = 5; //hiện bao nhiu tên trong 1 trang
            var nhaCungcap = db.NhaCungCaps.OrderBy(x => x.maNCC).ToPagedList(pageNumber, pageSize);

            return View(nhaCungcap);
        }
        public ActionResult timKiemNCC(string SearchString)
        {
            var nhacungCaps = db.NhaCungCaps.Where(p => p.tenNCC.Contains(SearchString)).ToList();
            return View(nhacungCaps);
        }
        public ActionResult editNCC(int? id)
        {
            var listnhaCungCap = db.NhaCungCaps.ToList();
            if(id == null)
            {
                return HttpNotFound();
            }
            NhaCungCap ncc = listnhaCungCap.Find(p => p.maNCC == id);
            if(ncc == null)
            {
                return HttpNotFound();
            }
            return View(ncc);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult editNCC(NhaCungCap ncc)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var listnhaCungCap = db.NhaCungCaps.ToList();
                    var updateModel = listnhaCungCap.Find(p => p.maNCC == ncc.maNCC);
                    updateModel.maNCC = ncc.maNCC;
                    updateModel.tenNCC = ncc.tenNCC;
                    updateModel.diaChi = ncc.diaChi;
                    updateModel.soDienThoai = ncc.soDienThoai;
                    db.SaveChanges();
                    
                }
                catch (Exception ex)
                {
                    return HttpNotFound();
                }
            }
            else
            {
                ModelState.AddModelError("", "Sửa dữ liệu thông tin nhà cung cấp không thành công");
                return View(ncc);
            }
            
            return RedirectToAction("DanhSachNhaCungCap");
        }
        public ActionResult DetailNCC(int? id)
        {
            var listnhaCungCap = db.NhaCungCaps.ToList();
            if (id == null)
            {
                return HttpNotFound();
            }
            NhaCungCap ncc = listnhaCungCap.Find(p => p.maNCC == id);
            if (ncc == null)
            {
                return HttpNotFound();
            }
            return View(ncc);
        }
        public ActionResult DeleteNCC(int? id)
        {
            var listnhaCungCap = db.NhaCungCaps.ToList();
            NhaCungCap ncc = listnhaCungCap.Find(p => p.maNCC == id);
            db.NhaCungCaps.Remove(ncc);
            db.SaveChanges();
            return RedirectToAction("DanhSachNhaCungCap");
        }
        public ActionResult CreateNCC()
        {
            var listnhaCungCap = db.NhaCungCaps.ToList();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateNCC(NhaCungCap ncc)
        {
                db.NhaCungCaps.Add(ncc);
                db.SaveChanges();
                return RedirectToAction("DanhSachNhaCungCap");
        }
        /*-- Loại Hàng -- */
        public ActionResult DanhSachLoaiHang(int? page)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();

            if (page == null) page = 1;
            int pageNumber = page ?? 1;
            int pageSize = 5; //hiện bao nhiu tên trong 1 trang
            var listLoaiHang = db.LoaiHangs.OrderBy(x => x.maLoai).ToPagedList(pageNumber, pageSize);
 
            return View(listLoaiHang);
        }
        public ActionResult timKiemLoaiHang(string Search)
        {
            var loaiHang = db.LoaiHangs.Where(p => p.tenLoai.Contains(Search)).ToList();
            return View(loaiHang);
        }
        public ActionResult CreateLoaiHang()
        {
            var listLoaiHang = db.LoaiHangs.ToList();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateLoaiHang(LoaiHang lh)
        {
            var listLoaiHang = db.LoaiHangs.ToList();
            if (lh.maLoai > 0)
            {
                db.LoaiHangs.Add(lh);
                db.SaveChanges();
                return RedirectToAction("DanhSachLoaiHang");
            }
            else
            {
                ModelState.AddModelError("", "Thêm loại hàng không thành công , vui lòng kiểm tra lại thông tin");
                return View(lh);
            }
        }
        public ActionResult DetailLoaiHang(int? id)
        {
            var listLoaiHang = db.LoaiHangs.ToList();
            if (id == null)
            {
                return HttpNotFound();
            }
            LoaiHang lh = listLoaiHang.Find(p => p.maLoai == id);
            if (lh == null)
            {
                return HttpNotFound();
            }
            return View(lh) ;
        }

        public ActionResult EditLoaiHang(int? id)
        {
            var listLoaiHang = db.LoaiHangs.ToList();
            if (id == null)
            {
                return HttpNotFound();
            }
            LoaiHang lh = listLoaiHang.Find(p => p.maLoai == id);
            if (lh == null)
            {
                return HttpNotFound();
            }
            return View(lh);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditLoaiHang(LoaiHang lh)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var listLoaiHang = db.LoaiHangs.ToList();
                    var updateModel = listLoaiHang.Find(p => p.maLoai == lh.maLoai);
                    updateModel.maLoai = lh.maLoai;
                    updateModel.tenLoai = lh.tenLoai;
                    db.SaveChanges();

                }
                catch (Exception ex)
                {
                    return HttpNotFound();
                }
            }
            else
            {
                ModelState.AddModelError("", "Sửa dữ liệu thông tin loại hàng không thành công");
                return View(lh);
            }

            return RedirectToAction("DanhSachLoaiHang");
        }
        public ActionResult DeleteLoaiHang(int? id)
        {
            var listLoaiHang = db.LoaiHangs.ToList();
            LoaiHang lh = listLoaiHang.Find(p => p.maLoai == id);
            db.LoaiHangs.Remove(lh);
            db.SaveChanges();
            return RedirectToAction("DanhSachLoaiHang");
            
        }
        /*-- Khách Hàng -- */

        public ActionResult DanhSachKhachHang(int? page)
        {
      

            if (page == null) page = 1;
            int pageNumber = page ?? 1;
            int pageSize = 3; //hiện bao nhiu tên trong 1 trang
            var listkhachHang = db.KhachHangs.OrderBy(x => x.maKH).ToPagedList(pageNumber, pageSize);

            return View(listkhachHang);
            
        }
        public ActionResult xoaKhachHang(int? id)
        {
            var kh = db.KhachHangs.ToList();
            KhachHang khach = kh.Find(p => p.maKH == id);
            db.KhachHangs.Remove(khach);
            db.SaveChanges();
            return RedirectToAction("DanhSachKhachHang");
        }
        public ActionResult DonHang()
        {
            var listdonhang = db.DatHangs.ToList();
            return View(listdonhang);
        }
        public ActionResult chiTietDonHang(int id)
        {
            StoreComputerEntities1 db = new StoreComputerEntities1();
            ChiTietDatHang ct = db.ChiTietDatHangs.FirstOrDefault(x => x.maHD == id);
            return View(ct);
        }
        public ActionResult suaDonHang(int id)
        {
            var listDonHang = db.DatHangs.ToList();
            if (id == null)
            {
                return HttpNotFound();
            }
            DatHang dh = listDonHang.Find(p => p.maHD == id);
            if (dh == null)
            {
                return HttpNotFound();
            }
            return View(dh);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult suaDonHang(DatHang dh)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var listDatHang = db.DatHangs.ToList();
                    var updateModel = listDatHang.Find(p => p.maHD == dh.maHD);
                    updateModel.tenKhachHang = dh.tenKhachHang;
                    updateModel.sdtKhachHang = dh.sdtKhachHang;
                    updateModel.diaChi = dh.diaChi;
                    updateModel.ghiChu = dh.ghiChu;
                    updateModel.tongTien = dh.tongTien;
                    updateModel.ptThanhToan = dh.ptThanhToan;
                    updateModel.tinhtrangThanhToan = dh.tinhtrangThanhToan;
                    updateModel.tinhtrangDonHang = dh.tinhtrangDonHang;
                    db.SaveChanges();

                }
                catch (Exception ex)
                {
                    return HttpNotFound();
                }
            }
            else
            {
                ModelState.AddModelError("", "Sửa dữ liệu thông tin đơn hàng không thành công");
                return View(dh);
            }

            return RedirectToAction("DonHang");
        }
        public ActionResult timKiemDonHang(string SearchString)
        {
            var datHang = db.DatHangs.Where(p => p.tinhtrangThanhToan.Contains(SearchString)).ToList();
            return View(datHang);
        }
    }
}