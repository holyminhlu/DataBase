CREATE DATABASE QLDA
USE QLDA

CREATE TABLE NhanVien(
	MaNV varchar(10) not null,
	HoNV nvarchar(50),
	TenLot nvarchar(50),
	TenNv nvarchar(50),
	NgSinh date,
	Phai nvarchar(10),
	Dchi nvarchar(50),
	MaNQL varchar(10) not null,
	Phong varchar(10) not null,
	Luong float
	)
CREATE TABLE PhongBan(
	MaPB varchar(10) not null,
	TenPB nvarchar(50),
	TrPHG varchar(10) not null,
	DiaDiem nvarchar(50),
	NgayNhanChuc date
	)
	
CREATE TABLE DeAn(
	MaDA varchar(10) not null,
	TenDA nvarchar(50),
	DiaDiemDA nvarchar(50),
	Phong varchar(10) not null,
	NgayBD_DK date,
	NgayKT_DK date
	)
	
CREATE TABLE ThanNhan(
	MaNV varchar(10) not null,
	MaTN varchar(10) not null,
	TenTN nvarchar(50),
	Phai nvarchar(10),
	NgSinh date,
	QuanHe nvarchar(50)
	)

CREATE TABLE PhanCong(
	MaNV varchar(10) not null,
	MaDA varchar(10) not null,
	ThoiGian time
	)
--xem bang
SELECT*
FROM NhanVien
SELECT*
FROM PhongBan
SELECT*
FROM DeAn
SELECT*
FROM ThanNhan
SELECT*
FROM PhanCong

--RANG BUOC KHOA CHINH - KHOA PHU
ALTER TABLE NhanVien ADD CONSTRAINT PK_NHANVIEN PRIMARY KEY(MaNV)
ALTER TABLE PhongBan ADD CONSTRAINT PK_PHONGBAN PRIMARY KEY(MaPB)
ALTER TABLE DeAn ADD CONSTRAINT PK_DEAN PRIMARY KEY(MaDA)
ALTER TABLE ThanNhan ADD CONSTRAINT PK_THANNHAN PRIMARY KEY(MaNV,MaTN)
ALTER TABLE PhanCong ADD CONSTRAINT PK_PHANCONG PRIMARY KEY(MaNV,MaDA)
SP_PKEYS NhanVien
SP_PKEYS PhongBan
SP_PKEYS DeAn
SP_PKEYS ThanNhan
SP_PKEYS PhanCong
ALTER TABLE ThanNhan ADD CONSTRAINT FK_TN_MaNV FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV)
ALTER TABLE PhanCong ADD CONSTRAINT FK_PC_MaNV FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV)
ALTER TABLE PhanCong ADD CONSTRAINT FK_PC_MaDA FOREIGN KEY(MaDA) REFERENCES DeAn(MaDA)
--THEM DU LIEU VAO BANG
DELETE NhanVien
INSERT INTO NhanVien VALUES ('001',N'Vương',N'Ngọc',N'Quyền','1957-10-22',N'Nữ',N'Hà Nội','','QL','3000000')
INSERT INTO NhanVien VALUES ('002',N'Ngyễn',N'Thanh',N'Tùng','1955-01-09',N'Nam',N'TPHCM','001','NC','2500000')
INSERT INTO NhanVien VALUES ('003',N'Lê',N'Thị',N'Nhẫn','1960-12-18',N'Nữ',N'TPHCM','001','DH','2500000')
INSERT INTO NhanVien VALUES ('004',N'Đinh',N'Bá',N'Tiên','1968-01-09',N'Nam',N'Đồng Tháp','002','NC','2200000')
INSERT INTO NhanVien VALUES ('005',N'Bùi',N'Thúy',N'Vu','1973-06-08',N'Nữ',N'Trà Vinh','003','DH','2200000')
INSERT INTO NhanVien VALUES ('006',N'Nguyễn',N'Mạnh',N'Hùng','1981-08-30',N'Nam',N'Đồng Nai','002','NC','2000000')
INSERT INTO NhanVien VALUES ('007',N'Trần',N'Hồng',N'Vân','1976-08-02',N'Nữ',N'Vĩnh Long','004','NC','1800000')
