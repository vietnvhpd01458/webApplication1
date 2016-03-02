-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-02-29 06:37:25.891




-- tables
-- Table: Hóa Đơn
CREATE TABLE Hóa Đơn (
    MaHD char(10)  NOT NULL,
    MaKH char(10)  NOT NULL,
    Ngaylap datetime  NOT NULL,
    trigia char(200)  NOT NULL,
    Manhanvien char(10)  NOT NULL,
    khách Hàng_MaKH char(10)  NOT NULL,
    CONSTRAINT Hóa Đơn_pk PRIMARY KEY  (MaHD)
)
;





-- Table: Loại sản phẩm
CREATE TABLE Loại sản phẩm (
    MaLSP char(10)  NOT NULL,
    tenLSP char(10)  NOT NULL,
    NgaySX datetime  NOT NULL,
    Dongia char(10)  NOT NULL,
      baohanh char(2)  NOT NULL,
    CONSTRAINT Loại sản phẩm_pk PRIMARY KEY  (MaLSP)
)
;





-- Table: Sản Phẩm
CREATE TABLE Sản Phẩm (
    MaSP char(10)  NOT NULL,
    TenSP nvarchar(200)  NOT NULL,
    soluong char(10)  NOT NULL,
    mota varchar(200)  NOT NULL,
    MaLSP char(10)  NOT NULL,
    Loại sản phẩm_MaLSP char(10)  NOT NULL,
    CONSTRAINT Sản Phẩm_pk PRIMARY KEY  (MaSP)
)
;





-- Table: chi tiết hóa đơn
CREATE TABLE chi tiết hóa đơn (
    MaSP char(10)  NOT NULL,
    MaHD char(10)  NOT NULL,
    soluongmua char(10)  NOT NULL,
    dongiaban money  NOT NULL,
    tenSP char(200)  NOT NULL,
    Hóa Đơn_MaHD char(10)  NOT NULL,
    Sản Phẩm_MaSP char(10)  NOT NULL,
    CONSTRAINT chi tiết hóa đơn_pk PRIMARY KEY  (MaSP)
)
;





-- Table: khách Hàng
CREATE TABLE khách Hàng (
    MaKH char(10)  NOT NULL,
    tenKH nvarchar(200)  NOT NULL,
    ĐiaChi nvarchar(200)  NOT NULL,
    SoDT char(10)  NOT NULL,
    ngaysinh date  NOT NULL,
    CONSTRAINT khách Hàng_pk PRIMARY KEY  (MaKH)
)
;









-- foreign keys
-- Reference:  Hóa Đơn_khách Hàng (table: Hóa Đơn)

ALTER TABLE Hóa Đơn ADD CONSTRAINT Hóa Đơn_khách Hàng 
    FOREIGN KEY (khách Hàng_MaKH)
    REFERENCES khách Hàng (MaKH)
;

-- Reference:  Sản Phẩm_Loại sản phẩm (table: Sản Phẩm)

ALTER TABLE Sản Phẩm ADD CONSTRAINT Sản Phẩm_Loại sản phẩm 
    FOREIGN KEY (Loại sản phẩm_MaLSP)
    REFERENCES Loại sản phẩm (MaLSP)
;

-- Reference:  chi tiết hóa đơn_Hóa Đơn (table: chi tiết hóa đơn)

ALTER TABLE chi tiết hóa đơn ADD CONSTRAINT chi tiết hóa đơn_Hóa Đơn 
    FOREIGN KEY (Hóa Đơn_MaHD)
    REFERENCES Hóa Đơn (MaHD)
;

-- Reference:  chi tiết hóa đơn_Sản Phẩm (table: chi tiết hóa đơn)

ALTER TABLE chi tiết hóa đơn ADD CONSTRAINT chi tiết hóa đơn_Sản Phẩm 
    FOREIGN KEY (Sản Phẩm_MaSP)
    REFERENCES Sản Phẩm (MaSP)
;





-- End of file.

