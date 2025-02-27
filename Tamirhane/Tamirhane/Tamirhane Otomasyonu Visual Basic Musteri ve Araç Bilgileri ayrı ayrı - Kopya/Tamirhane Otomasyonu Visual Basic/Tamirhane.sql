

--create database Tamirhane

--use Tamirhane


--drop database Tamirhane

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
foreign key (Marka_ID) references Markalar(Marka_ID),
foreign key (Model_ID) references Modeller(Model_ID)
)

create table Musteriler(
Musteri_ID int primary key,
Ad nvarchar(50),
Soyad nvarchar(50),
TC nvarchar(11) unique,
TEL nvarchar(11) unique,
Mail nvarchar(50) unique,
Adres text,
Sase_NO nvarchar(17) ,
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO)
)

create table Servis_Giris(
Giris_ID int primary key,
Usta_ID int,
Sase_NO nvarchar(17),
Giris_KM nvarchar(7),
Sikayet text,
foreign key (Usta_ID) references Personeller(Personel_ID),
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO)
)

create table Servis_Bilgileri(
Servis_ID int primary key ,
Tarih datetime,
Sase_NO nvarchar(17),
Giris_ID int, 
Yapilan_İslem text,
Degisen_Parca nvarchar(50),
Miktar int,
Fiyat decimal(10,2),
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO),
foreign key (Giris_ID) references Servis_Giris(Giris_ID)

)

create table Servis_Cikis(
Cikis_ID int primary key ,
Tarih datetime,
Sase_NO nvarchar(17),
Giris_ID int,
Servis_ID int,
Aciklama text,
Toplam_Fiyat decimal(10,2),
Cikis_KM nvarchar(7),
foreign key (Sase_NO) references Arac_Bilgileri(Sase_NO),
foreign key (Giris_ID) references Servis_Giris(Giris_ID),
foreign key (Servis_ID) references Servis_Bilgileri(Servis_ID)
 

)







