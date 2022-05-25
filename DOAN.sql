CREATE DATABASE QuanLyBanHang
GO

USE QuanLyBanHang
GO

CREATE TABLE tblQuyen
(
	MaQuyen INT IDENTITY PRIMARY KEY NOT NULL,
	TenQuyen NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE tblLoaiTrangThai
(
	MaLTT INT IDENTITY PRIMARY KEY NOT NULL,
	TenLTT NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE tblTrangThai
(
	MaTrangThai INT IDENTITY PRIMARY KEY NOT NULL,
	TenTrangThai NVARCHAR(50) NOT NULL,
	MaLTT INT NOT NULL
)
GO

ALTER TABLE tblTrangThai ADD CONSTRAINT FK_TrangThai_LTT FOREIGN KEY (MaLTT) REFERENCES tblLoaiTrangThai(MaLTT)

CREATE TABLE tblNguoiDung
(
	MaNguoiDung INT IDENTITY PRIMARY KEY NOT NULL,
	TenNguoiDung NVARCHAR(50) NOT NULL,
	NamSinh INT,
	GioiTinh NVARCHAR(10),
	DiaChi NVARCHAR(255),
	SDT VARCHAR(10) NOT NULL,
	MaQuyen INT NOT NULL,
	MaTrangThai INT NOT NULL
)
GO

ALTER TABLE tblNguoiDung ADD CONSTRAINT FK_NguoiDung_Quyen FOREIGN KEY (MaQuyen) REFERENCES tblQuyen(MaQuyen),
						 CONSTRAINT FK_NguoiDung_TrangThai FOREIGN KEY (MaTrangThai) REFERENCES tblTrangThai(MaTrangThai)


CREATE TABLE tblDanhMucSP
(
	MaDanhMuc INT IDENTITY PRIMARY KEY NOT NULL,
	TenDanhMuc NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE tblNhaCungCap
(
	MaNCC INT IDENTITY PRIMARY KEY NOT NULL,
	TenNCC NVARCHAR(100) NOT NULL,
	DiaChi NVARCHAR(255) NOT NULL,
	SDT VARCHAR(10) NOT NULL
)
GO

CREATE TABLE tblSanPham
(
	MaSanPham INT IDENTITY PRIMARY KEY NOT NULL,
	TenSanPham NVARCHAR(100) NOT NULL,
	HinhAnh VARCHAR(255) NOT NULL,
	MoTa NVARCHAR(255) NOT NULL,
	SoLuong INT NOT NULL,
	DonViTinh NVARCHAR(10) NOT NULL,
	DonGia INT NOT NULL,
	MaDanhMuc INT NOT NULL,
	MaNCC INT NOT NULL
)
GO

ALTER TABLE tblSanPham ADD CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY (MaDanhMuc) REFERENCES tblDanhMucSP(MaDanhMuc),
						 CONSTRAINT FK_SanPham_NCC FOREIGN KEY (MaNCC) REFERENCES tblNhaCungCap(MaNCC)

CREATE TABLE tblDonHang
(
	MaDonHang INT IDENTITY PRIMARY KEY NOT NULL,
	TenNguoiNhan NVARCHAR(50) NOT NULL,
	DiaChiGiaoHang NVARCHAR(255) NOT NULL,
	SDT VARCHAR(10) NOT NULL,
	NgayDatHang DATETIME NOT NULL,
	MaNguoiDung INT,
	MaTrangThai INT
)
GO

ALTER TABLE tblDonHang ADD CONSTRAINT FK_DonHang_NguoiDung FOREIGN KEY (MaNguoiDung) REFERENCES tblNguoiDung(MaNguoiDung),
						 CONSTRAINT FK_DonHang_TrangThai FOREIGN KEY (MaTrangThai) REFERENCES tblTrangThai(MaTrangThai)

CREATE TABLE tblChiTietDonHang
(
	MaDonHang INT NOT NULL,
	MaSanPham INT NOT NULL,
	SoLuong INT NOT NULL, 
	DonGia INT NOT NULL
)
GO

ALTER TABLE tblChiTietDonHang ADD CONSTRAINT FK_CTDH_DonHang FOREIGN KEY (MaDonHang) REFERENCES tblDonHang(MaDonHang),
						 CONSTRAINT FK_CTDH_SanPham FOREIGN KEY (MaSanPham) REFERENCES tblSanPham(MaSanPham)

ALTER TABLE tblChiTietDonHang ADD PRIMARY KEY (MaDonHang,MaSanPham)

CREATE TABLE tblPhieuNhap
(
	MaPhieuNhap INT IDENTITY PRIMARY KEY NOT NULL,
	NgayNhap DATETIME NOT NULL,
	GhiChu NVARCHAR(255),
	MaNCC INT NOT NULL,
	MaNguoiDung INT NOT NULL,
	MaTrangThai INT NOT NULL
)
GO

ALTER TABLE tblPhieuNhap ADD CONSTRAINT FK_PhieuNhap_NCC FOREIGN KEY (MaNCC) REFERENCES tblNhaCungCap(MaNCC),
						 CONSTRAINT FK_PhieuNhap_NguoiDung FOREIGN KEY (MaNguoiDung) REFERENCES tblNguoiDung(MaNguoiDung),
						 CONSTRAINT FK_PhieuNhap_TrangThai FOREIGN KEY (MaTrangThai) REFERENCES tblTrangThai(MaTrangThai)


CREATE TABLE tblChiTietPhieuNhap
(
	MaPhieuNhap INT NOT NULL,
	MaSanPham INT NOT NULL,
	SoLuong INT NOT NULL,
	GiaNhap INT
)
GO

ALTER TABLE tblChiTietPhieuNhap ADD CONSTRAINT FK_CTPN_PhieuNhap FOREIGN KEY (MaPhieuNhap) REFERENCES tblPhieuNhap(MaPhieuNhap),
						 CONSTRAINT FK_CTPN_SanPham FOREIGN KEY (MaSanPham) REFERENCES tblSanPham(MaSanPham)

ALTER TABLE tblChiTietPhieuNhap ADD PRIMARY KEY (MaPhieuNhap,MaSanPham)


CREATE TABLE tblBinhLuan
(
	MaBinhLuan INT IDENTITY PRIMARY KEY NOT NULL,
	NoiDungBL NVARCHAR(255) NOT NULL,
	ThoiGianBL DATETIME NOT NULL,
	MaNguoiDung INT NOT NULL,
	MaSanPham INT NOT NULL
)
GO

ALTER TABLE tblBinhLuan ADD CONSTRAINT FK_BinhLuan_NguoiDung FOREIGN KEY (MaNguoiDung) REFERENCES tblNguoiDung(MaNguoiDung),
						 CONSTRAINT FK_BinhLuan_SanPham FOREIGN KEY (MaSanPham) REFERENCES tblSanPham(MaSanPham)

DELETE FROM tblNguoiDung
WHERE MaNguoiDung = 16;

DELETE FROM tblBinhLuan
WHERE MaBinhLuan = 2;

DELETE FROM tblPhieuNhap
WHERE MaPhieuNhap = 156;
DELETE FROM tblChiTietPhieuNhap
WHERE MaPhieuNhap = 156;

DELETE FROM tblDonHang
WHERE MaDonHang = 2068;

DELETE FROM tblChiTietDonHang
WHERE MaDonHang = 2068;

SELECT tblDonHang.MaDonHang, tblSanPham.TenSanPham, tblChiTietDonHang.SoLuong, tblChiTietDonHang.DonGia
FROM tblDonHang INNER JOIN tblNguoiDung ON tblDonHang.MaNguoiDung = tblNguoiDung.MaNguoiDung
INNER JOIN tblChiTietDonHang ON tblDonHang.MaDonHang = tblChiTietDonHang.MaDonHang
INNER JOIN tblSanPham ON tblChiTietDonHang.MaSanPham = tblSanPham.MaSanPham