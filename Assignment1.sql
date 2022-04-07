CREATE DATABASE SQLAssignment
use SQLAssignment
/Customer Table/

CREATE TABLE Customer(
CustomerId int PRIMARY KEY,
FirstName nvarchar(40),
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(40),);

--Index for customer name
CREATE INDEX IndexOrderCustomerId;
ON Customer(FirstName,LastName);

--insert data into customer table

INSERT INTO dbo.Customer(CustomerId,FirstName,LastName,City,Country,Phone)
VALUES (1,'Reetu','KUMAR','DELHI','INDIA','9123456738'),
(2,'RAHUL','PAL','MUMBAI','INDIA','9875432678'),
(3,'RISHABH','JAIN','PUNE','INDIA','8765435678'),
(4,'RIA','SINGH','BANGALORE','INDIA','8734562314'),
(5,'ASHWINI','SINGH','MUMBAI','INDIA','8765765674');

INSERT INTO dbo.Customer(CustomerId,FirstName,LastName,City,Country,Phone)
VALUES (6,'RIA','SINGH','NEW YORK','USA','8764536765');
(7,'P','KASHI','DELHI','INDIA','8765437850');


--SELECT * FROM Customer
--use SQLAssignment

/OrderTable/

CREATE TABLE OrderTable(
OrderId int PRIMARY KEY,
OrderDate datetime,
OrderNumber nvarchar(40),
CustomerId int FOREIGN KEY REFERENCES Customer(CustomerId),
TotalAmount decimal(12,2));

--insert data into Order

INSERT INTO OrderTable(OrderId,OrderDate,OrderNumber,CustomerId,TotalAmount)
values (1,05-04-2022,101,1,100.00),
(2,01-04-2022,101,1,200.00),
(3,02-04-2022,101,1,100.00);

--create index 

CREATE INDEX IndexOrderCustomerId
ON OrderTable(CustomerId);
CREATE INDEX IndexOrderOrderDate
ON OrderTable(OrderDate);

/product table/
CREATE TABLE ProductTable(
ProductId int PRIMARY KEY,
ProductName nvarchar(50),
UnitPrice decimal(12,2),
Package nvarchar(30),
IsDiscontinued bit);

--create index 

CREATE INDEX IndexProductSupplierId
ON ProductTable(ProductId);
CREATE INDEX IndexProductName
ON ProductTable(ProductName);

--insert data into product

INSERT INTO ProductTable(ProductId,ProductName,UnitPrice,Package,IsDiscontinued)
VALUES (1,'SEAFOOD',100.00,'EXOTIC LIQIDS',0),
(2,'TOYS',100.00,'ABC PACKAGE',0),
(3,'SEAFOOD',100.00,'ATZ',0);

/Orderitemtable/
CREATE TABLE OrderItemTable(
OrderItemId int PRIMARY KEY,
OrderId int FOREIGN KEY REFERENCES OrderTable(OrderId),
ProductId int FOREIGN KEY REFERENCES ProductTable(ProductId),
UnitPrice decimal(12,2),
Quantity int);

--create index 

CREATE INDEX IndexOrderItemOrderId
ON OrderItemTable(OrderItemId);
CREATE INDEX IndexOrderItemProductId
ON OrderItemTable(ProductID);

--insert data into OrderItem

INSERT INTO OrderItemTable(OrderItemId,OrderId,ProductId,UnitPrice,Quantity)
VALUES(1,1,1,100.00,1),
(2,2,2,200.00,2),
(3,3,3,200.00,1),
(4,4,4,100.00,1);


2) Insert Into [dbo].[Order] Values(121, 01/03/2022,'E23768S',1,5000),
(122, 02/03/2022,'E4543768T',2,5600),
(123, 02/04/2023,'E23768Y',3,78000),
(124, 01/03/2024,'E24567S',4,65000),
(125, 06/03/2021,'TS543768T',5,7000),
(126, 02/04/2024,'E23768YT',6,98000),
(127, 02/03/2024,'E24567S',7,65000),
(128, 02/03/2022,'E4543768T',8,5600),
(129, 02/04/2023,'E23768Y',9,78000),
(130, 01/03/2024,'E24567S',10,65000);


Insert Into [dbo].[OrderItem] Values(210, 120,15123,5,23000),
(211, 121,1234,67,653400),
(212, 122,34324,554,43200),
(213, 123,1245,565,43200),
(214, 124,2423,513,3424),
(215, 125,12423,5234,32100),
(216, 126,3424342,5123,1344),
(217, 127,34242,1235,1123),
(218, 128,13431,4325,10430),
(219, 129,34324,2345,67000),
(220, 130,3535,3455,123100)

3) Alter customer firstname and OrderTable by adding not null

ALTER TABLE dbo.Customer
Alter Column FirstName nvarchar(40) Not NULL;

4) Alter customer OrderTable by adding not null DateTime

ALTER TABLE OrderTable
Alter Column OrderDate DateTime Not NULL;

5) Display Customer details

SELECT * FROM Customer;

6) DISPLAY COUNTER NAME STARTS WITH A OR I
SELECT Country FROM Customer
WHERE LastName like 'A%' or LastName like 'I%'

7) DISPLAY WHOSE NAME THIRD LETTER IS 'I'
SELECT Customer.FirstName,Customer.LastName
FROM dbo.Customer 
WHERE LastName LIKE '__I%';


