USE Quanlybanphukiendienthoai;
GO
ALTER DATABASE Quanlybanphukiendienthoai COLLATE Latin1_General_100_BIN2_UTF8;
Select * from Category
-- Tạo bảng Category với kiểu dữ liệu NVARCHAR
CREATE TABLE Category (
    cateID INT PRIMARY KEY,
    catename NVARCHAR(255)
);
select * from Account where (username = 'thinhnguyen123' 
				 or email = ''
				 or phone = '') 
				 and password = 123456789
-- Tạo bảng Product với kiểu dữ liệu NVARCHAR và FLOAT thay vì DOUBLE PRECISION
CREATE TABLE Product (
    id INT PRIMARY KEY,
    name NVARCHAR(255),
    image NVARCHAR(255),
    price FLOAT,
    title NVARCHAR(255),
    description NVARCHAR(MAX),
    color NVARCHAR(50),
    cateID INT,
    FOREIGN KEY (cateID) REFERENCES Category(cateID)
);
ALTER TABLE Account ADD phone NVARCHAR(255) UNIQUE
ALTER TABLE Account ADD email NVARCHAR(255) UNIQUE
ALTER TABLE Account ADD name NVARCHAR(255)
ALTER TABLE Product
DROP COLUMN id; -- Xóa cột cũ
ALTER TABLE Product
ADD id INT IDENTITY(1,1) PRIMARY KEY; -- Thêm lại cột với IDENTITY
ALTER TABLE Product ADD sellid INT;
ALTER TABLE Product ADD CONSTRAINT FK_Product_Account FOREIGN KEY (sellid) REFERENCES Account(id);

update Product set sellid = 3 where id = 8;
-- Tạo bảng Account
CREATE TABLE Account (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(255) unique,
    password NVARCHAR(255),
    issell INT CHECK (issell IN (0, 1)),
    isadmin INT CHECK (isadmin IN (0, 1))
);
--Chèn dữ liệu vào bảng Account
INSERT INTO Account (username,password,issell,isadmin,phone,email) VALUES ('thinhnguyen123','123456789',1,1,'123456789','thinh@gmail.com');
INSERT INTO Account (username,password,issell,isadmin,phone,email) VALUES ('phuocthang123','123456789',0,0,'987654321','thang@gmail.com');
INSERT INTO Account (username,password,issell,isadmin,phone,email) VALUES ('diemquynh123','123456789',1,0,'1111','quynh@gmail.com');
Update Account set name =  N'Nguyễn Hoàng Thịnh' where id = 6
Update Account set name =  N'Nguyễn Phước Thắng' where id = 2
Update Account set name =  N'Nguyễn Diễm Quỳnh' where id = 3

-- Chèn dữ liệu vào bảng Category
INSERT INTO Category (cateID, catename) VALUES (1, N'Tai Nghe');
INSERT INTO Category (cateID, catename) VALUES (2, N'Ốp Lưng');
INSERT INTO Category (cateID, catename) VALUES (3, N'Dây Sạc và Cóc sạc');
INSERT INTO Category (cateID, catename) VALUES (4, N'Sạc Dự Phòng');

-- Chèn dữ liệu vào bảng Product
INSERT INTO Product (id, name, image, price, title, description, color, cateID) VALUES 
(1, N'Tai nghe Apple AirPods 3 Chính Hãng', N'https://cdn.dienthoaigiakho.vn/photos/1634887067371-airpods3-img-min.jpg', 3900000, N'Tai nghe không dây', N'Kết nối bluetooth siêu nhanh, âm thanh sống động', N'While', 1),
(2, N'Tai Nghe HyberCloud Gaming', N'https://laptop88.vn/media/product/8731_72707_tai_nghe_gaming_co_day_hp_hyperx_cloud_iii_727a9aa_4.jpg', 1500000, N'Tai nghe', N'Tai nghe sang, xịn, mịn âm thanh chất lượng dành cho các tín đồ game thủ', N'Red', 1),
(3, N'Ốp Lưng Điện Thoại', N'https://product.hstatic.net/1000390254/product/upload_ccd38762500e4fc6835a4c0080831c51_master.jpg', 100000, N'Ốp Lưng', N'Ốp Lưng điện thoại siêu xinh giá rẻ', N'Blue', 2),
(4, N'Ốp Lưng Kính Điện Thoại', N'https://product.hstatic.net/1000390254/product/upload_960aed442174430ca0b8f0bb44f50de1_master.jpg', 200000, N'Ốp Lưng', N'Siêu bền, giúp điện thoại bị rơi không hư hại', N'Blue', 2),
(5, N'Dây sạc Lighning', N'https://lagihitech.vn/wp-content/uploads/2024/04/cap-HyperDrive-Thunderbolt-4-2m-8K-40Gbps-100W-HDTB4AC2G-hinh-1.jpg', 200000, N'Dây Sạc Iphone', N'Dây dài sạc nhanh', N'Blue', 3),
(6, N'Cóc sạc Iphone', N'https://minhtuanmobile.com/uploads/products/coc-sac-nhanh-apple-20w-type-c-mhje3za-chinh-hang-220802040547.jpg', 200000, N'Cóc sạc Iphone', N'Sạc siêu nhanh siêu bền', N'Blue', 3),
(7, N'Sạc dự Phòng Anker', N'https://lagihitech.vn/wp-content/uploads/2024/05/pin-sac-du-phong-Anker-Prime-A1336-20000mAh-hinh-5-Copy.jpg', 800000, N'Sạc dự phòng', N'Sạc dự phòng lượng pin lên đến 20kamp', N'Blue', 4),
(8, N'Sạc dự Phòng Xiaomi', N'https://topstore.vn/uploads/pin-sac-du-phong-eloop-e29-gia-re-700x700_1571461275.jpg', 200000, N'Sạc dự phòng', N'Sạc dự phòng lượng pin lên đến 20kamp', N'Blue', 4);

select * from Account where username = 'thinhnguyn123' or email = 'thinh@gmail.cm' or phone = '123456789' and password = '123456789'
DELETE FROM account WHERE id = 16;
select * from Product where sellid = 1

--Xóa và Tạo lại Product
SELECT * from Product_Temp
DROP TABLE Product;
CREATE TABLE Product (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255),
    image NVARCHAR(255),
    price FLOAT,
    title NVARCHAR(255),
    description NVARCHAR(MAX),
    color NVARCHAR(50),
    cateID INT,
    sellid INT,
    FOREIGN KEY (cateID) REFERENCES Category(cateID),
    FOREIGN KEY (sellid) REFERENCES Account(id)
);
SET IDENTITY_INSERT Product ON;

INSERT INTO Product (id, name, image, price, title, description, color, cateID, sellid)
SELECT id, name, image, price, title, description, color, cateID, sellid
FROM Product_Temp;

SET IDENTITY_INSERT Product OFF;

DROP TABLE Product_Temp;

update product set name = 'Tai Nghe',image='https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-10.png',
price=10000,title='abc',description='abc',cateID=1 where id=21

SELECT * FROM Product where sellid = 1 ORDER BY ID OFFSET 4 ROWS FETCH NEXT 8 ROWS ONLY

--Tạo Giỏ Hàng
Create table Cart{

}
--Danh Sách Sản Phẩm trong giỏ hàng
CREATE TABLE Cart (
    id INT PRIMARY KEY IDENTITY(1,1),
    uid INT,
    FOREIGN KEY (uid) REFERENCES Account(id)
);
CREATE TABLE CartItem (
    id INT PRIMARY KEY IDENTITY(1,1),
    cartid INT,
    productid INT,
    quantity INT,
    price Int,  
    FOREIGN KEY (cartid) REFERENCES Cart(id),
    FOREIGN KEY (productid) REFERENCES Product(id)
);

INSERT INTO Cart (uid) VALUES (1)

INSERT INTO CartItem (cartid,productid,quantity,price) VALUES (1,1,10,40000)

