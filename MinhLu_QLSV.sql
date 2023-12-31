CREATE DATABASE QL_SV
USE QL_SV
--tao bang chuong trinh dao tao
CREATE TABLE CT_DaoTao
(
	MaCTDT varchar(10) not null, 
	TenCTDT nvarchar(50)
)
--tao bang khoa hoc
CREATE TABLE KhoaHoc
(
	MaKH varchar(10) not null, 
	MaCTDT varchar(10) not null, 
	TenKH nvarchar(50)
)
--tao bang lop
CREATE TABLE Lop
(
	MaLop varchar(10) not null,
	MaKH varchar(10) not null, 
	TenLop nvarchar(20) not null
)
--tao bang mon hoc
CREATE TABLE MonHoc
(
	MaMH varchar(10) not null, 
	TenMH nvarchar(50)not null
)
--tao bang sinh vien
CREATE TABLE SinhVien
(
	MaSV varchar(10) not null, 
	HoTen nvarchar(50) not null, 
	GioiTinh nvarchar(10), 
	NgaySinh datetime, 
	NoiSinh nvarchar(30), 
	MaLop varchar(10) not null
)
--tao bang ket qua thi
CREATE TABLE KetQuaThi
(
	MaSV varchar(10) not null, 
	MaMH varchar(10) not null, 
	LanThi int not null, 
	DiemThi float
)
--XEM CAC BANG DU LIEU
SELECT *
FROM CT_DaoTao
SELECT *
FROM KhoaHoc
SELECT *
FROM Lop
SELECT *
FROM MonHoc
SELECT *
FROM SinhVien
SELECT *
FROM KetQuaThi
-- rang buoc khoa chinh
ALTER TABLE CT_DaoTao ADD CONSTRAINT PK_CTDAORAO PRIMARY KEY(MaCTDT)
ALTER TABLE KhoaHoc ADD CONSTRAINT PK_KHOAHOC PRIMARY KEY(MaKH)
ALTER TABLE Lop ADD CONSTRAINT PK_LOP PRIMARY KEY(MaLop)
ALTER TABLE MonHoc ADD CONSTRAINT PK_MONHOC PRIMARY KEY(MaMH)
ALTER TABLE SinhVien ADD CONSTRAINT PK_SinhVien PRIMARY KEY(MaSV)
ALTER TABLE KetQuaThi ADD CONSTRAINT PK_KETQUATHI PRIMARY KEY(MaSV,MaMH,LanThi)
-- ktra rang buoc khoa chinh
SP_PKEYS CT_DaoTao
SP_PKEYS KhoaHoc
SP_PKEYS Lop
SP_PKEYS MonHoc
SP_PKEYS SinhVien
SP_PKEYS KetQuaThi
-- rang buoc khoa ngoai
ALTER TABLE KhoaHoc ADD CONSTRAINT FK_KH_MaCTDT FOREIGN KEY(MaCTDT) REFERENCES CT_DaoTao(MaCTDT)
ALTER TABLE Lop ADD CONSTRAINT FK_Lop_MaKH FOREIGN KEY(MaKH) REFERENCES KhoaHoc(MaKH)
ALTER TABLE SinhVien ADD CONSTRAINT FK_SinhVien_MaLop FOREIGN KEY(MaLop) REFERENCES Lop(MaLop)
ALTER TABLE KetQuaThi ADD CONSTRAINT FK_KetQuaThi_MaSV FOREIGN KEY(MaSV) REFERENCES SinhVien(MaSV)
ALTER TABLE KetQuaThi ADD CONSTRAINT FK_KetQuaThi_MaMH FOREIGN KEY(MaMH) REFERENCES MonHoc(MaMH)
--them du lieu vao bang CT_TaoDao
INSERT INTO CT_DaoTao VALUES ('1',N'Cử Nhân')
INSERT INTO CT_DaoTao VALUES ('2',N'Cao Đẳng')
INSERT INTO CT_DaoTao VALUES ('3',N'Trung Cấp')
--XOA DU LIEU
DELETE FROM CT_DaoTao WHERE MaCTDT ='3'
--them du lieu vao bang MonHoc
INSERT INTO MonHoc VALUES ('TH101',N'Tin Hoc Đại Cương')
INSERT INTO MonHoc VALUES ('TH110',N'Toán Rời Rạc')
INSERT INTO MonHoc VALUES ('TH102',N'Cơ Sở Dữ Liệu')
--them du lieu vao bang khoa hoc
INSERT INTO KhoaHoc VALUES ('1','1',N'Khóa 1 năm 2005')
INSERT INTO KhoaHoc VALUES ('2','1',N'Khóa 2 năm 2006')
INSERT INTO KhoaHoc VALUES ('3','2',N'Khóa 1 năm 2007')
INSERT INTO KhoaHoc VALUES ('4','3',N'Khóa 1 năm 2008')
INSERT INTO KhoaHoc VALUES ('5','2',N'Khóa 2 năm 2008')
--them du lieu vao bang lop
INSERT INTO Lop VALUES ('1','1','K1_1')
INSERT INTO Lop VALUES ('2','1','K2_1')
INSERT INTO Lop VALUES ('3','1','K3_1')
INSERT INTO Lop VALUES ('4','2','K3_2')
--them du lieu vao bang sinh vien
INSERT INTO SinhVien VALUES ('K116',N'Đinh Nguyễn Vân Anh',N'Nữ','1985-12-18',N'Bình Thuận','1')
INSERT INTO SinhVien VALUES ('K117',N'Trần Hoàng Anh',N'Nữ','1986-08-04',N'Bình Dương','1')
INSERT INTO SinhVien VALUES ('K118',N'Bùi Thanh Bình',N'Nam','1985-10-23',N'Đồng Nai','1')
INSERT INTO SinhVien VALUES ('K119',N'Phạm Nhật Tân',N'Nam','1985-01-15',N'Đồng Tháp','2')
INSERT INTO SinhVien VALUES ('K120',N'Định Thiện Hòa',N'Nam','1985-12-08',N'Vĩnh Long','3')
INSERT INTO SinhVien VALUES ('K121',N'Nguyễn Anh Khoa',N'Nam','1985-11-14',N'Vũng Tàu','3')
INSERT INTO SinhVien VALUES ('K122',N'Trương Mộng Thúy',N'Nữ','1986-05-12',N'Cần Thơ','2')
INSERT INTO SinhVien VALUES ('K123',N'Võ Anh Thi',N'Nữ','1986-05-23',N'Bến Tre','2')
--them du lieu vao bang ket qua thi
INSERT INTO KetQuaThi VALUES ('K116','TH101','1','8')
INSERT INTO KetQuaThi VALUES ('K117','TH101','1','4')
INSERT INTO KetQuaThi VALUES ('K118','TH101','1','6.5')
INSERT INTO KetQuaThi VALUES ('K119','TH102','1','5')
INSERT INTO KetQuaThi VALUES ('K120','TH102','1','7')
INSERT INTO KetQuaThi VALUES ('K116','TH110','1','7')
INSERT INTO KetQuaThi VALUES ('K118','TH102','1','9')
INSERT INTO KetQuaThi VALUES ('K119','TH101','1','6')
INSERT INTO KetQuaThi VALUES ('K120','TH101','1','5')
INSERT INTO KetQuaThi VALUES ('K116','TH102','1','7.5')
INSERT INTO KetQuaThi VALUES ('K117','TH101','2','7')