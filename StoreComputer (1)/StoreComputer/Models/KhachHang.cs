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
    using System.ComponentModel.DataAnnotations;

    public partial class KhachHang
    {
        [DisplayName("Mã khách hàng")]
        public int maKH { get; set; }
        [DisplayName("Tên khách hàng")]
        [Required(ErrorMessage ="Vui lòng nhập tên khách hàng")]
        public string tenKH { get; set; }
        [DisplayName("Địa chỉ")]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ khách hàng")]
        public string diaChi { get; set; }
        [DisplayName("Số điện thoại")]
        [Required(ErrorMessage ="Vui lòng nhập số điện thoại khách hàng")]
        [DataType(DataType.PhoneNumber,ErrorMessage ="Vui lòng nhập đúng số điện thoại")]
        public string soDienThoai { get; set; }
        [DisplayName("Tài khoản")]
        [Required(ErrorMessage = "Vui lòng nhập tài khoản khách hàng")]
        public string taiKhoan { get; set; }
        [DisplayName("Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập mật khách hàng")]
        public string matKhau { get; set; }
        [DisplayName("Email")]
        [Required(ErrorMessage = "Vui lòng nhập email khách hàng")]
        [DataType(DataType.EmailAddress,ErrorMessage ="Vui lòng nhập đúng email")]
        public string Email { get; set; }
    }
}