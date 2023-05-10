--DDL(Data Definition Language)
--Create veritabanında nesneler oluşturmak için kullanılır
--Alter veritabanındaki nesnelerin yapısını değiştirmek için kullanılır
--Drop veri tabanındaki nesneleri silmek için kullanılır
--Truncate kayıtlar için ayrılan tüm boşluklar dahil her şeyi kaldırır
--Rename bir nesneyi yeniden adlandırmak için kullanılır

--DML(Data manipulation language)
--Select listeleme komutu veritabanından kayıt çekmek için kullanılır
--Insert tabloya veri yada veriler eklemek için kullanılır
--update tablodan kayıt yada kayıtların güncellenmesi için kullanılır
--delete tablodan kayıt veya kayıtları silmek için kullanılır
--diğer komutlar
--MERGE – UPSERT işlemi (ekleme veya güncelleme), başka bir ifadeyle birleştirme yapar.
--CALL – PL/SQL veya Java alt programını çalıştırır.
--EXPLAIN PLAN – Verilere erişim yolunun detaylarını açıklamak için kullanılır.
--LOCK TABLE – Kontrolü eş zamanlılığı sağlamak için kullanılır.
--diğer komutlar
--https://www.gencayyildiz.com/blog/northwind-turkce-versiyonu/

--select kolonadı from urunler
select *from Urunler
select Adi,soyadi from Personeller
select MusteriAdi from Musteriler
select *from Tedarikciler
select *from [Satis Detaylari]
select *from Nakliyeciler

--ürün id sinin 4 olduğu verileri getirme
select *from Urunler where UrunID=4
--tedarikçi id sinin 7'ye eşit olup kategori idsinin 3ten küçük eşit olduğu ürünleri listele
select UrunID,UrunAdi,TedarikciID,KategoriID from Urunler where TedarikciID=7 and KategoriID<=3
--Personellerden london da yaşayanalrı listele
select PersonelID,Adi,SoyAdi,Sehir from Personeller where Sehir='London'
--Müşterilerden ülkesi fransa olanları listeleme
select SirketAdi,MusteriAdi,Ulke from Musteriler where ulke='France'
--tedarikçiid 1 kategori id si 1 hedef stok düzeyi 10 dan büyük ürünler tablosu
select *from urunler where TedarikciID=1 and KategoriID=1 and  HedefStokDuzeyi>=10
--musteri id'si chops olanları bulma 
select *from Musteriler m where m.MusteriID  in('chops')
--ilk harfi c son harfi e olan ürünleri listele
select *from Urunler U where u.UrunAdi like 'c%' and u.UrunAdi like '%e'
select *from Urunler U where u.UrunAdi like 'c%e' 
--ilk harfi c veya a olan ürünleri listele
select *from Urunler u where u.UrunAdi like 'a%' or u.UrunAdi like 'c%'
select *from urunler u where u.UrunAdi like '[c,a]%'
--ikinci harfi a olan ürünleri listele
select *from Urunler u where u.UrunAdi like '_a%'
--ürün idsi 5,7,8,11 olanları listele
select *from Urunler where UrunID=5 or UrunID=7 or UrunID=8 or UrunID=11
select *from urunler where UrunID in(5,7,8,11)
--ürünadi chai ve chang olanları listele
select *from Urunler u where u.UrunAdi in('chai','chang')
--ürün id si 5 ile 10 arasında olan ürünleri listele
select *from Urunler u where u.UrunID between 5 and 10
--birim fiyati 15 ile 25 arasında olan ürünleri listele
select *from Urunler u where u.BirimFiyati between 15 and 25
--ürünlerin ilk 15 ürününü seç
select top 15 *from Urunler
--adının ilk harfi c olan sondan ikinci harfi n veya a olan  ve birim fiyati 18 ile 75 arsında olan 2 ürünü listele
select top 3 *from Urunler u where u.UrunAdi like 'c%[n,a]_' and u.BirimFiyati between 18 and 75
--ürünleri birim fiyatına göre sırala artan/azalan
select *from Urunler u order by u.BirimFiyati--artan
select *from urunler u order by u.BirimFiyati desc--azalan
--kategori id'si 5 olmayan ve ürün adı ikinci harfi i olan ürünler listesi birim fiyatı azalarak sıralansın
select *from Urunler u where u.KategoriID<>5 and u.UrunAdi like '_i%' order by u.BirimFiyati desc
select *from Urunler u where u.KategoriID!=5 and u.UrunAdi like '_i%' order by u.BirimFiyati desc
--ürünid si 5,14,17,25,34 olmayan ürünleri ekrana yazma
select *from Urunler u where u.UrunID not in(5,14,17,25,34)
--ürünid si 2,3,4 olanları ekrana yazma
select *from Urunler u where u.UrunID in(2,3,4)
--içinde c harfi ve a harfi geçmeyen ürün adlarını ekrana yazdırma
select *from Urunler u where u.UrunAdi not like '%c%' and u.UrunAdi not like '%a%'
select *from Urunler u where u.UrunAdi not like '%[c,a]%'
--kategoriler tanim veya resim null olan değerleri getir
select *from Kategoriler k where k.Tanimi is null or k.Resim is null
/*
insert into Kategoriler(KategoriAdi) values('Kiraz') 
insert into Kategoriler(KategoriAdi) values('Armut') 
*/
--Personel id si 4 olan ve nakliyeci ücreti 15 ile 45 arasında olan sevk tarihine
--göre tersten sıralayarak son 3 kaydı getiren satışları listeleyiniz
select top 3 *from  Satislar s where s.PersonelID=4 and s.NakliyeUcreti between 15 and 45
order by s.SevkTarihi desc
--Aggregate fonksiyonları
--5 tane fonkisyon türü vardır
--bu fonskiyonlar select ile from arasına yazılır
--kullanılırken yanına kolon getirilemez(şimdilik)

--1 count fonksiyonu
--satır adedini verir
--kaç tane kategori id'si 4 olan ürün vardır
select count(u.UrunAdi) from Urunler u where u.KategoriID=4
insert into Urunler(UrunAdi) values('kivi')
insert into urunler(UrunAdi) values('muz')
insert into Urunler(UrunAdi) values('mango')
--kategori id'si null olan ürünleri listeleyiniz 
select *from Urunler u where u.KategoriID is null
select *from Urunler
select count(u.UrunID) from Urunler u where u.KategoriID is null-- '=' sembolü iş yapmıyor
--kategori id si null olmayan kaç ürün vardır
select count(*) from Urunler u where u.KategoriID is not null

--2 sum fonksiyonu
--toplama işlemi yapmayı sağlar
--tedarikçi id'si 5 olan ürünlerin toplam hedef stok düzeyini bulunuz
select sum(HedefStokDuzeyi) [Toplam Stok] from urunler u where u.TedarikciID=5
--bütün ürünlerin toplam değerini bulunuz
select sum(u.HedefStokDuzeyi*u.BirimFiyati)from Urunler u
select *from Urunler
--ürün id si 5 olan ürününden ne kadar tl lik bir satış yapılmıştır
select sum(sd.BirimFiyati*sd.Miktar*(1-sd.İndirim)) [Urun Toplam Satis Ucreti] from [Satis Detaylari] sd where sd.UrunID=5
--ürün id si 5 olan üründen her satışta ortalama kaç tl lik bir satış olmuştur
select sum(sd.BirimFiyati*sd.Miktar*(1-sd.İndirim))/count(*) from [Satis Detaylari] sd where sd.UrunID=5
--sevk şehri graz olan satışların toplam nakliye ücretini bulunuz
select sum(s.NakliyeUcreti) from Satislar s where s.SevkSehri='graz'
--graz şehrine yapılan satış adedini buluz
select count(*) from Satislar s where s.SevkSehri='graz'
--graz şehrine 1 satışta harcanan ortalama nakliye ücretini bulunuz
select sum(s.NakliyeUcreti)/count(*) from Satislar s where s.SevkSehri='graz'
-- üstteki soru avg li çözüm
select avg(s.NakliyeUcreti) from Satislar s where s.SevkSehri='graz'
--ürünleri ortalama birim fiyatını bulunuz
select avg(u.BirimFiyati) from Urunler u
--Max kolon içerisinde en büyük değeri verir
select max(BirimFiyati) from Urunler 
select min(BirimFiyati) from urunler--boş geçince otomatik olarak birim fiyatına 0 veriliyor
select *from Urunler
--group by tablo içerisindeki verilerin gruplanmasını sağlar
--hangi kategoriden kaç adet ürün vardır
select u.KategoriID,count(*) [Bu Kategoride Bulunan Urun Sayisi] from urunler u group by KategoriID 
--null olan değerler sayılmıyor Önemli
--hangi tedarikçiden kaç adet ürün alınmış
select u.TedarikciID,count(*) from Urunler u group by TedarikciID
--tedarikçi id si 7 olan tedarikçiden kaç adet ürün tedarik edilmiş
select u.TedarikciID,count(*) [Tedarik Edilen Ürün Adedi] 
from Urunler u where u.TedarikciID=7 group by u.TedarikciID
--ürünler tablosunda hangi kategoriden kaç adet vardır 
select u.KategoriID,count(*) from urunler u group by u.KategoriID
-----------
select KategoriId,count(KategoriID) as KategoriSayısı,sum(HedefStokDuzeyi) as 
'KategoriStokToplam',sum(HedefStokDuzeyi*BirimFiyati) as toplamsatis from Urunler group by KategoriID
-----------
--hangi tedarikçiden kaç adet tedarik yapılmış ve tedarikçiye ödenen ücret
select u.TedarikciID,count(TedarikciID)[Tedarik Edilen Urun Sayisi],
sum(u.BirimFiyati*u.HedefStokDuzeyi)[Tedarikçiye Ödenen Ücret]
from Urunler u group by TedarikciID order by [Tedarikçiye Ödenen Ücret] desc
--
select *from Urunler u where u.TedarikciID=1
--
--ülkelere yapılan satışların toplam nakliye ücretlerini yazma
select s.SevkUlkesi,count(s.SevkUlkesi)[Toplam Satış Sayısı],sum(s.NakliyeUcreti)[Toplam Nakliye Ucreti] 
from Satislar s group by s.SevkUlkesi order by [Toplam Nakliye Ucreti]
--hangi personel hangi müşteriye kaç adet satış yapmıştır
select s.MusteriID,s.PersonelID,count(*) [Yapılan satış Adedi] from Satislar s group by s.MusteriID,s.PersonelID order by s.PersonelID
--hangi müşterinin hangi nakliyeciden kaç adet siparişte bulunduğunu bulan kod
select s.MusteriID,s.ShipVia,count(*) NakliyeAdet from Satislar s group by s.MusteriID,s.ShipVia order by ShipVia
--birim fiyatı 18 den büyük ürünler
select *from Urunler u where u.BirimFiyati>18

--urunun kategori adını kategori id kullanarak kategoriler table ından çekmek
select u.UrunAdi,(select k.KategoriAdi from Kategoriler k where k.KategoriID=u.KategoriID) KategoriAdi from Urunler u
--tedarikci adını getirme
select u.UrunAdi,(select t.SirketAdi from Tedarikciler t where t.TedarikciID=u.TedarikciID) TedarikciAdi from urunler u
--satışlar tablosunu müşteri adı ünvanı personel adı soyadı ile ekrana yazdır
--iki sutunu tek sutunda  birleştirerek gönderebilirsin
select (select m.MusteriAdi+' '+m.MusteriUnvani from Musteriler m where m.MusteriID=s.MusteriID) Musteri,(select p.Adi+' '+p.SoyAdi from Personeller p where p.PersonelID=s.PersonelID) Personel from Satislar s
--ürünler tablosu ile birlikte her ürünün toplam satış adedixxx
select *,(select sum(miktar)from [Satis Detaylari] sd where sd.UrunID=u.UrunID) ToplamSatisAdetleri from urunler u
--Yapılan her satıştaki en yüksek birim fiyatı yazdır
select (select max(sd.BirimFiyati) from [Satis Detaylari] sd where sd.SatisID=s.SatisID), * from Satislar s
--seçilen satiş idsini getir
select distinct SatisID=10248 from [Satis Detaylari]
select SatisID from[Satis Detaylari] order by SatisID
--Kategorisi Beverages olan olan ürünleri getir
select *from Urunler u where u.KategoriID=(select k.KategoriID from Kategoriler k where k.KategoriAdi='Beverages') 
--ÖNEMLİ
--en yüksek miktarlı ürünün satıldığı satışı listele
select top 1 SatisID,(select max(Miktar) from [Satis Detaylari] 
where Satislar.SatisID=[Satis Detaylari].SatisID ) adet from  Satislar order by adet desc
--satışlardaki satış id ile satış detaylarındaki en yüksek birim fiyatı bulma
select (select (max(sd.BirimFiyati)) from [Satis Detaylari] sd where sd.SatisID=s.SatisID) BirimFiyati,*from Satislar s 

select *from Satislar
--satışlardaki satılan en yüksek  idli ürünü yazdırma
select (select (max(sd.BirimFiyati))from [Satis Detaylari] sd where sd.SatisID=s.SatisID),*from Satislar s 
--satış detaylarında ürünleri kategori adlarını getirme
select (select u.KategoriID from Urunler u where u.UrunID=sd.UrunID) [Kategori Id],(select k.KategoriAdi from Kategoriler k where k.KategoriID=(select u.KategoriID from Urunler u where u.UrunID=sd.UrunID)) KategoriAdi,*from [Satis Detaylari] sd
---------------------------------2. Tip Sorgular-----------------------------------------
--Personel adı nancy olan personelin yaptığı satışları listele
select 'nancy' Personel,*from Satislar s where s.PersonelID=(select p.PersonelID from Personeller p where p.Adi='nancy') 

select (select p.Adi from Personeller p where p.PersonelID=s.PersonelID) PersonelAdi,* from Satislar s where PersonelID= (select PersonelID from Personeller where Adi='nancy') or PersonelID= (select PersonelID from Personeller where Adi='steven')

select * from Satislar where PersonelID in
(select PersonelID from Personeller where Adi in('nancy','steven'))
--kategori id si Beverages olan ürünleri listele
select (select k.KategoriAdi from Kategoriler k where u.KategoriID=k.KategoriID) KategoriAdi,*from Urunler u where u.KategoriID=(select k.KategoriID from Kategoriler k where k.KategoriAdi='Beverages') 
--ürün adı chai olan ürün kaç defa satılmıştır
select count(*)from [Satis Detaylari] sd where sd.UrunID=(select u.UrunID from Urunler u where u.UrunAdi='chai')
--personel adı Nancy veya Janet olan, nakliyecisi speedy express olan satışları
select *from Satislar s where s.PersonelID in (select p.PersonelID from Personeller p where p.Adi in('nancy','janet')) and s.ShipVia in (select n.NakliyeciID from Nakliyeciler n where n.SirketAdi in ('speedy express'))
--1997 yılında yapılan satışlardan ne kadar ciro edildiğini ciro satiş detaylarında
select *from Satislar s where  s.SatisTarihi between '1997-01-01' and '1997-12-31'

select sd.SatisID,sum(sd.BirimFiyati*sd.Miktar*(1-sd.İndirim)) from [Satis Detaylari] sd where SatisID in(select s.SatisID from Satislar s where  s.SatisTarihi between '1997-01-01' and '1997-12-31') group by sd.SatisID

select sum(sd.BirimFiyati*sd.Miktar*(1-sd.İndirim)) from [Satis Detaylari] sd 
where sd.SatisID in
(select s.SatisID from Satislar s where s.SatisTarihi between '1997.01.01' and '1997.12.31')

--Alfkı olan müşteriye  yapılan satış adedi
select *from Satislar s where s.MusteriID='ALFKI'

select count(SatisID) from satislar where MusteriID in ('VINET')
select count(SatisID) from satislar where MusteriID in (select MusteriID from Musteriler where SirketAdi='Vins et alcools Chevalier')
--speedy express firması toplamda kaç adet ürünün nakliyesi yapmıştır
select count(sd.Miktar) from [Satis Detaylari] sd where sd.SatisID in (select s.SatisID from Satislar s where s.ShipVia in (select n.NakliyeciID from Nakliyeciler n where n.SirketAdi in ('Speedy Express'))) 
group by sd.SatisID
--İki Tabloyu Birleştirme
--gerekli tabloları birleştirerek tek bir tablo haline getiriyoruz.
--böylece istediğimiz sutunları rahatlıkla listeleyebiliyoruz
--ürünleri kategori adları ile listele sonra içinde urun idsi 5 olanı t ek getir
select u.UrunAdi,u.KategoriID,k.KategoriID,k.KategoriAdi from Urunler u,Kategoriler k where u.KategoriID=k.KategoriID

select u.UrunAdi,u.KategoriID,k.KategoriID,k.KategoriAdi from Urunler u,Kategoriler k where u.KategoriID=k.KategoriID and u.UrunID=5;
--urunler tedarikçiler ve kategorileri birleştir
select u.UrunAdi,k.KategoriAdi,t.MusteriAdi,t.SirketAdi from Urunler u,Kategoriler k,Tedarikciler t where u.KategoriID=k.KategoriID and u.TedarikciID=t.TedarikciID
--hangi müşteriye hangi satış ve hangi ürün
select m.MusteriID,m.MusteriAdi,s.SatisID,s.SatisTarihi,u.UrunAdi,sd.Miktar from Musteriler m,Satislar s,Urunler u,[Satis Detaylari] sd where m.MusteriID=s.MusteriID and s.SatisID=sd.SatisID and sd.UrunID=u.UrunID order by s.SatisID
--tedarikçiler kategoriler,urunler
select *from Tedarikciler t,Kategoriler k,Urunler u where u.KategoriID=k.KategoriID and u.TedarikciID=t.TedarikciID
order by t.TedarikciID desc
--sorgu
select m.SirketAdi,m.Sehir,m.MusteriAdi,s.SevkTarihi,s.SevkUlkesi,sd.BirimFiyati,sd.Miktar,u.UrunAdi,k.KategoriAdi from Musteriler m, Satislar s, [Satis Detaylari] sd, Urunler u, Kategoriler k where m.MusteriID=s.MusteriID and s.SatisID=sd.SatisID and sd.UrunID=u.UrunID and u.KategoriID=k.KategoriID  order by MusteriAdi 
--sorgu
select MusteriAdi ,UrunAdi, sum(sd.Miktar) AlınanMiktar , sum(sd.BirimFiyati*Miktar*(1-sd.İndirim)) OdenenFiyat from Urunler u, Musteriler m, Satislar s ,[Satis Detaylari] sd where (u.UrunID=sd.UrunID) and (sd.SatisID=s.SatisID) and (s.MusteriID=m.MusteriID) group by u.UrunAdi,m.MusteriAdi
--hangi personel hangi müşteriye kaç tllik harcama yaptırmış
--önemli
select p.Adi PersonelAdi,p.SoyAdi PersonelSoyadi,m.MusteriAdi,m.SirketAdi,s.SatisID,sum (sd.Miktar*sd.BirimFiyati*(1-sd.İndirim)) [Toplam Harcama] from Personeller p,Musteriler m,[Satis Detaylari] sd,Satislar s where p.PersonelID=s.PersonelID and s.SatisID=sd.SatisID and s.MusteriID=m.MusteriID group by p.Adi,p.SoyAdi,m.MusteriAdi,m.SirketAdi,s.SatisID order by p.Adi,m.MusteriAdi
/*Hangi personel hangi şirkete hangi ürünü kaçtane satmıştır.
*/
select p.Adi,p.SoyAdi,m.MusteriAdi,m.SirketAdi,u.UrunAdi,sum(sd.Miktar) SatilanUrunAdedi,count(sd.Miktar)YapilanSatisAdedi from Personeller p,Satislar s,Musteriler m,[Satis Detaylari] sd, Urunler u where p.PersonelID=s.PersonelID and s.MusteriID=m.MusteriID and s.SatisID=sd.SatisID and sd.UrunID=u.UrunID group by p.Adi,p.SoyAdi,m.MusteriAdi,m.SirketAdi,u.UrunAdi order by p.Adi

--secili personelin secili müşteriye yaptığı satışlar
select *from Satislar s where  s.MusteriID 
in (select m.MusteriID from Musteriler m where m.MusteriAdi='Alejandra Camino')
and s.PersonelID in (select p.PersonelID from Personeller p where p.Adi='Andrew')

 select count(*)from [Satis Detaylari]

 --join yapısı
/*join:aralarında ilişki bulunan tabloların birbirleri ile bağlantısını kurarak
tek sorguda tek tablo çıktısı vermeyi sağlayan yapıdır.
3 e ayrılır
inner join,outer join,cross join*/
--inner join ilişkili tablolarda null olmayan kayıtları listeler
select *from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID
select *from Urunler

select *from Urunler u inner join Tedarikciler t
on u.TedarikciID=t.TedarikciID
--join ve inner join aynıdır
--Urunler kategoriler ve tedarikçileri birleştirin
select *from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID inner join Tedarikciler t on u.TedarikciID=t.TedarikciID

--personel satış ve müşterileri bağlama
select *from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID inner join Musteriler m on s.MusteriID=m.MusteriID where p.Adi like 'robert'
--hangi personel hangi üründen toplam kaç dolarlık satış yaptığını ekrana
--yaz (personel urunler satis detayları)
select p.Adi,u.UrunAdi,avg(sd.BirimFiyati) UrununBirimFiyati ,sum(sd.Miktar) UrunSatisAdedi,sum(sd.BirimFiyati*sd.Miktar*(1-sd.İndirim)) ToplamYapilanSatis from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID inner join [Satis Detaylari] sd on s.SatisID=sd.SatisID inner join Urunler u on sd.UrunID=u.UrunID group by p.Adi,u.UrunAdi order by p.Adi --order by 1
--avg yerine birim fiyatı group by kısmına yazılabilir
/*
outer join
3 çeşit outer join vardır
left outer join: ilk yazılan soldaki tablo dur. sol tablodaki tüm tablolar gelir 
sağ tabloda sol tarfla ilişkili tüm tablolar gelir null olsa bile
Right outer join:
Full outer join
*/
--right join left join farkı
select *from Kategoriler k inner join Urunler u on k.KategoriID=u.KategoriID
select *from Kategoriler k left join Urunler u on k.KategoriID=u.KategoriID
select *from Urunler u right join Kategoriler k on u.KategoriID=k.KategoriID--ürünü olmayan kategorilerde gelir
select *from Urunler u left join Kategoriler k on u.KategoriID=k.KategoriID--kategorisi olmayan ürünlerde gelir
select *from Kategoriler k right join Urunler u on k.KategoriID=u.KategoriID

--right outer join: right tablo ilk yazılan tablodur sağ tablodaki tüm kayıtlar gelir 
--null olsa bile sol tablodanb sağ tablonun ilişkili kayıtları getirilir
--(sağ tablo + sol un sağla ilişkili olan kısmı)
--kategorileri olmayan ürünler ile birlikte ürünleri getiriniz
select * from Urunler u left join Kategoriler k on u.KategoriID=k.KategoriID
select * from Kategoriler k right join Urunler u on k.KategoriID=u.KategoriID
--full outer join:
--hem sağdaki hem soldaki tablodan null kayıtlar dahil tüm kayıtları getirir
--right ve left joinin birleşimi
select * from Urunler u full join Kategoriler k on u.KategoriID=k.KategoriID order by u.UrunID

select *from Kategoriler k left join Urunler u on k.KategoriID=u.KategoriID
select *from Urunler u right join Kategoriler k on u.KategoriID=k.KategoriID--ürünü olmayan kategorilerde gelir

--adı nancy olan personelin yaptığı satışları listeleyin
select *from Satislar s where s.PersonelID=(select p.PersonelID from Personeller p where p.Adi='nancy')

--hiç satış yapılmayan müşterileri ekrana yazdırın //left join sağdaki null olanlarıda getirir
select *from Musteriler m left join Satislar s on m.MusteriID=s.MusteriID
where s.SatisID is null

 select *from Musteriler m inner join Satislar s on m.MusteriID=s.MusteriID

 insert into Nakliyeciler(SirketAdi) values('Aras Kargo')

--hiç nakliye yapmayan nakliyecileri listele
select *from Nakliyeciler n left join  Satislar s on n.NakliyeciID=s.ShipVia  
where s.SatisID is null

--inner join kullanarak personeller ile ürünler table ını birleştirin
select *from Personeller p join Satislar s on p.PersonelID=s.PersonelID join [Satis Detaylari] sd on s.SatisID=sd.SatisID
join Urunler u on sd.UrunID=u.UrunID

--cross join yazılan tablolardaki tüm kayıtları  birbiriyle kartezyen çarparak
--birbiriyle ilişkilendirir
select *from Urunler,Kategoriler--1360
select *from Urunler cross join Kategoriler--1360 --null değerlerde içersinde dahil
select *from  Urunler cross join Personeller cross join Tedarikciler--22.185
select *from Urunler,Personeller,Tedarikciler--22.185

--kümeleme fonksiyonları
--birleştirme(union) kesişim(intersect) ve fark(except) olmak üzere 3'e ayrılır
--farklı iki sorgu üzerine kümeleme fonksiyonları uygulanırsa 
-- **istenen verilerin kolon sayısı ve tipleri aynı olmak zorundadır
--Union
--Union ile müşteri ve tedarikçileri listeleyen sorgu
select SirketAdi from Tedarikciler
union
select SirketAdi from Musteriler
intersect
select SirketAdi from Tedarikciler
intersect
select SirketAdi from Tedarikciler

select SirketAdi from Musteriler
except
select SirketAdi from Tedarikciler

select SirketAdi from Tedarikciler
except
select SirketAdi from Musteriler

--Personellerin hiç satışını yapmadığı ürünleri listeleyiniz
select p.Adi,u.UrunAdi from Urunler u cross join Personeller p
except
select p.Adi,u.UrunAdi from Personeller p left join Satislar s on p.PersonelID=s.PersonelID
left join [Satis Detaylari] sd on s.SatisID=sd.SatisID
left join Urunler u on sd.UrunID=u.UrunID

--hangi tedarikçi hangi ürünü hiç tedarik etmemiştir

select t.SirketAdi,u.UrunAdi from Tedarikciler t cross join Urunler u
except
select t.SirketAdi,u.UrunAdi from Tedarikciler t left join Urunler u
on t.TedarikciID=u.UrunID

--hangi ürün hangi müşteriye hiç satılmamıştır
select m.MusteriAdi,m.SirketAdi,u.UrunAdi from Urunler u cross join Musteriler m
except
select m.MusteriAdi,m.SirketAdi,u.UrunAdi from Musteriler m 
left join Satislar s on m.MusteriID=s.MusteriID
left join [Satis Detaylari] sd on s.SatisID=sd.SatisID
left join Urunler u on sd.UrunID=u.UrunID order by m.MusteriAdi 

select * from  [Satis Detaylari] where UrunID=14

--Having kullanımı
--personellerin toplam satışı 5000 liranın üstünde olan ürünlerin listesini yapınız.
select p.Adi,u.UrunAdi,sum(sd.BirimFiyati*sd.Miktar*(1-sd.İndirim)) from Personeller p
left join Satislar s on p.PersonelID=s.PersonelID
left join [Satis Detaylari] sd on s.SatisID=sd.SatisID
left join Urunler u on sd.UrunID=u.UrunID
group by p.Adi,u.UrunAdi
having sum(sd.BirimFiyati*sd.Miktar*(1-sd.İndirim))>5000
--kullanılır
--select
--Insert bir tabloya kayıt eklemeyi sağlayan komut
--Yazımı: Insert [into] Tablo tabloAdi(kolon1,kolon2,kolon3)
--values(deger,deger,deger)

--Urunler tablosuna elma ekleyin
insert into Urunler (UrunAdi,BirimFiyati,HedefStokDuzeyi) values ('elma',2.30,5)
select *from Urunler
--Kategoriler tablosuna arabaları ekleyin
insert into Kategoriler(KategoriAdi) values('arabalar')
--arabalar kategorisine tanım ekleyin
update Kategoriler set Tanimi='spor araba' where Kategoriler.KategoriAdi='arabalar'
--personel tablosuna kendinizi ekleyin
insert into Personeller(Adi,SoyAdi,Sehir,IseBaslamaTarihi) values('ilker','şenel','istanbul',2021-05-18)

select *from Personeller p where p.Adi='ilker' 
delete Personeller where Personeller.Adi='ilker'

--Update komutu belli kayıtları güncellemeyi sağlayan komuttur
--Yazımı update tabloadı set kolon=değer,kolon=değer,.. where
begin tran--hatalı işlemler için geri dönüş alanı yaratır
update Urunler set BirimFiyati=15
rollback tran-- hatalı işlemlerden geri dönüş yapılmasını sağlar
select *from Urunler








