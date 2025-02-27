
create database istenen

use istenen




create table Gorevler(
Gorev_ID int primary key identity(1,1),
Gorev_Adi nvarchar(25)
)

create table Personeller(
Personel_ID int primary key identity(1,1),
Personel_Adi nvarchar(50),
Personel_Soyadi nvarchar(50),
Personel_Gorev_ID int,
Personel_TC nvarchar(11) unique,
Personel_Tel nvarchar(11) unique,
Personel_Mail nvarchar(50) unique,
Personel_Sifre nvarchar(6),
foreign key (Personel_Gorev_ID) references Gorevler(Gorev_ID)
)

create table Markalar(
Marka_ID int primary key identity(1,1),
Marka_Adi nvarchar(50)
)

create table Modeller(
Model_ID int primary key identity(1,1),
Marka_ID int,
Model_Adi nvarchar(50),
foreign key (Marka_ID) references Markalar(Marka_ID)
)

CREATE TABLE Musteriler (
    TC NVARCHAR(11) primary key ,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    TEL NVARCHAR(11) UNIQUE,
    Mail NVARCHAR(50) UNIQUE,
    Adres TEXT,
    Tarih DATETIME DEFAULT GETDATE()
);
Create table Arac_Bilgileri(
Sase_NO nvarchar(17) primary key not null,
TC NVARCHAR(11),
Plaka_NO nvarchar(10) unique  ,
Marka_ID int ,
Model_ID int,
Yil nvarchar(4),
Motor_NO nvarchar(6) not null,
Tarih datetime default getdate(),
foreign key (Marka_ID) references Markalar(Marka_ID),
foreign key (Model_ID) references Modeller(Model_ID),
foreign key (TC) references Musteriler(TC)
)





create table Servis(
Giris_ID int primary key identity(1,1),
Personel_ID int,
Sase_NO nvarchar(17),
KM nvarchar(7),
Sikayet text,
Yapilan_Ýslem text,
Aciklama text,
Tarih DATE DEFAULT GETDATE(),
foreign key (Personel_ID) references Personeller(Personel_ID),
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO),

)

--drop table Servis



--drop table Servis_Gecmisi



--drop table Servis_Gecmisi

--create table Servis_Gecmisi(
--Gecmis_ID int primary key identity(1,1),
--Personel_ID int,
--Sase_No nvarchar(17),
--Yapilan_Ýslem varchar(max),
--Toplam_Ucret decimal(18,2),
--Tarih DATE DEFAULT GETDATE(),
--foreign key (Personel_ID) references Personeller(Personel_ID),
--foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO)
--)

--CREATE TABLE Bakim_Gecmisi(
--    Gecmis_ID INT PRIMARY KEY IDENTITY(1,1),
--    Personel_ID INT,
--    Sase_NO NVARCHAR(17),
--    Yapilan_Ýslem VARCHAR(MAX),
--    Toplam_Ucret DECIMAL(18,2),
--    Tarih DATE DEFAULT GETDATE(),
--    FOREIGN KEY (Personel_ID) REFERENCES Personeller(Personel_ID),
--    FOREIGN KEY (Sase_NO) REFERENCES Arac_Bilgileri(Sase_NO)
--);


--EXEC sp_columns 'Arac_Bilgileri'
--SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Arac_Bilgileri';



ALTER TABLE Servis_Bilgileri
ALTER COLUMN Yapilan_Ýslem varchar(max)


-- bu kod Ýdentity özelliðini tekrardan sýfýrdan baþlatmak için kullanýlýr
--DELETE FROM Modeller;
--DBCC CHECKIDENT ('Modeller', RESEED, 0);


TRUNCATE TABLE Markalar;
TRUNCATE TABLE Modeller;
TRUNCATE TABLE Modeller;




-- Audi markasý için modelleri ekle
INSERT INTO Modeller (Marka_ID, Model_Adi) VALUES
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Audi'), 'A3'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Audi'), 'A4'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Audi'), 'A5'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Audi'), 'A6'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Audi'), 'A7'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Audi'), 'A8');


-- Skoda markasý için modelleri ekle (Kodiaq, Karoq, Kamiq, Scala, Fabia, Octavia, Superb)
INSERT INTO Modeller (Marka_ID, Model_Adi) VALUES
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Skoda'), 'Kodiaq'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Skoda'), 'Karoq'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Skoda'), 'Kamiq'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Skoda'), 'Scala'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Skoda'), 'Fabia'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Skoda'), 'Octavia'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Skoda'), 'Superb');


-- Seat markasý için modelleri ekle (Altea, Ýbiza, Leon, Toledo)
INSERT INTO Modeller (Marka_ID, Model_Adi) VALUES
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Seat'), 'Altea'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Seat'), 'Ýbiza'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Seat'), 'Leon'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Seat'), 'Toledo');


-- Wolksvagen markasý için modelleri ekle (örnek olarak)
INSERT INTO Modeller (Marka_ID, Model_Adi) VALUES
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Polo'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Golf'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'T-Cross'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Taigo'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'T-Roc'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Tiguan'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Caddy'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Amarok'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Passat'),
((SELECT Marka_ID FROM Markalar WHERE Marka_Adi = 'Wolksvagen'), 'Taureg');






--delete from Modeller


--ALTER TABLE Arac_Bilgileri
--DROP COLUMN Motor_NO;


--ALTER TABLE Arac_Bilgileri
--ADD Motor_NO nvarchar(5) not null;


--use tamirhane
--CREATE TABLE Durum (
--    Durum_ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--    Durum VARCHAR(50) 
--);


--EXEC sp_rename 'Durum.Durum', 'Durum_Adi', 'COLUMN';
--EXEC sp_rename 'Durum.Durum', 'Durum_Adi', 'COLUMN';

--ALTER TABLE Servis_Bilgileri
--RENAME COLUMN Durum_ID TO Durum;


--EXEC sp_rename 'Servis_Bilgileri', 'Durum_ID', 'Durumu';

--ALTER TABLE Servis_Bilgileri
--DROP COLUMN Durum;

--ALTER TABLE Servis_Bilgileri
--ADD Durum_ID int;

--ALTER TABLE Servis_Bilgileri
--ADD CONSTRAINT FK_Servis_Bilgileri_Durum
--FOREIGN KEY (Durum_ID) REFERENCES Durum(Durum_ID);



---- Dýþ anahtar kýsýtlamalarýný kaldýrýn
--ALTER TABLE Servis_Bilgileri
--DROP CONSTRAINT FK_ServisBilgileri_Durum;

---- Adý deðiþtirilecek sütunu kaldýrýn
--ALTER TABLE Servis_Bilgileri
--DROP COLUMN Durum_ID;

---- Yeni adýyla sütunu ekleyin
--ALTER TABLE Servis_Bilgileri
--ADD Durum INT;

---- Dýþ anahtar kýsýtlamalarýný yeniden ekleme
--ALTER TABLE Servis_Bilgileri
--ADD CONSTRAINT FK_ServisBilgileri_Durum FOREIGN KEY (Durum)
--REFERENCES Durum(Durum_ID);


--SELECT *
--FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
--WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
--AND TABLE_NAME = 'Servis';


---- 1. Mevcut dýþ anahtar kýsýtlamasýný kaldýrma
--ALTER TABLE Servis_Bilgileri
--DROP CONSTRAINT FK_Servis_Bilgileri_Durum;

---- 2. Durum_ID sütununu Durumu olarak deðiþtirme ve veri tipini INT olarak güncelleme
--EXEC sp_rename 'Servis_Bilgileri.Durum_ID', 'Durumu', 'COLUMN';
--ALTER TABLE Servis_Bilgileri
--ALTER COLUMN Durumu INT;

---- 3. Yeni dýþ anahtar kýsýtlamasýný ekleme
--ALTER TABLE Servis_Bilgileri
--ADD CONSTRAINT FK_Servis_Bilgileri_Durum FOREIGN KEY (Durumu)
--REFERENCES Durum(Durum_ID);
