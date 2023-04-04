using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace StoreComputer.Models
{
    
    public class ShoppingCart
    {
        public List<ShoppingCartItem> items { get; set; }

        public ShoppingCart()
        {
            this.items = new List<ShoppingCartItem>();
        }
        public void AddToCart(ShoppingCartItem item,int soluong)
        {
            var check = items.FirstOrDefault(x => x.maHang == item.maHang);
            if (check != null)
            {
                check.soLuong += soluong;
                check.tongTien = (decimal)check.giaTien * check.soLuong;
            }
            else
            {
                items.Add(item);
            }
        }

        public void remove(int id)
        {
            var checkremove = items.SingleOrDefault(x => x.maHang== id);
            if(checkremove != null)
            {
                items.Remove(checkremove);
            }
        }
        public void capnhapSL(int id,int soLuong)
        {
            var check = items.SingleOrDefault(x => x.maHang == id);
            if(check != null)
            {
                check.soLuong = soLuong;
                check.tongTien = (decimal)check.giaTien * check.soLuong;
            }
        }
        public decimal tongTien()
        {
            return items.Sum(x => x.tongTien);
        }
        public int tongSL()
        {
            return items.Sum(x => x.soLuong);
        }
        public void clearCart()
        {
            items.Clear();
        }
    }
    public class ShoppingCartItem
    {
        public int maHang { get; set; }
        public string tenHang { get; set; }
        public string loaiHang { get; set; }
        public string hinhAnh { get; set; }
        public int soLuong { get; set; }
        public float giaTien { get; set; }
        public decimal tongTien { get; set; }
    }
}