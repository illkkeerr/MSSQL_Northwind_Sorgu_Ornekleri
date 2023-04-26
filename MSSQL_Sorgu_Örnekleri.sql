--DDL(Data Definition Language)
--Create veritabanýnda nesneler oluþturmak için kullanýlýr
--Alter veritabanýndaki nesnelerin yapýsýný deðiþtirmek için kullanýlýr
--Drop veri tabanýndaki nesneleri silmek için kullanýlýr
--Truncate kayýtlar için ayrýlan tüm boþluklar dahil her þeyi kaldýrýr
--Rename bir nesneyi yeniden adlandýrmak için kullanýlýr

--DML(Data manipulation language)
--Select listeleme komutu veritabanýndan kayýt çekmek için kullanýlýr
--Insert tabloya veri yada veriler eklemek için kullanýlýr
--update tablodan kayýt yada kayýtlarýn güncellenmesi için kullanýlýr
--delete tablodan kayýt veya kayýtlarý silmek için kullanýlýr
--diðer komutlar
--MERGE – UPSERT iþlemi (ekleme veya güncelleme), baþka bir ifadeyle birleþtirme yapar.
--CALL – PL/SQL veya Java alt programýný çalýþtýrýr.
--EXPLAIN PLAN – Verilere eriþim yolunun detaylarýný açýklamak için kullanýlýr.
--LOCK TABLE – Kontrolü eþ zamanlýlýðý saðlamak için kullanýlýr.
--diðer komutlar
--https://www.gencayyildiz.com/blog/northwind-turkce-versiyonu/

--select kolonadý from urunler
select *from Urunler
select Adi,soyadi from Personeller
select MusteriAdi from Musteriler
select *from Tedarikciler
select *from [Satis Detaylari]
select *from Nakliyeciler

--ürün id sinin 4 olduðu verileri getirme
select *from Urunler where UrunID=4
--tedarikçi id sinin 7'ye eþit olup kategori idsinin 3ten küçük eþit olduðu ürünleri listele
select UrunID,UrunAdi,TedarikciID,KategoriID from Urunler where TedarikciID=7 and KategoriID<=3
--Personellerden london da yaþayanalrý listele
select PersonelID,Adi,SoyAdi,Sehir from Personeller where Sehir='London'
--Müþterilerden ülkesi fransa olanlarý listeleme
select SirketAdi,MusteriAdi,Ulke from Musteriler where ulke='France'
--tedarikçiid 1 kategori id si 1 hedef stok düzeyi 10 dan büyük ürünler tablosu
select *from urunler where TedarikciID=1 and KategoriID=1 and  HedefStokDuzeyi>=10
--musteri id'si chops olanlarý bulma 
select *from Musteriler m where m.MusteriID  in('chops')
--ilk harfi c son harfi e olan ürünleri listele
select *from Urunler U where u.UrunAdi like 'c%' and u.UrunAdi like '%e'
select *from Urunler U where u.UrunAdi like 'c%e' 
--ilk harfi c veya a olan ürünleri listele
select *from Urunler u where u.UrunAdi like 'a%' or u.UrunAdi like 'c%'
select *from urunler u where u.UrunAdi like '[c,a]%'
--ikinci harfi a olan ürünleri listele
select *from Urunler u where u.UrunAdi like '_a%'
--ürün idsi 5,7,8,11 olanlarý listele
select *from Urunler where UrunID=5 or UrunID=7 or UrunID=8 or UrunID=11
select *from urunler where UrunID in(5,7,8,11)
--ürünadi chai ve chang olanlarý listele
select *from Urunler u where u.UrunAdi in('chai','chang')
--ürün id si 5 ile 10 arasýnda olan ürünleri listele
select *from Urunler u where u.UrunID between 5 and 10
--birim fiyati 15 ile 25 arasýnda olan ürünleri listele
select *from Urunler u where u.BirimFiyati between 15 and 25
--ürünlerin ilk 15 ürününü seç
select top 15 *from Urunler
--adýnýn ilk harfi c olan sondan ikinci harfi n veya a olan  ve birim fiyati 18 ile 75 arsýnda olan 2 ürünü listele
select top 3 *from Urunler u where u.UrunAdi like 'c%[n,a]_' and u.BirimFiyati between 18 and 75
--ürünleri birim fiyatýna göre sýrala artan/azalan
select *from Urunler u order by u.BirimFiyati--artan
select *from urunler u order by u.BirimFiyati desc--azalan
--kategori id'si 5 olmayan ve ürün adý ikinci harfi i olan ürünler listesi birim fiyatý azalarak sýralansýn
select *from Urunler u where u.KategoriID<>5 and u.UrunAdi like '_i%' order by u.BirimFiyati desc
select *from Urunler u where u.KategoriID!=5 and u.UrunAdi like '_i%' order by u.BirimFiyati desc
--ürünid si 5,14,17,25,34 olmayan ürünleri ekrana yazma
select *from Urunler u where u.UrunID not in(5,14,17,25,34)
--ürünid si 2,3,4 olanlarý ekrana yazma
select *from Urunler u where u.UrunID in(2,3,4)
--içinde c harfi ve a harfi geçmeyen ürün adlarýný ekrana yazdýrma
select *from Urunler u where u.UrunAdi not like '%c%' and u.UrunAdi not like '%a%'
select *from Urunler u where u.UrunAdi not like '%[c,a]%'
--kategoriler tanim veya resim null olan deðerleri getir
select *from Kategoriler k where k.Tanimi is null or k.Resim is null
/*
insert into Kategoriler(KategoriAdi) values('Kiraz') 
insert into Kategoriler(KategoriAdi) values('Armut') 
*/
--Personel id si 4 olan ve nakliyeci ücreti 15 ile 45 arasýnda olan sevk tarihine
--göre tersten sýralayarak son 3 kaydý getiren satýþlarý listeleyiniz
select top 3 *from  Satislar s where s.PersonelID=4 and s.NakliyeUcreti between 15 and 45
order by s.SevkTarihi desc
--Aggregate fonksiyonlarý
--5 tane fonkisyon türü vardýr
--bu fonskiyonlar select ile from arasýna yazýlýr
--kullanýlýrken yanýna kolon getirilemez(þimdilik)

--1 count fonksiyonu
--satýr adedini verir
--kaç tane kategori id'si 4 olan ürün vardýr
select count(u.UrunAdi) from Urunler u where u.KategoriID=4
insert into Urunler(UrunAdi) values('kivi')
insert into urunler(UrunAdi) values('muz')
insert into Urunler(UrunAdi) values('mango')
--kategori id'si null olan ürünleri listeleyiniz 
select *from Urunler u where u.KategoriID is null
select *from Urunler
select count(u.UrunID) from Urunler u where u.KategoriID is null-- '=' sembolü iþ yapmýyor
--kategori id si null olmayan kaç ürün vardýr
select count(*) from Urunler u where u.KategoriID is not null

--2 sum fonksiyonu
--toplama iþlemi yapmayý saðlar
--tedarikçi id'si 5 olan ürünlerin toplam hedef stok düzeyini bulunuz
select sum(HedefStokDuzeyi) [Toplam Stok] from urunler u where u.TedarikciID=5
--bütün ürünlerin toplam deðerini bulunuz
select sum(u.HedefStokDuzeyi*u.BirimFiyati)from Urunler u
select *from Urunler
--ürün id si 5 olan ürününden ne kadar tl lik bir satýþ yapýlmýþtýr
select sum(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim)) [Urun Toplam Satis Ucreti] from [Satis Detaylari] sd where sd.UrunID=5
--ürün id si 5 olan üründen her satýþta ortalama kaç tl lik bir satýþ olmuþtur
select sum(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim))/count(*) from [Satis Detaylari] sd where sd.UrunID=5
--sevk þehri graz olan satýþlarýn toplam nakliye ücretini bulunuz
select sum(s.NakliyeUcreti) from Satislar s where s.SevkSehri='graz'
--graz þehrine yapýlan satýþ adedini buluz
select count(*) from Satislar s where s.SevkSehri='graz'
--graz þehrine 1 satýþta harcanan ortalama nakliye ücretini bulunuz
select sum(s.NakliyeUcreti)/count(*) from Satislar s where s.SevkSehri='graz'
-- üstteki soru avg li çözüm
select avg(s.NakliyeUcreti) from Satislar s where s.SevkSehri='graz'
--ürünleri ortalama birim fiyatýný bulunuz
select avg(u.BirimFiyati) from Urunler u
--Max kolon içerisinde en büyük deðeri verir
select max(BirimFiyati) from Urunler 
select min(BirimFiyati) from urunler--boþ geçince otomatik olarak birim fiyatýna 0 veriliyor
select *from Urunler
--group by tablo içerisindeki verilerin gruplanmasýný saðlar
--hangi kategoriden kaç adet ürün vardýr
select u.KategoriID,count(*) [Bu Kategoride Bulunan Urun Sayisi] from urunler u group by KategoriID 
--null olan deðerler sayýlmýyor Önemli
--hangi tedarikçiden kaç adet ürün alýnmýþ
select u.TedarikciID,count(*) from Urunler u group by TedarikciID
--tedarikçi id si 7 olan tedarikçiden kaç adet ürün tedarik edilmiþ
select u.TedarikciID,count(*) [Tedarik Edilen Ürün Adedi] 
from Urunler u where u.TedarikciID=7 group by u.TedarikciID
--ürünler tablosunda hangi kategoriden kaç adet vardýr 
select u.KategoriID,count(*) from urunler u group by u.KategoriID
-----------
select KategoriId,count(KategoriID) as KategoriSayýsý,sum(HedefStokDuzeyi) as 
'KategoriStokToplam',sum(HedefStokDuzeyi*BirimFiyati) as toplamsatis from Urunler group by KategoriID
-----------
--hangi tedarikçiden kaç adet tedarik yapýlmýþ ve tedarikçiye ödenen ücret
select u.TedarikciID,count(TedarikciID)[Tedarik Edilen Urun Sayisi],
sum(u.BirimFiyati*u.HedefStokDuzeyi)[Tedarikçiye Ödenen Ücret]
from Urunler u group by TedarikciID order by [Tedarikçiye Ödenen Ücret] desc
--
select *from Urunler u where u.TedarikciID=1
--
--ülkelere yapýlan satýþlarýn toplam nakliye ücretlerini yazma
select s.SevkUlkesi,count(s.SevkUlkesi)[Toplam Satýþ Sayýsý],sum(s.NakliyeUcreti)[Toplam Nakliye Ucreti] 
from Satislar s group by s.SevkUlkesi order by [Toplam Nakliye Ucreti]
--hangi personel hangi müþteriye kaç adet satýþ yapmýþtýr
select s.MusteriID,s.PersonelID,count(*) [Yapýlan satýþ Adedi] from Satislar s group by s.MusteriID,s.PersonelID order by s.PersonelID
--hangi müþterinin hangi nakliyeciden kaç adet sipariþte bulunduðunu bulan kod
select s.MusteriID,s.ShipVia,count(*) NakliyeAdet from Satislar s group by s.MusteriID,s.ShipVia order by ShipVia
--birim fiyatý 18 den büyük ürünler
select *from Urunler u where u.BirimFiyati>18

--urunun kategori adýný kategori id kullanarak kategoriler table ýndan çekmek
select u.UrunAdi,(select k.KategoriAdi from Kategoriler k where k.KategoriID=u.KategoriID) KategoriAdi from Urunler u
--tedarikci adýný getirme
select u.UrunAdi,(select t.SirketAdi from Tedarikciler t where t.TedarikciID=u.TedarikciID) TedarikciAdi from urunler u
--satýþlar tablosunu müþteri adý ünvaný personel adý soyadý ile ekrana yazdýr
--iki sutunu tek sutunda  birleþtirerek gönderebilirsin
select (select m.MusteriAdi+' '+m.MusteriUnvani from Musteriler m where m.MusteriID=s.MusteriID) Musteri,(select p.Adi+' '+p.SoyAdi from Personeller p where p.PersonelID=s.PersonelID) Personel from Satislar s
--ürünler tablosu ile birlikte her ürünün toplam satýþ adedixxx
select *,(select sum(miktar)from [Satis Detaylari] sd where sd.UrunID=u.UrunID) ToplamSatisAdetleri from urunler u
--Yapýlan her satýþtaki en yüksek birim fiyatý yazdýr
select (select max(sd.BirimFiyati) from [Satis Detaylari] sd where sd.SatisID=s.SatisID), * from Satislar s
--seçilen satiþ idsini getir
select distinct SatisID=10248 from [Satis Detaylari]
select SatisID from[Satis Detaylari] order by SatisID
--Kategorisi Beverages olan olan ürünleri getir
select *from Urunler u where u.KategoriID=(select k.KategoriID from Kategoriler k where k.KategoriAdi='Beverages') 
--ÖNEMLÝ
--en yüksek miktarlý ürünün satýldýðý satýþý listele
select top 1 SatisID,(select max(Miktar) from [Satis Detaylari] 
where Satislar.SatisID=[Satis Detaylari].SatisID ) adet from  Satislar order by adet desc
--satýþlardaki satýþ id ile satýþ detaylarýndaki en yüksek birim fiyatý bulma
select (select (max(sd.BirimFiyati)) from [Satis Detaylari] sd where sd.SatisID=s.SatisID) BirimFiyati,*from Satislar s 

select *from Satislar
--satýþlardaki satýlan en yüksek  idli ürünü yazdýrma
select (select (max(sd.BirimFiyati))from [Satis Detaylari] sd where sd.SatisID=s.SatisID),*from Satislar s 
--satýþ detaylarýnda ürünleri kategori adlarýný getirme
select (select u.KategoriID from Urunler u where u.UrunID=sd.UrunID) [Kategori Id],(select k.KategoriAdi from Kategoriler k where k.KategoriID=(select u.KategoriID from Urunler u where u.UrunID=sd.UrunID)) KategoriAdi,*from [Satis Detaylari] sd
---------------------------------2. Tip Sorgular-----------------------------------------
--Personel adý nancy olan personelin yaptýðý satýþlarý listele
select 'nancy' Personel,*from Satislar s where s.PersonelID=(select p.PersonelID from Personeller p where p.Adi='nancy') 

select (select p.Adi from Personeller p where p.PersonelID=s.PersonelID) PersonelAdi,* from Satislar s where PersonelID= (select PersonelID from Personeller where Adi='nancy') or PersonelID= (select PersonelID from Personeller where Adi='steven')

select * from Satislar where PersonelID in
(select PersonelID from Personeller where Adi in('nancy','steven'))
--kategori id si Beverages olan ürünleri listele
select (select k.KategoriAdi from Kategoriler k where u.KategoriID=k.KategoriID) KategoriAdi,*from Urunler u where u.KategoriID=(select k.KategoriID from Kategoriler k where k.KategoriAdi='Beverages') 
--ürün adý chai olan ürün kaç defa satýlmýþtýr
select count(*)from [Satis Detaylari] sd where sd.UrunID=(select u.UrunID from Urunler u where u.UrunAdi='chai')
--personel adý Nancy veya Janet olan, nakliyecisi speedy express olan satýþlarý
select *from Satislar s where s.PersonelID in (select p.PersonelID from Personeller p where p.Adi in('nancy','janet')) and s.ShipVia in (select n.NakliyeciID from Nakliyeciler n where n.SirketAdi in ('speedy express'))
--1997 yýlýnda yapýlan satýþlardan ne kadar ciro edildiðini ciro satiþ detaylarýnda
select *from Satislar s where  s.SatisTarihi between '1997-01-01' and '1997-12-31'

select sd.SatisID,sum(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim)) from [Satis Detaylari] sd where SatisID in(select s.SatisID from Satislar s where  s.SatisTarihi between '1997-01-01' and '1997-12-31') group by sd.SatisID

select sum(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim)) from [Satis Detaylari] sd 
where sd.SatisID in
(select s.SatisID from Satislar s where s.SatisTarihi between '1997.01.01' and '1997.12.31')

--Alfký olan müþteriye  yapýlan satýþ adedi
select *from Satislar s where s.MusteriID='ALFKI'

select count(SatisID) from satislar where MusteriID in ('VINET')
select count(SatisID) from satislar where MusteriID in (select MusteriID from Musteriler where SirketAdi='Vins et alcools Chevalier')
--speedy express firmasý toplamda kaç adet ürünün nakliyesi yapmýþtýr
select count(sd.Miktar) from [Satis Detaylari] sd where sd.SatisID in (select s.SatisID from Satislar s where s.ShipVia in (select n.NakliyeciID from Nakliyeciler n where n.SirketAdi in ('Speedy Express'))) 
group by sd.SatisID
--Ýki Tabloyu Birleþtirme
--gerekli tablolarý birleþtirerek tek bir tablo haline getiriyoruz.
--böylece istediðimiz sutunlarý rahatlýkla listeleyebiliyoruz
--ürünleri kategori adlarý ile listele sonra içinde urun idsi 5 olaný t ek getir
select u.UrunAdi,u.KategoriID,k.KategoriID,k.KategoriAdi from Urunler u,Kategoriler k where u.KategoriID=k.KategoriID

select u.UrunAdi,u.KategoriID,k.KategoriID,k.KategoriAdi from Urunler u,Kategoriler k where u.KategoriID=k.KategoriID and u.UrunID=5;
--urunler tedarikçiler ve kategorileri birleþtir
select u.UrunAdi,k.KategoriAdi,t.MusteriAdi,t.SirketAdi from Urunler u,Kategoriler k,Tedarikciler t where u.KategoriID=k.KategoriID and u.TedarikciID=t.TedarikciID
--hangi müþteriye hangi satýþ ve hangi ürün
select m.MusteriID,m.MusteriAdi,s.SatisID,s.SatisTarihi,u.UrunAdi,sd.Miktar from Musteriler m,Satislar s,Urunler u,[Satis Detaylari] sd where m.MusteriID=s.MusteriID and s.SatisID=sd.SatisID and sd.UrunID=u.UrunID order by s.SatisID
--tedarikçiler kategoriler,urunler
select *from Tedarikciler t,Kategoriler k,Urunler u where u.KategoriID=k.KategoriID and u.TedarikciID=t.TedarikciID
order by t.TedarikciID desc
--sorgu
select m.SirketAdi,m.Sehir,m.MusteriAdi,s.SevkTarihi,s.SevkUlkesi,sd.BirimFiyati,sd.Miktar,u.UrunAdi,k.KategoriAdi from Musteriler m, Satislar s, [Satis Detaylari] sd, Urunler u, Kategoriler k where m.MusteriID=s.MusteriID and s.SatisID=sd.SatisID and sd.UrunID=u.UrunID and u.KategoriID=k.KategoriID  order by MusteriAdi 
--sorgu
select MusteriAdi ,UrunAdi, sum(sd.Miktar) AlýnanMiktar , sum(sd.BirimFiyati*Miktar*(1-sd.Ýndirim)) OdenenFiyat from Urunler u, Musteriler m, Satislar s ,[Satis Detaylari] sd where (u.UrunID=sd.UrunID) and (sd.SatisID=s.SatisID) and (s.MusteriID=m.MusteriID) group by u.UrunAdi,m.MusteriAdi
--hangi personel hangi müþteriye kaç tllik harcama yaptýrmýþ
--önemli
select p.Adi PersonelAdi,p.SoyAdi PersonelSoyadi,m.MusteriAdi,m.SirketAdi,s.SatisID,sum (sd.Miktar*sd.BirimFiyati*(1-sd.Ýndirim)) [Toplam Harcama] from Personeller p,Musteriler m,[Satis Detaylari] sd,Satislar s where p.PersonelID=s.PersonelID and s.SatisID=sd.SatisID and s.MusteriID=m.MusteriID group by p.Adi,p.SoyAdi,m.MusteriAdi,m.SirketAdi,s.SatisID order by p.Adi,m.MusteriAdi
/*Hangi personel hangi þirkete hangi ürünü kaçtane satmýþtýr.
*/















