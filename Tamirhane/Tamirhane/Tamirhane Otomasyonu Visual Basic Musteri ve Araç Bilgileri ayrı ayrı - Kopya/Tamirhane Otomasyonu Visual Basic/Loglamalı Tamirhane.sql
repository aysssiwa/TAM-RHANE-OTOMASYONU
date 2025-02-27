
--create database arac_servisi

use arac_servisi

--drop database arac_servisi


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


Create table Arac_Bilgileri(
Sase_NO nvarchar(17) primary key not null,
Plaka_NO nvarchar(10) unique  ,
Marka_ID int ,
Model_ID int,
Yil nvarchar(4),
Motor_NO nvarchar(3) not null,
Tarih datetime default getdate(),
foreign key (Marka_ID) references Markalar(Marka_ID),
foreign key (Model_ID) references Modeller(Model_ID)
)

create table Musteriler(
Musteri_ID int primary key identity(1,1),
Ad nvarchar(50),
Soyad nvarchar(50),
TC nvarchar(11) unique,
TEL nvarchar(11) unique,
Mail nvarchar(50) unique,
Adres text,
Sase_NO nvarchar(17) ,
Tarih datetime default getdate(),
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO)
)

create table Servis_Bilgileri(
Giris_ID int primary key,
Personel_ID int,
Sase_NO nvarchar(17),
Giris_KM nvarchar(7),
Sikayet text,
Yapilan_Ýslem text,
Cikis_KM nvarchar(7),
Aciklama text,
Ýscilik_Ucreti decimal(18,2),
Tarih datetime default getdate(),
Durum varchar(50),
foreign key (Personel_ID) references Personeller(Personel_ID),
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO)
)


create table Degisen_Parcalar(
ID int primary key not null identity(1,1),
Sase_NO nvarchar(17),
Degisen_Parca nvarchar(150),
Degisen_Parca_Ucreti decimal(18,2),
Degisme_Tarihi datetime default getdate())


create table Servis_Gecmisi(
Gecmis_ID int primary key identity(1,1),
Personel_ID int,
Sase_No nvarchar(17),
Yapilan_Ýslem text,
Toplam_Ucret decimal(18,2),
foreign key (Personel_ID) references Personeller(Personel_ID),
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO))



DELETE FROM Modeller;
DBCC CHECKIDENT ('Modeller', RESEED, 0); -- bu kod Ýdentity özelliðini tekrardan sýfýrdan baþlatmak için kullanýlýr



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






delete from Modeller


ALTER TABLE Arac_Bilgileri
DROP COLUMN Motor_NO;


ALTER TABLE Arac_Bilgileri
ADD Motor_NO nvarchar(5) not null;
