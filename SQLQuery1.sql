﻿use [QLSINHVIEN];
go
--Bài 1
--1,
SELECT MaMH, TenMH, Sotiet FROM [dbo].[MonHoc]
--2,
SELECT MaSV, HoSV, TenSV, HocBong FROM [dbo].[SinhVien]
ORDER BY MaSV ASC
--3,
SELECT MaSV, TenSV, Phai, NgaySinh FROM [dbo].[SinhVien]
ORDER BY TenSV ASC
--4,
SELECT HoSV + ' ' +TenSV as 'HoTenSinhVien',NgaySinh,HocBong FROM [dbo].[SinhVien]
ORDER BY NgaySinh ASC , HocBong DESC
--5,
SELECT MaMH, TenMH, Sotiet FROM [dbo].[MonHoc]
WHERE TenMH like N'T%'
--6,
SELECT HoSV + ' ' +TenSV as 'HoTenSinhVien',NgaySinh,Phai FROM [dbo].[SinhVien]
WHERE TenSV like N'%i'
--7,
SELECT MaKH, TenKH FROM Khoa
WHERE TenKH like N'_N%'
--8,
SELECT * FROM [dbo].[SinhVien]
WHERE HoSV like N'%Thị'
--9,
SELECT MaSV ,HoSV + ' ' +TenSV as 'HoTen',Phai,HocBong FROM [dbo].[SinhVien]
WHERE TenSV like N'[a-m]%'
SELECT * FROM [dbo].[SinhVien] WHERE LEFT(TenSV,1) BETWEEN 'a' AND 'm'
--10,
SELECT HoSV + ' ' +TenSV as 'HoTenSinhVien',NgaySinh,NoiSinh,HocBong FROM [dbo].[SinhVien]
WHERE TenSV like N'[a-m]%'
ORDER BY HoTenSinhVien ASC
--11,
SELECT MaSV,HoSV + ' ' +TenSV as 'HoTenSinhVien',NgaySinh,MaKH FROM [dbo].[SinhVien]
WHERE MaKH = 'AV'
--,Cách hay 
SELECT MaSV,HoSV + ' ' +TenSV as 'HoTenSinhVien',NgaySinh,MaKH FROM [dbo].[SinhVien]
WHERE MaKH IN (SELECT MaKH from [dbo].[Khoa] WHERE TenKH = N'Anh Văn')
--12,
SELECT MaSV,HoSV + ' ' +TenSV as 'HoTenSinhVien',NgaySinh FROM [dbo].[SinhVien]
WHERE MaKH = 'VL'
ORDER BY NgaySinh DESC
--13,
SELECT MaSV,HoSV + ' ' +TenSV as 'HoTenSinhVien',MaKH,HocBong FROM [dbo].[SinhVien]
WHERE HocBong > 500000
ORDER BY MaKH DESC
--14,
SELECT MaSV,HoSV + ' ' +TenSV as 'HoTenSinhVien',MaKH,HocBong FROM [dbo].[SinhVien]
WHERE NgaySinh = '19771220'
--15,
SELECT MaSV,HoSV + ' ' +TenSV as 'HoTenSinhVien',NgaySinh,NoiSinh,HocBong FROM [dbo].[SinhVien]
WHERE NgaySinh > '19771220'
ORDER BY NgaySinh DESC
SELECT * FROM SinhVien
--16,
SELECT HoSV + ' ' +TenSV as 'HoTenSinhVien',MaKH,NoiSinh,HocBong FROM [dbo].[SinhVien]
WHERE NoiSinh = 'Tp. HCM' AND HocBong > 100000
--17,
SELECT MaSV,MaKH,Phai FROM [dbo].[SinhVien]
WHERE MaKH = 'AV' OR MaKH = 'TR'
--18,
SELECT MaSV,NgaySinh,NoiSinh,HocBong FROM [dbo].[SinhVien]
WHERE NgaySinh > '19860101' AND NgaySinh < '19920605'
--19,
SELECT MaSV, NgaySinh, Phai, MaKH
FROM SinhVien
WHERE HocBong BETWEEN 200000 AND 800000;
--20,
SELECT MaMH, TenMH, Sotiet
FROM MonHoc
WHERE Sotiet > 40 AND Sotiet < 60;
--21,
SELECT SinhVien.MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai
FROM SinhVien
JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE Khoa.TenKH = N'Anh Văn' AND Phai = '0';
-- or
SELECT SinhVien.MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai
FROM SinhVien
WHERE MaKH = 'AV' AND Phai = '0'
--22,
SELECT HoSV, TenSV, NoiSinh, NgaySinh
FROM SinhVien
WHERE NoiSinh = N'Hà Nội' AND NgaySinh > '1990-01-01';
--23,
SELECT MaSV, HoSV, TenSV
FROM SinhVien
WHERE Phai = '1' AND TenSV LIKE '%N%';
--24,
SELECT SinhVien.MaSV, HoSV, TenSV, NgaySinh
FROM SinhVien
JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE TenKH = N'Tin Học' AND Phai = '0' AND NgaySinh > '1986-05-30';
--25,
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, 
       CASE WHEN Phai = '0' THEN N'Nam' ELSE N'Nữ' END AS GioiTinh, 
       NgaySinh
FROM SinhVien;
--cách 2
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, 
       IIF(Phai=0,N'Nam',N'Nữ') AS GioiTinh, 
       NgaySinh
FROM SinhVien;
--26,
SELECT MaSV, YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi,NoiSinh,MaKH
FROM SinhVien;
--Cách 2
--27,
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, 
       YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, 
       HocBong
FROM SinhVien
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) > 20;
--28,
SELECT CONCAT(SinhVien.HoSV, ' ', SinhVien.TenSV) AS HoTen, 
       YEAR(GETDATE()) - YEAR(SinhVien.NgaySinh) AS Tuoi, 
       Khoa.TenKH
FROM SinhVien
JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE YEAR(GETDATE()) - YEAR(SinhVien.NgaySinh) BETWEEN 20 AND 30;
--Bài 2 
--1,
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, 
       CASE WHEN Phai = '0' THEN N'Nam' ELSE N'Nữ' END AS GioiTinh,YEAR(GETDATE()) - YEAR(SinhVien.NgaySinh) AS Tuoi,MaKH
FROM SinhVien
ORDER BY Tuoi DESC
--2,
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen,Phai,DAY(NgaySinh) as ngaysinh FROM [dbo].[SinhVien]
WHERE MONTH(NgaySinh) = 2 AND YEAR(NgaySinh) = 1994
--3,
SELECT * FROM [dbo].[SinhVien]
ORDER BY DAY(NgaySinh) DESC
--4,
SELECT MaSV,Phai, MaKH,CASE WHEN HocBong > 500000 THEN N'Học bổng cao' ELSE N'Mức trung bình' END AS hocBong
FROM [dbo].[SinhVien]
--5,
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen , KQ.Diem ,MH.TenMH FROM [dbo].[SinhVien] AS SV
JOIN Ketqua AS KQ ON SV.MaSV = KQ.MaSV
JOIN MonHoc AS MH ON KQ.MaMH = MH.MaMH
--6,
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, 
       CASE WHEN SV.Phai = '0' THEN N'Nam' ELSE N'Nữ' END AS GioiTinh,k.TenKH
FROM SinhVien AS  SV
JOIN Khoa AS k ON SV.MaKH = k.MaKH
WHERE k.TenKH = N'Anh Văn'
--7,
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, 
       CASE WHEN SV.Phai = '0' THEN N'Nam' ELSE N'Nữ' END AS GioiTinh,k.TenKH,MH.TenMH,MH.Sotiet,KQ.Diem
FROM SinhVien AS  SV
JOIN Khoa AS k ON SV.MaKH = k.MaKH
JOIN Ketqua AS KQ ON SV.MaSV = KQ.MaSV
JOIN MonHoc AS MH ON KQ.MaMH = MH.MaMH
WHERE k.TenKH = N'Tin Học'
--8,
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, 
       CASE WHEN SV.Phai = '0' THEN N'Nam' ELSE N'Nữ' END AS GioiTinh,SV.MaKH,MH.TenMH,KQ.Diem,CASE WHEN KQ.Diem > 8 THEN N'Giỏi' 
																								   WHEN KQ.Diem < 8 AND  KQ.Diem > 6 THEN N'Khá'
																								   ELSE N'Trung Bình' END AS Loai
FROM SinhVien AS  SV
JOIN Khoa AS k ON SV.MaKH = k.MaKH
JOIN Ketqua AS KQ ON SV.MaSV = KQ.MaSV
JOIN MonHoc AS MH ON KQ.MaMH = MH.MaMH
--,Bài 3
--1,
SELECT mh.MaMH, mh.TenMH , AVG(kq.Diem) as DiemTrungBinh FROM [dbo].[MonHoc] as mh
JOIN Ketqua AS kq ON mh.MaMH = kq.MaMH
GROUP BY mh.MaMH, mh.TenMH;
--2,
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen,k.TenKH,COUNT(MH.TenMH) as N'Tong so mon thi'
FROM SinhVien AS  SV
JOIN Khoa AS k ON SV.MaKH = k.MaKH
JOIN Ketqua AS KQ ON SV.MaSV = KQ.MaSV
JOIN MonHoc AS MH ON KQ.MaMH = MH.MaMH
GROUP BY CONCAT(SV.HoSV, ' ', SV.TenSV) , k.TenKH
--3,
SELECT SV.TenSV,k.TenKH, SV.Phai,sum(KQ.Diem) as N'Tổng điểm thi' FROM [dbo].[SinhVien] AS SV
JOIN Khoa AS k ON SV.MaKH = k.MaKH
JOIN Ketqua AS KQ ON SV.MaSV = KQ.MaSV
GROUP BY SV.TenSV,k.TenKH,SV.Phai
--4,
SELECT K.TenKH , COUNT(SV.MaSV) AS N'Tổng số sinh viên' FROM [dbo].[Khoa] AS K
JOIN SinhVien AS SV ON K.MaKH = SV.MaKH
GROUP BY K.TenKH
--5,
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen ,MAX(KQ.Diem) AS N'Điểm cao nhất'
FROM SinhVien AS  SV
JOIN Ketqua AS KQ ON SV.MaSV = KQ.MaSV
GROUP BY CONCAT(SV.HoSV, ' ', SV.TenSV) 
--6,
SELECT TOP 1 WITH TIES TenMH, (Sotiet) FROM [dbo].[MonHoc]
ORDER BY Sotiet DESC
--7,
SELECT k.MaKH,k.TenKH,max(SV.HocBong) as N'Học bổng cao nhất' FROM [dbo].[Khoa] AS K
JOIN SinhVien AS SV ON K.MaKH = SV.MaKH
GROUP BY K.TenKH , k.MaKH
--8,
SELECT mh.TenMH , max(KQ.Diem) FROM [dbo].[MonHoc] as mh
JOIN Ketqua AS KQ ON mh.MaMH = KQ.MaMH
GROUP BY mh.TenMH
--9,
SELECT mh.TenMH , COUNT(mh.TenMH) as N'Số sinh viên đang học' FROM [dbo].[MonHoc] as mh
JOIN Ketqua AS KQ ON mh.MaMH = KQ.MaMH
JOIN SinhVien AS SV ON KQ.MaSV = SV.MaSV
GROUP BY mh.TenMH
--10,
SELECT TOP 1 WITH TIES mh.TenMH ,mh.Sotiet,SV.TenSV,KQ.Diem FROM [dbo].[MonHoc] as mh
JOIN Ketqua AS KQ ON mh.MaMH = KQ.MaMH
JOIN SinhVien AS SV ON KQ.MaSV = SV.MaSV
ORDER BY KQ.Diem DESC
--11,
SELECT TOP 1 WITH TIES k.MaKH,k.TenKH,COUNT(SV.MaSV) as N'Số lượng sinh viên của khoa' FROM [dbo].[Khoa] AS K
JOIN SinhVien AS SV ON K.MaKH = SV.MaKH
GROUP BY K.TenKH , k.MaKH
ORDER BY COUNT(SV.MaSV) DESC
--12,
SELECT TOP 1 WITH TIES k.TenKH , CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen , (SV.HocBong) FROM [dbo].[Khoa] AS K
JOIN SinhVien AS SV ON K.MaKH = SV.MaKH
ORDER BY SV.HocBong DESC

--Bài 4
--1,
DECLARE @MaKH nvarchar(2)
SET @MaKH = 'AV'
SELECT MaSV,CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen,IIF(Phai=1,N'Nam',N'Nữ') as GioiTinh FROM  [dbo].[SinhVien] AS SV
JOIN Khoa AS K ON SV.MaKH = K.MaKH
WHERE K.MaKH = @MaKH
--2,
DECLARE @MSV nvarchar(10),@name nvarchar(50),@subject nvarchar(50),@mark float
SET @MSV = 'MS1'
SET @name = 'HEHE'
SET @subject = 'MATH'
SET @mark = 3
SELECT mh.TenMH , SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen , KQ.Diem from [dbo].[MonHoc] as mh
JOIN Ketqua AS KQ ON mh.MaMH = KQ.MaMH
Join [dbo].[SinhVien] AS SV  ON SV.MaSV = KQ.MaSV
WHERE mh.TenMH = N'Cơ sở dữ liệu' AND KQ.Diem = @mark
--3,
DECLARE @TenMH NVARCHAR(50) = N'Cơ sở dữ liệu'
SELECT SinhVien.MaSV, Khoa.TenKH, MonHoc.TenMH, KetQua.Diem
FROM SinhVien
JOIN KetQua ON SinhVien.MaSV = KetQua.MaSV
JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH
JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE MonHoc.TenMH = @TenMH;

--Bài 5 Truy vấn con
--1, Danh sách sinh viên chưa thi môn nào , thông tin gồm : mã sinh viên , mã khoa , phái
SELECT MaSV , MaKH , Phai FROM SinhVien
WHERE MaSV NOT IN (SELECT MaSV from Ketqua)
--NOT IN LÀ KHÔNG THUỘC
--2, Danh sách sinh viên chưa thi môn csdl  gồm các thông tin msv , họ tên và mã khoa
SELECT MaSV , MaKH , Phai FROM SinhVien
WHERE MaSV NOT IN (SELECT MaSV from Ketqua WHERE MaMH IN (SELECT MaMH FROM MonHoc WHERE TenMH = N'Cơ sở dữ liệu'))
--Cách 2
SELECT MaSV , MaKH , Phai FROM SinhVien 
WHERE MaSV NOT IN (SELECT MaSV FROM Ketqua AS KQ JOIN MonHoc AS MH  ON KQ.MaMH = MH.MaMH WHERE MH.TenMH=N'Cơ sở dữ liệu')
--
--3,Cho biết môn nào chưa có sinh viên thi gồm các thông tin về mã môn , tên môn , số tiết
SELECT MonHoc.MaMH, MonHoc.TenMH, MonHoc.Sotiet
FROM MonHoc
WHERE MaMH NOT IN (SELECT DISTINCT MaMH FROM KetQua);
--4,
SELECT Khoa.MaKH, Khoa.TenKH
FROM Khoa
WHERE MaKH NOT IN (SELECT DISTINCT MaKH FROM SinhVien);
--5,
SELECT SinhVien.MaSV, SinhVien.HoSV + ' ' + SinhVien.TenSV AS HoTen, SinhVien.MaKH
FROM SinhVien
WHERE MaKH = 'AV' 
    AND MaSV NOT IN (
        SELECT MaSV 
        FROM KetQua 
        JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH 
        WHERE MonHoc.TenMH = N'Cơ sở dữ liệu'
    );
--6,
SELECT MonHoc.MaMH, MonHoc.TenMH, MonHoc.Sotiet
FROM MonHoc
WHERE MaMH NOT IN (
    SELECT MaMH 
    FROM KetQua 
    JOIN SinhVien ON KetQua.MaSV = SinhVien.MaSV
    WHERE SinhVien.MaKH = 'LY'  
);
--7,
SELECT SinhVien.MaSV, SinhVien.HoSV + ' ' + SinhVien.TenSV AS HoTen, KetQua.Diem
FROM SinhVien
JOIN KetQua ON SinhVien.MaSV = KetQua.MaSV
JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH
WHERE MonHoc.TenMH = N'Đồ họa'
    AND KetQua.Diem < (
        SELECT MIN(Diem)
        FROM KetQua
        JOIN SinhVien ON KetQua.MaSV = SinhVien.MaSV
        JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH
        WHERE MonHoc.TenMH = N'Đồ họa' AND SinhVien.MaKH = 'TH' 
    );
--8,
SELECT MaSV, HoSV + ' ' + TenSV AS HoTen, NgaySinh
FROM SinhVien
WHERE NgaySinh > (
    SELECT MIN(NgaySinh)
    FROM SinhVien
    WHERE MaKH = 'AV'  
);
--9,
SELECT MaSV, HoSV + ' ' + TenSV AS HoTen, HocBong
FROM SinhVien
WHERE HocBong > (
    SELECT SUM(HocBong)
    FROM SinhVien
    WHERE MaKH = 'TR'  
);
--10,
SELECT MaSV, HoSV + ' ' + TenSV AS HoTen, NoiSinh
FROM SinhVien
WHERE NoiSinh = (
    SELECT TOP 1 NoiSinh
    FROM SinhVien
    WHERE MaKH = 'LY'  
    ORDER BY HocBong DESC
);

--11,
SELECT KetQua.MaSV, SinhVien.HoSV + ' ' + SinhVien.TenSV AS HoTen, MonHoc.TenMH, KetQua.Diem
FROM KetQua
JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH
JOIN SinhVien ON KetQua.MaSV = SinhVien.MaSV
WHERE KetQua.Diem = (
    SELECT MAX(Diem)
    FROM KetQua AS KQ2
    WHERE KQ2.MaMH = KetQua.MaMH
);
--12,
SELECT SinhVien.MaSV, Khoa.TenKH, SinhVien.HocBong
FROM SinhVien
JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE HocBong = (
    SELECT MAX(HocBong)
    FROM SinhVien AS SV2
    WHERE SV2.MaKH = SinhVien.MaKH
);
--Bài 6
--1,
INSERT INTO SinhVien (MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong)
VALUES ('C01', N'Lê Thành', N'Nguyên', N'Nam', '1980-10-20', N'Thành phố Hồ Chí Minh', 'TH', 850000);
--2,
INSERT INTO MonHoc (MaMH, TenMH, Sotiet)
VALUES ('06', 'Xử lý ảnh', 45);
--3,
INSERT INTO Khoa (MaKH, TenKH)
VALUES ('CT', 'Công trình');
--4,
INSERT INTO SinhVien (MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong)
VALUES ('C02', N'Nguyễn Trần', N'Quân', N'Nam', GETDATE(), N'Huế', 'CT', 950000);
--5,
INSERT INTO KetQua (MaSV, MaMH, Diem)
SELECT MaSV, '06', 7
FROM SinhVien
WHERE MaKH = 'TH';  
--6,
INSERT INTO KetQua (MaSV, MaMH, Diem)
SELECT 'C02', MaMH, 8
FROM MonHoc;
--Bài 7
--1,
CREATE TABLE DeleteTable (
    MaSV NVARCHAR(10),
    HoTen NVARCHAR(100),
    Phai NVARCHAR(10),
    NgaySinh DATE,
    NoiSinh NVARCHAR(100),
    TenKH NVARCHAR(100),
    HocBong DECIMAL(18, 2)
);

-- 
INSERT INTO DeleteTable (MaSV, HoTen, Phai, NgaySinh, NoiSinh, TenKH, HocBong)
SELECT 
    SinhVien.MaSV, 
    SinhVien.HoSV + ' ' + SinhVien.TenSV AS HoTen, 
    SinhVien.Phai, 
    SinhVien.NgaySinh, 
    SinhVien.NoiSinh, 
    Khoa.TenKH, 
    SinhVien.HocBong
FROM 
    SinhVien
JOIN 
    Khoa ON SinhVien.MaKH = Khoa.MaKH;
--2,
DELETE FROM DeleteTable
WHERE HocBong IS NULL OR HocBong = 0;
--3,
DELETE FROM DeleteTable
WHERE NgaySinh = '1987-12-20';
--4,
DELETE FROM DeleteTable
WHERE NgaySinh < '1987-03-01';

--5,
DELETE FROM DeleteTable
WHERE Phai = 'Nam' AND TenKH = N'Tin học';  
--Bài 8
--1,
UPDATE MonHoc
SET Sotiet = 45
WHERE TenMH = 'Văn phạm';
--2,
UPDATE SinhVien
SET TenSV = N'Thanh Kỳ'
WHERE HoSV = N'Trần Thanh' AND TenSV = N'Mai';
--3,
UPDATE SinhVien
SET Phai = 'Nam'
WHERE HoSV = N'Trần Thanh' AND TenSV = N'Kỳ';
--4,
UPDATE SinhVien
SET NgaySinh = '1990-07-05'
WHERE HoSV = N'Trần Thị Thu' AND TenSV = N'Thủy';
--5,
UPDATE SinhVien
SET HocBong = HocBong + 100000
WHERE MaKH = 'AV'; 
--6,
UPDATE KetQua
SET Diem = CASE 
               WHEN Diem + 5 > 10 THEN 10
               ELSE Diem + 5
           END
FROM KetQua
JOIN SinhVien ON KetQua.MaSV = SinhVien.MaSV
JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH
WHERE MonHoc.TenMH = N'Trí Tuệ Nhân Tạo' AND SinhVien.MaKH = 'AV';
--7,
UPDATE SinhVien
SET HocBong = HocBong + 
    CASE 
        WHEN Phai = N'Nữ' AND MaKH = 'AV' THEN 100000
        WHEN Phai = N'Nam' AND MaKH = 'TH' THEN 150000
        ELSE 50000
    END;
--8,
UPDATE KetQua
SET Diem = CASE 
               WHEN SinhVien.MaKH = 'AV' THEN 
                   CASE 
                       WHEN Diem + 2 > 10 THEN 10 
                       ELSE Diem + 2 
                   END
               WHEN SinhVien.MaKH = 'TH' THEN 
                   CASE 
                       WHEN Diem - 1 < 0 THEN 0 
                       ELSE Diem - 1 
                   END
               ELSE Diem
           END
FROM KetQua
JOIN SinhVien ON KetQua.MaSV = SinhVien.MaSV
JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH
WHERE MonHoc.TenMH = 'Cơ sở dữ liệu';



