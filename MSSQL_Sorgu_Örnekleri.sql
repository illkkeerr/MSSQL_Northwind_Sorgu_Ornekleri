--DDL(Data Definition Language)
--Create veritaban�nda nesneler olu�turmak i�in kullan�l�r
--Alter veritaban�ndaki nesnelerin yap�s�n� de�i�tirmek i�in kullan�l�r
--Drop veri taban�ndaki nesneleri silmek i�in kullan�l�r
--Truncate kay�tlar i�in ayr�lan t�m bo�luklar dahil her �eyi kald�r�r
--Rename bir nesneyi yeniden adland�rmak i�in kullan�l�r

--DML(Data manipulation language)
--Select listeleme komutu veritaban�ndan kay�t �ekmek i�in kullan�l�r
--Insert tabloya veri yada veriler eklemek i�in kullan�l�r
--update tablodan kay�t yada kay�tlar�n g�ncellenmesi i�in kullan�l�r
--delete tablodan kay�t veya kay�tlar� silmek i�in kullan�l�r
--di�er komutlar
--MERGE � UPSERT i�lemi (ekleme veya g�ncelleme), ba�ka bir ifadeyle birle�tirme yapar.
--CALL � PL/SQL veya Java alt program�n� �al��t�r�r.
--EXPLAIN PLAN � Verilere eri�im yolunun detaylar�n� a��klamak i�in kullan�l�r.
--LOCK TABLE � Kontrol� e� zamanl�l��� sa�lamak i�in kullan�l�r.
--di�er komutlar
--https://www.gencayyildiz.com/blog/northwind-turkce-versiyonu/

--select kolonad� from urunler
select *from Urunler
select Adi,soyadi from Personeller
select MusteriAdi from Musteriler
select *from Tedarikciler
select *from [Satis Detaylari]
select *from Nakliyeciler

--�r�n id sinin 4 oldu�u verileri getirme
select *from Urunler where UrunID=4
--tedarik�i id sinin 7'ye e�it olup kategori idsinin 3ten k���k e�it oldu�u �r�nleri listele
select UrunID,UrunAdi,TedarikciID,KategoriID from Urunler where TedarikciID=7 and KategoriID<=3
--Personellerden london da ya�ayanalr� listele
select PersonelID,Adi,SoyAdi,Sehir from Personeller where Sehir='London'
--M��terilerden �lkesi fransa olanlar� listeleme
select SirketAdi,MusteriAdi,Ulke from Musteriler where ulke='France'
--tedarik�iid 1 kategori id si 1 hedef stok d�zeyi 10 dan b�y�k �r�nler tablosu
select *from urunler where TedarikciID=1 and KategoriID=1 and  HedefStokDuzeyi>=10
--musteri id'si chops olanlar� bulma 
select *from Musteriler m where m.MusteriID  in('chops')
--ilk harfi c son harfi e olan �r�nleri listele
select *from Urunler U where u.UrunAdi like 'c%' and u.UrunAdi like '%e'
select *from Urunler U where u.UrunAdi like 'c%e' 
--ilk harfi c veya a olan �r�nleri listele
select *from Urunler u where u.UrunAdi like 'a%' or u.UrunAdi like 'c%'
select *from urunler u where u.UrunAdi like '[c,a]%'
--ikinci harfi a olan �r�nleri listele
select *from Urunler u where u.UrunAdi like '_a%'
--�r�n idsi 5,7,8,11 olanlar� listele
select *from Urunler where UrunID=5 or UrunID=7 or UrunID=8 or UrunID=11
select *from urunler where UrunID in(5,7,8,11)
--�r�nadi chai ve chang olanlar� listele
select *from Urunler u where u.UrunAdi in('chai','chang')
--�r�n id si 5 ile 10 aras�nda olan �r�nleri listele
select *from Urunler u where u.UrunID between 5 and 10
--birim fiyati 15 ile 25 aras�nda olan �r�nleri listele
select *from Urunler u where u.BirimFiyati between 15 and 25
--�r�nlerin ilk 15 �r�n�n� se�
select top 15 *from Urunler
--ad�n�n ilk harfi c olan sondan ikinci harfi n veya a olan  ve birim fiyati 18 ile 75 ars�nda olan 2 �r�n� listele
select top 3 *from Urunler u where u.UrunAdi like 'c%[n,a]_' and u.BirimFiyati between 18 and 75
--�r�nleri birim fiyat�na g�re s�rala artan/azalan
select *from Urunler u order by u.BirimFiyati--artan
select *from urunler u order by u.BirimFiyati desc--azalan
--kategori id'si 5 olmayan ve �r�n ad� ikinci harfi i olan �r�nler listesi birim fiyat� azalarak s�ralans�n
select *from Urunler u where u.KategoriID<>5 and u.UrunAdi like '_i%' order by u.BirimFiyati desc
select *from Urunler u where u.KategoriID!=5 and u.UrunAdi like '_i%' order by u.BirimFiyati desc
--�r�nid si 5,14,17,25,34 olmayan �r�nleri ekrana yazma
select *from Urunler u where u.UrunID not in(5,14,17,25,34)
--�r�nid si 2,3,4 olanlar� ekrana yazma
select *from Urunler u where u.UrunID in(2,3,4)
--i�inde c harfi ve a harfi ge�meyen �r�n adlar�n� ekrana yazd�rma
select *from Urunler u where u.UrunAdi not like '%c%' and u.UrunAdi not like '%a%'
select *from Urunler u where u.UrunAdi not like '%[c,a]%'
--kategoriler tanim veya resim null olan de�erleri getir
select *from Kategoriler k where k.Tanimi is null or k.Resim is null
/*
insert into Kategoriler(KategoriAdi) values('Kiraz') 
insert into Kategoriler(KategoriAdi) values('Armut') 
*/
--Personel id si 4 olan ve nakliyeci �creti 15 ile 45 aras�nda olan sevk tarihine
--g�re tersten s�ralayarak son 3 kayd� getiren sat��lar� listeleyiniz
select top 3 *from  Satislar s where s.PersonelID=4 and s.NakliyeUcreti between 15 and 45
order by s.SevkTarihi desc
--Aggregate fonksiyonlar�
--5 tane fonkisyon t�r� vard�r
--bu fonskiyonlar select ile from aras�na yaz�l�r
--kullan�l�rken yan�na kolon getirilemez(�imdilik)

--1 count fonksiyonu
--sat�r adedini verir
--ka� tane kategori id'si 4 olan �r�n vard�r
select count(u.UrunAdi) from Urunler u where u.KategoriID=4
insert into Urunler(UrunAdi) values('kivi')
insert into urunler(UrunAdi) values('muz')
insert into Urunler(UrunAdi) values('mango')
--kategori id'si null olan �r�nleri listeleyiniz 
select *from Urunler u where u.KategoriID is null
select *from Urunler
select count(u.UrunID) from Urunler u where u.KategoriID is null-- '=' sembol� i� yapm�yor
--kategori id si null olmayan ka� �r�n vard�r
select count(*) from Urunler u where u.KategoriID is not null

--2 sum fonksiyonu
--toplama i�lemi yapmay� sa�lar
--tedarik�i id'si 5 olan �r�nlerin toplam hedef stok d�zeyini bulunuz
select sum(HedefStokDuzeyi) [Toplam Stok] from urunler u where u.TedarikciID=5
--b�t�n �r�nlerin toplam de�erini bulunuz
select sum(u.HedefStokDuzeyi*u.BirimFiyati)from Urunler u
select *from Urunler
--�r�n id si 5 olan �r�n�nden ne kadar tl lik bir sat�� yap�lm��t�r
select sum(sd.BirimFiyati*sd.Miktar*(1-sd.�ndirim)) [Urun Toplam Satis Ucreti] from [Satis Detaylari] sd where sd.UrunID=5
--�r�n id si 5 olan �r�nden her sat��ta ortalama ka� tl lik bir sat�� olmu�tur
select sum(sd.BirimFiyati*sd.Miktar*(1-sd.�ndirim))/count(*) from [Satis Detaylari] sd where sd.UrunID=5
--sevk �ehri graz olan sat��lar�n toplam nakliye �cretini bulunuz
select sum(s.NakliyeUcreti) from Satislar s where s.SevkSehri='graz'
--graz �ehrine yap�lan sat�� adedini buluz
select count(*) from Satislar s where s.SevkSehri='graz'
--graz �ehrine 1 sat��ta harcanan ortalama nakliye �cretini bulunuz
select sum(s.NakliyeUcreti)/count(*) from Satislar s where s.SevkSehri='graz'
-- �stteki soru avg li ��z�m
select avg(s.NakliyeUcreti) from Satislar s where s.SevkSehri='graz'
--�r�nleri ortalama birim fiyat�n� bulunuz
select avg(u.BirimFiyati) from Urunler u
--Max kolon i�erisinde en b�y�k de�eri verir
select max(BirimFiyati) from Urunler 
select min(BirimFiyati) from urunler--bo� ge�ince otomatik olarak birim fiyat�na 0 veriliyor
select *from Urunler
--group by tablo i�erisindeki verilerin gruplanmas�n� sa�lar
--hangi kategoriden ka� adet �r�n vard�r
select u.KategoriID,count(*) [Bu Kategoride Bulunan Urun Sayisi] from urunler u group by KategoriID 
--null olan de�erler say�lm�yor �nemli
--hangi tedarik�iden ka� adet �r�n al�nm��
select u.TedarikciID,count(*) from Urunler u group by TedarikciID
--tedarik�i id si 7 olan tedarik�iden ka� adet �r�n tedarik edilmi�
select u.TedarikciID,count(*) [Tedarik Edilen �r�n Adedi] 
from Urunler u where u.TedarikciID=7 group by u.TedarikciID
--�r�nler tablosunda hangi kategoriden ka� adet vard�r 
select u.KategoriID,count(*) from urunler u group by u.KategoriID
-----------
select KategoriId,count(KategoriID) as KategoriSay�s�,sum(HedefStokDuzeyi) as 
'KategoriStokToplam',sum(HedefStokDuzeyi*BirimFiyati) as toplamsatis from Urunler group by KategoriID
-----------
--hangi tedarik�iden ka� adet tedarik yap�lm�� ve tedarik�iye �denen �cret
select u.TedarikciID,count(TedarikciID)[Tedarik Edilen Urun Sayisi],
sum(u.BirimFiyati*u.HedefStokDuzeyi)[Tedarik�iye �denen �cret]
from Urunler u group by TedarikciID order by [Tedarik�iye �denen �cret] desc
--
select *from Urunler u where u.TedarikciID=1
--
--�lkelere yap�lan sat��lar�n toplam nakliye �cretlerini yazma
select s.SevkUlkesi,count(s.SevkUlkesi)[Toplam Sat�� Say�s�],sum(s.NakliyeUcreti)[Toplam Nakliye Ucreti] 
from Satislar s group by s.SevkUlkesi order by [Toplam Nakliye Ucreti]
--hangi personel hangi m��teriye ka� adet sat�� yapm��t�r
select s.MusteriID,s.PersonelID,count(*) [Yap�lan sat�� Adedi] from Satislar s group by s.MusteriID,s.PersonelID order by s.PersonelID
--hangi m��terinin hangi nakliyeciden ka� adet sipari�te bulundu�unu bulan kod
select s.MusteriID,s.ShipVia,count(*) NakliyeAdet from Satislar s group by s.MusteriID,s.ShipVia order by ShipVia
--birim fiyat� 18 den b�y�k �r�nler
select *from Urunler u where u.BirimFiyati>18

--urunun kategori ad�n� kategori id kullanarak kategoriler table �ndan �ekmek
select u.UrunAdi,(select k.KategoriAdi from Kategoriler k where k.KategoriID=u.KategoriID) KategoriAdi from Urunler u
--tedarikci ad�n� getirme
select u.UrunAdi,(select t.SirketAdi from Tedarikciler t where t.TedarikciID=u.TedarikciID) TedarikciAdi from urunler u
--sat��lar tablosunu m��teri ad� �nvan� personel ad� soyad� ile ekrana yazd�r
--iki sutunu tek sutunda  birle�tirerek g�nderebilirsin
select (select m.MusteriAdi+' '+m.MusteriUnvani from Musteriler m where m.MusteriID=s.MusteriID) Musteri,(select p.Adi+' '+p.SoyAdi from Personeller p where p.PersonelID=s.PersonelID) Personel from Satislar s
--�r�nler tablosu ile birlikte her �r�n�n toplam sat�� adedixxx
select *,(select sum(miktar)from [Satis Detaylari] sd where sd.UrunID=u.UrunID) ToplamSatisAdetleri from urunler u
--Yap�lan her sat��taki en y�ksek birim fiyat� yazd�r
select (select max(sd.BirimFiyati) from [Satis Detaylari] sd where sd.SatisID=s.SatisID), * from Satislar s
--se�ilen sati� idsini getir
select distinct SatisID=10248 from [Satis Detaylari]
select SatisID from[Satis Detaylari] order by SatisID
--Kategorisi Beverages olan olan �r�nleri getir
select *from Urunler u where u.KategoriID=(select k.KategoriID from Kategoriler k where k.KategoriAdi='Beverages') 
--�NEML�
--en y�ksek miktarl� �r�n�n sat�ld��� sat��� listele
select top 1 SatisID,(select max(Miktar) from [Satis Detaylari] 
where Satislar.SatisID=[Satis Detaylari].SatisID ) adet from  Satislar order by adet desc
--sat��lardaki sat�� id ile sat�� detaylar�ndaki en y�ksek birim fiyat� bulma
select (select (max(sd.BirimFiyati)) from [Satis Detaylari] sd where sd.SatisID=s.SatisID) BirimFiyati,*from Satislar s 

select *from Satislar
--sat��lardaki sat�lan en y�ksek  idli �r�n� yazd�rma
select (select (max(sd.BirimFiyati))from [Satis Detaylari] sd where sd.SatisID=s.SatisID),*from Satislar s 
--sat�� detaylar�nda �r�nleri kategori adlar�n� getirme
select (select u.KategoriID from Urunler u where u.UrunID=sd.UrunID) [Kategori Id],(select k.KategoriAdi from Kategoriler k where k.KategoriID=(select u.KategoriID from Urunler u where u.UrunID=sd.UrunID)) KategoriAdi,*from [Satis Detaylari] sd
---------------------------------2. Tip Sorgular-----------------------------------------
--Personel ad� nancy olan personelin yapt��� sat��lar� listele
select 'nancy' Personel,*from Satislar s where s.PersonelID=(select p.PersonelID from Personeller p where p.Adi='nancy') 

select (select p.Adi from Personeller p where p.PersonelID=s.PersonelID) PersonelAdi,* from Satislar s where PersonelID= (select PersonelID from Personeller where Adi='nancy') or PersonelID= (select PersonelID from Personeller where Adi='steven')

select * from Satislar where PersonelID in
(select PersonelID from Personeller where Adi in('nancy','steven'))
--kategori id si Beverages olan �r�nleri listele
select (select k.KategoriAdi from Kategoriler k where u.KategoriID=k.KategoriID) KategoriAdi,*from Urunler u where u.KategoriID=(select k.KategoriID from Kategoriler k where k.KategoriAdi='Beverages') 
--�r�n ad� chai olan �r�n ka� defa sat�lm��t�r
select count(*)from [Satis Detaylari] sd where sd.UrunID=(select u.UrunID from Urunler u where u.UrunAdi='chai')
--personel ad� Nancy veya Janet olan, nakliyecisi speedy express olan sat��lar�
select *from Satislar s where s.PersonelID in (select p.PersonelID from Personeller p where p.Adi in('nancy','janet')) and s.ShipVia in (select n.NakliyeciID from Nakliyeciler n where n.SirketAdi in ('speedy express'))
--1997 y�l�nda yap�lan sat��lardan ne kadar ciro edildi�ini ciro sati� detaylar�nda
select *from Satislar s where  s.SatisTarihi between '1997-01-01' and '1997-12-31'

select sd.SatisID,sum(sd.BirimFiyati*sd.Miktar*(1-sd.�ndirim)) from [Satis Detaylari] sd where SatisID in(select s.SatisID from Satislar s where  s.SatisTarihi between '1997-01-01' and '1997-12-31') group by sd.SatisID

select sum(sd.BirimFiyati*sd.Miktar*(1-sd.�ndirim)) from [Satis Detaylari] sd 
where sd.SatisID in
(select s.SatisID from Satislar s where s.SatisTarihi between '1997.01.01' and '1997.12.31')

--Alfk� olan m��teriye  yap�lan sat�� adedi
select *from Satislar s where s.MusteriID='ALFKI'

select count(SatisID) from satislar where MusteriID in ('VINET')
select count(SatisID) from satislar where MusteriID in (select MusteriID from Musteriler where SirketAdi='Vins et alcools Chevalier')
--speedy express firmas� toplamda ka� adet �r�n�n nakliyesi yapm��t�r
select count(sd.Miktar) from [Satis Detaylari] sd where sd.SatisID in (select s.SatisID from Satislar s where s.ShipVia in (select n.NakliyeciID from Nakliyeciler n where n.SirketAdi in ('Speedy Express'))) 
group by sd.SatisID
--�ki Tabloyu Birle�tirme
--gerekli tablolar� birle�tirerek tek bir tablo haline getiriyoruz.
--b�ylece istedi�imiz sutunlar� rahatl�kla listeleyebiliyoruz
--�r�nleri kategori adlar� ile listele sonra i�inde urun idsi 5 olan� t ek getir
select u.UrunAdi,u.KategoriID,k.KategoriID,k.KategoriAdi from Urunler u,Kategoriler k where u.KategoriID=k.KategoriID

select u.UrunAdi,u.KategoriID,k.KategoriID,k.KategoriAdi from Urunler u,Kategoriler k where u.KategoriID=k.KategoriID and u.UrunID=5;
--urunler tedarik�iler ve kategorileri birle�tir
select u.UrunAdi,k.KategoriAdi,t.MusteriAdi,t.SirketAdi from Urunler u,Kategoriler k,Tedarikciler t where u.KategoriID=k.KategoriID and u.TedarikciID=t.TedarikciID
--hangi m��teriye hangi sat�� ve hangi �r�n
select m.MusteriID,m.MusteriAdi,s.SatisID,s.SatisTarihi,u.UrunAdi,sd.Miktar from Musteriler m,Satislar s,Urunler u,[Satis Detaylari] sd where m.MusteriID=s.MusteriID and s.SatisID=sd.SatisID and sd.UrunID=u.UrunID order by s.SatisID
--tedarik�iler kategoriler,urunler
select *from Tedarikciler t,Kategoriler k,Urunler u where u.KategoriID=k.KategoriID and u.TedarikciID=t.TedarikciID
order by t.TedarikciID desc
--sorgu
select m.SirketAdi,m.Sehir,m.MusteriAdi,s.SevkTarihi,s.SevkUlkesi,sd.BirimFiyati,sd.Miktar,u.UrunAdi,k.KategoriAdi from Musteriler m, Satislar s, [Satis Detaylari] sd, Urunler u, Kategoriler k where m.MusteriID=s.MusteriID and s.SatisID=sd.SatisID and sd.UrunID=u.UrunID and u.KategoriID=k.KategoriID  order by MusteriAdi 
--sorgu
select MusteriAdi ,UrunAdi, sum(sd.Miktar) Al�nanMiktar , sum(sd.BirimFiyati*Miktar*(1-sd.�ndirim)) OdenenFiyat from Urunler u, Musteriler m, Satislar s ,[Satis Detaylari] sd where (u.UrunID=sd.UrunID) and (sd.SatisID=s.SatisID) and (s.MusteriID=m.MusteriID) group by u.UrunAdi,m.MusteriAdi
--hangi personel hangi m��teriye ka� tllik harcama yapt�rm��
--�nemli
select p.Adi PersonelAdi,p.SoyAdi PersonelSoyadi,m.MusteriAdi,m.SirketAdi,s.SatisID,sum (sd.Miktar*sd.BirimFiyati*(1-sd.�ndirim)) [Toplam Harcama] from Personeller p,Musteriler m,[Satis Detaylari] sd,Satislar s where p.PersonelID=s.PersonelID and s.SatisID=sd.SatisID and s.MusteriID=m.MusteriID group by p.Adi,p.SoyAdi,m.MusteriAdi,m.SirketAdi,s.SatisID order by p.Adi,m.MusteriAdi
/*Hangi personel hangi �irkete hangi �r�n� ka�tane satm��t�r.
*/















