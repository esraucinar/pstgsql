--PAIR-1 SQL QUERY 
select * from products
order by unit_price DESC
--1. Product isimlerini (ProductName) ve birim başına miktar (QuantityPerUnit) değerlerini almak için sorgu yazın.

select product_name, quantity_per_unit from products;

--2. Ürün Numaralarını (ProductID) ve Product isimlerini (ProductName) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (Discontinued) filtreleyiniz.

select product_id, product_name from products
where discontinued = 0;


--3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (ProductID, ProductName) değerleriyle almak için bir sorgu yazın.

select product_id, product_name from products
where discontinued = 1;


--4. Ürünlerin maliyeti 20'dan az olan Ürün listesini (ProductID, ProductName, UnitPrice) almak için bir sorgu yazın.

select product_id, product_name, unit_price from products
where unit_price < 20 

--5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (ProductID, ProductName, UnitPrice) almak için bir sorgu yazın.
select product_id, product_name, unit_price from products
where unit_price <25 AND unit_price >15

--6. Ürün listesinin (ProductName, UnitsOnOrder, UnitsInStock) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.

select product_name, units_on_order, units_in_stock from products
where units_in_stock < units_on_order

--7. İsmi a ile başlayan ürünleri listeleyeniz.
select product_name from products
where LOWER(product_name) LIKE 'a%'



--8. İsmi i ile biten ürünleri listeleyeniz.
select product_name from products
where LOWER(product_name) LIKE '%i'



--9. Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.

select product_name, unit_price , (unit_price * 1.18 ) as birim_fiyat from products


--10. Fiyatı 30 dan büyük kaç ürün var?
select COUNT(*) from products
where unit_price > 30


--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
select LOWER(product_name), unit_price from products
ORDER BY unit_price DESC

--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır
SELECT * from employees
select first_name, last_name from employees

--13. Region alanı NULL olan kaç tedarikçim var?
Select COUNT(*) from suppliers where region is null


--14. a.Null olmayanlar?
Select COUNT(*) from suppliers where region is not null


--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
select CONCAT('TR', UPPER(product_name)) from products

--16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
select CONCAT('TR', product_name) AS new_name, unit_price from products
where unit_price < 20

--17. En pahalı ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.
Select product_name, unit_price from products
where unit_price = (Select MAX(unit_price) from products)


--18. En pahalı on ürünün Ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.
Select product_name, unit_price from products
ORDER BY unit_price DESC LIMIT 10

--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.
Select product_name, unit_price from products
where unit_price > (Select AVG(unit_price) from products)
ORDER BY unit_price


--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
select SUM(unit_price * units_in_stock) from products

--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
select COUNT (*) from products
where units_in_stock > 0 AND discontinued = 1

--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
select p.product_name,c.category_name  from products 
AS p INNER JOIN categories AS c ON c.category_id = p.category_id

--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
Select  category_id, AVG(unit_price) from products
GROUP BY category_id ORDER BY category_id


--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
Select p.product_name, c.category_name, unit_price from products
AS p INNER JOIN categories AS c ON c.category_id = p.category_id
where unit_price = (select MAX(unit_price) from products)

--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
select  product_name , category_name , company_name from products as p 
join categories as c on p.category_id = c.category_id 
join suppliers as s on p.supplier_id = s.supplier_id 
order by p.units_on_order desc LIMIT 1











