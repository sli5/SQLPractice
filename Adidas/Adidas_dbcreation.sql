
USE Adidas;
GO
 
-- Create tables --
CREATE TABLE Suppliers1(
  SupplierID bigint NOT NULL PRIMARY KEY,
  ProductID bigint NOT NULL,
  SupplierName varchar(200) NOT NULL,
  SupplierAddress varchar(200) NOT NULL,
  SupplierZipCode varchar(200) NOT NULL,
  SupplierCity varchar(200) NOT NULL);
 
CREATE TABLE Product1(
  ProductID bigint PRIMARY KEY,
  ProductName varchar(200),
  ProductCost varchar(200),
  Manufacturer varchar(200),
  CategoryName varchar (200),
  ProductPrice varchar (200);
 
CREATE TABLE Orders1(
  OrderID bigint NOT NULL PRIMARY KEY,
  ShippedDate varchar(200) NOT NULL,
  DeliverDate varchar (200) NOT NULL,
  OrderDate varchar (200) NOT NULL,
  CustomerID bigint NOT NULL,
  PaymentID bigint NOT NULL,
  ProductID bigint NOT NULL,
  OrderType varchar(200) NOT NULL,
  Quantity bigint NOT NULL,
  TotalDue bigint NOT NULL);
 
CREATE TABLE Payment1(
  PaymentID bigint NOT NULL PRIMARY KEY,
  CardCompany varchar (200) NOT NULL,
  CardNumber varchar(200) NOT NULL,
  SecurityCode varchar(200) NOT NULL,
  CardType varchar(200) NOT NULL);
 
CREATE TABLE Warehouse1(
  WarehouseID bigint NOT NULL PRIMARY KEY,
  OrderID varchar(200) NOT NULL,
  WarehouseAddress varchar(200) NOT NULL,
  WarehouseState varchar(200) NOT NULL,
  WarehouseZipCode varchar(200) NOT NULL);
 
 
CREATE TABLE Employee1(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  EmployeeFirstname varchar(200) NOT NULL,
  EmployeeLastname varchar(200) NOT NULL,
  EmployeePosition varchar(200) NOT NULL,
  WarehouseID bigint NOT NULL);
 
CREATE TABLE Shipment1(
  ShipmentID bigint NOT NULL PRIMARY KEY,
  OrderID bigint NOT NULL,
  WarehouseID bigint NOT NULL,
  SupplierID bigint NOT NULL,
  ShipmentCost bigint NOT NULL,
  ShipmentLocation varchar(200) NOT NULL,
  ShipmentDate varchar(200) NOT NULL,
  ReceiveDate varchar (200) NOT NULL);
 
CREATE TABLE Customer1(
  CustomerID bigint NOT NULL PRIMARY KEY,
  CustomerLastName varchar(200) NOT NULL,
  CustomerFirstName varchar(200) NOT NULL,
  CustomerEmail varchar(200) NOT NULL,
  PaymentID bigint NOT NULL,
 CustomerShippingAddress varchar(200) NOT NULL,
 CustomerBillingAddress varchar(200) NOT NULL);

 ALTER TABLE Supplier ADD CONSTRAINT FKSupplierProduct
 FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
  GO

 ALTER TABLE Employee ADD CONSTRAINT FKEmployeeWarehouse
  FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
  GO

 ALTER TABLE Shipment ADD CONSTRAINT FKShipmentWarehouse
  FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
  GO

ALTER TABLE Shipment ADD CONSTRAINT FKShipmentSupplier
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
  GO

ALTER TABLE Shipment ADD CONSTRAINT FKShipmentOrder
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
  GO

ALTER TABLE Orders ADD CONSTRAINT FKOrderCustomer
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
  GO

ALTER TABLE Orders ADD CONSTRAINT FKOrderPayment
  FOREIGN KEY (PaymentID) REFERENCES Payment(Payment_ID)
  GO

ALTER TABLE Orders ADD CONSTRAINT FKOrderProduct
  FOREIGN KEY (ProductID) REFERENCES Product(Product_ID)
  GO

ALTER TABLE Customer ADD CONSTRAINT FKCustomerPayment
  FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
  GO

ALTER TABLE Warehouse ADD CONSTRAINT FK_Warehouse_Order
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
  GO

 
--Populate Database--
INSERT INTO Product1 (ProductID,ProductName,ProductCost,Manufacturer,CategoryName,ProductPrice) VALUES
(123, 'Stan Smith','79','winston','Sneaker','59'),
(456, 'Legacy','79','winston','Sneaker','79'),
(789, 'Boost','79','winston','Sneaker','119'),
(234, 'Boost','79','winston','Sneaker','98'),
(567, 'Gazelle','79','winston','Sneaker','89'),
(987, 'Superstar Foundation','79','Winston','Sneaker','100'),
(543, 'Superstar','79','winston','Sneaker','350'),
(659, 'NMD','79','winston','Sneaker','532'),
(149, 'Cleat1','79','winston','Sneaker','232'),
(294, 'Hypersport','79','winston','Sneaker','121');

 
INSERT INTO Suppliers1(SupplierID,ProductID,SupplierName,SupplierAddress,SupplierZipcode,SupplierCity) VALUES
(1, 123,'Jason Corporation','9818 Brewery Ave', '02341','Southern'),
(2, 456,'TY Corporation','8019 Wild Horse St.', '02341', 'Northeastern'),
(3, 789,'Stacy Supply','802 North Sutor Ave','02341', 'Northeastern'),
(4, 234,'Brads Boxes','536 Vernon Ave', '02341','Southern'),
(5, 567,'Opaque Camel Wholesale', 'Peachtree','02341', 'Western'),
(6, 987,'Smallbox Wholesale Company', 'Valdosta', '02341','Southern'),
(7, 543,'White Camel Wholesale','7212 E. Shirley Ave', '02341', 'Southern'),
(8, 659,'The Piping Glass Wholesale Corps.','5 Paris Hill','02341', 'Midwestern'),
(9, 149,'Babson Beaver Wholesale Company','579 Lawrence Drive', '02341','Southern'),
(10, 294,'Beta Badger Wholesale','480 Sherman Drive', '02341', 'Eastern');

INSERT INTO ORDERS1(OrderID,ShippedDate,DeliverDate,OrderDate,CustomerID,PaymentID,ProductID,OrderType,Quantity,TotalDue) VALUES
(20,'June 17 2016','June 20 2016','June 15 2016','10','123','122','Online','1','99'),
(21,'January 1 2015','January 2 2015','Jan 1 2016','10','124','123','Online','3','120'),
(22,'February 24 2016','February 22 2016','February 23,2016','10','123','124','Online','1','99'),
(23,'February 28 2016','March 3 2016','February 26 2016','13','1243','343','Online','3','125'),
(24,'April 21 2015','April 24 2015','April 19 2015','14','232','2302','Online','2','124'),
(25,'March 3 2016','March 5 2016','February 28 2016','15','2321','231','Online','5','126'),
(26,'June 5 2016','June 8 2016','June 3 2016','16','121','232','Online','2','125'),
(27,'July 4 2016','July 7 2016','July 2 2016','17','124','109','Online','19','123'),
(28,'March 3 2014','March 5 2014','February 28 2014','18','1091','099','Online','73','196'),
(29,'November 1 2016','November 3 2016','October 29 2016','25','100','1211','Online','1500','180');
  
INSERT INTO Payment1(PaymentID,CardCompany,CardNumber, SecurityCode, CardType) VALUES
(40,'Visa','76435','142','Credit Card'),
(41,'Mastercard','137434','231','Credit Card'),
(42,'Discover','3366744','235','Credit Card'),
(43,'Amex','623465','336','Credit Card'),
(44,'Amex','123423','448','Credit Card'),
(45,'Visa', '134694','551','Debit Card'),
(46,'Discover','22646','984','Credit Card'),
(47,'Mastercard','182354','923','Credit Card'),
(48,'Amex','72529','239','Credit Card'),
(49,'Visa','83349','904','Debit Card');
 
INSERT INTO Warehouse1(WarehouseID,OrderID,WarehouseAddress,WarehouseState,WarehouseZipCode) VALUES
(60,'481','82 East Glenlake St', 'CA','12341'),
(61,'202','2 Staple Road', 'CA','`12342'),
(62,'534','754 College Rd', 'MN','12343'),
(63,'125','9550 East Minster Avenue','TX','12344'),
(64,'21','847 Olive St.','FL','12345'),
(65,'92','507 Old Ave.','MA','12346'),
(66,'32','6 Faker St.','IL','12347'),
(67,'43','86 Marconi Street', 'TN','12348'),
(68,'79','8692 West Fairfield Ave','VA','12349'),
(69,'500','73 Low Point St.','VA','12315');
 
INSERT INTO Employee1(EmployeeID,EmployeeFirstname,EmployeeLastname,EmployeePosition, WarehouseID) VALUES
(70,'Jon','Baker','Manager','202'),
(71,'Jonny','Walker','salesperson','481'),
(72,'Lenny','Appleseed','Manager','481'),
(73,'Kit','Jin','Janitor','125'),
(74,'Veo','Chae','Cashier','64'),
(75,'Jenny','Smith','Stocker','65'),
(76,'Stella','Mince','Bagger','66'),
(77,'Amy','Bliss','Manager','68'),
(78,'George','Cruiz','Cashier','68'),
(79,'Kerry','Heeley','Stocker','68');
 
INSERT INTO Shipment1(ShipmentID,OrderID,WarehouseID,SupplierID,ShipmentCost,ShipmentLocation,ShipmentDate, ReceiveDate) VALUES
(50,20,61,1,9.99,'MA','01/2016','01/2016'),
(51,21,62,2,24.99,'MA','03/2016','02/2016'),
(52,22,63,3,5.95,'MA','03/2016','03/2016'),
(53,23,64,4,9.99,'CA','04/2016','05/2016'),
(54,24,65,5,5.95,'VA','05/2016','06/2016'),
(55,25,66,6,24.99,'CA','05/2016','06/2016'),
(56,26,67,7,9.99,'AZ','02/2016','02/2016'),
(57,27,68,8,5.99,'VT','03/2016','03/2016'),
(58,28,69,9,9.99,'TX','04/2016','05/2016'),
(59,29,60,10,5.99,'CA','02/2016','02/2016');
 
 
INSERT INTO Customer1(CustomerID,CustomerLastName,CustomerFirstName,CustomerEmail,PaymentID,CustomerShippingAddress,CustomerBillingAddress) VALUES
(570,'Jo','Baker','Manager@hotmail.com','40','Honolulu','121 Park St'),
(571,'Jonn','Walker','salesperson@hotmail.com','41','Honolulu','120 Park St'),
(572,'Lenn','Appleseed','Manager@hotmail.com','42','Honolulu','122 Park St'),
(573,'Ki','Jin','Janitor@hotmail.com','43','Honolulu','123 Park St'),
(574,'Ve','Chae','Cashier@hotmail.com','44','Honolulu','125 Park St'),
(575,'Jenn','Smith','Stocker@hotmail.com','45','Honolulu','126 Park St'),
(576,'Stell','Mince','Bagger@hotmail.com','46','Honolulu','127 Park St'),
(577,'Am','Bliss','Manager@hotmail.com','47','Honolulu','128 Park St'),
(578,'Georg','Cruiz','Cashier@hotmail.com','48','Honolulu','129 Park St'),
(579,'Kerr','Heeley','Stocker@hotmail.com','49','Honolulu','130 Park St');
