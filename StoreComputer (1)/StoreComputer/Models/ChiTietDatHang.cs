﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreComputer.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;

    public partial class ChiTietDatHang
    {
        [DisplayName("Mã hóa đơn")]
        public int maHD { get; set; }
        [DisplayName("Mã hàng")]
        public int maHang { get; set; }
        [DisplayName("Số lượng")]
        public int soLuong { get; set; }
        [DisplayName("Thành tiền")]
        public double thanhTien { get; set; }
    
        public virtual DatHang DatHang { get; set; }
        public virtual HangHoa HangHoa { get; set; }
    }
}
