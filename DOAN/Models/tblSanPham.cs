﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DOAN.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class tblSanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblSanPham()
        {
            this.tblBinhLuans = new HashSet<tblBinhLuan>();
            this.tblChiTietDonHangs = new HashSet<tblChiTietDonHang>();
            this.tblChiTietPhieuNhaps = new HashSet<tblChiTietPhieuNhap>();
        }
    
        [Key]
        public int MaSanPham { get; set; }
        [Required(ErrorMessage ="Bạn chưa nhập tên sản phẩm!")]
        public string TenSanPham { get; set; }
        public string HinhAnh { get; set; }
        public string MoTa { get; set; }
        [Required(ErrorMessage ="Bạn chưa nhập số lượng sản phẩm!")]
        public int SoLuong { get; set; }
        public string DonViTinh { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập đơn giá sản phẩm!")]
        public decimal DonGia { get; set; }
        public int MaDanhMuc { get; set; }
        public int MaNCC { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblBinhLuan> tblBinhLuans { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblChiTietDonHang> tblChiTietDonHangs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblChiTietPhieuNhap> tblChiTietPhieuNhaps { get; set; }
        public virtual tblDanhMucSP tblDanhMucSP { get; set; }
        public virtual tblNhaCungCap tblNhaCungCap { get; set; }
    }
}
