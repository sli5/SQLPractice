

/*Store Details */

SELECT WarehouseID , WarehouseID, OrderID, WarehouseAddress, WarehouseState, WarehouseZipCode
FROM Warehouse1;


/*Supplier Details */

SELECT supplierID ,ProductID , supplierName,  SupplierAddress,SupplierZipCode, SupplierCity 
FROM Suppliers1 ; 


/*Shipment Details */

SELECT  ShipmentID, OrderID , WarehouseID, SupplierID, ShipmentCost, ShipmentLocation, ShipmentDate, ReceiveDate 
FROM Shipment1 ; 


/*employee Details */

SELECT employeeID , EmployeeID,EmployeeFirstname,EmployeeLastname,EmployeePosition, WarehouseID
FROM Employee1 ; 


/*product details */

SELECT ProductID,ProductName,ProductCost,Manufacturer,CategoryName,ProductPrice 
FROM Product1; 


/*customer Details */

SELECT CustomerID,CustomerLastName,CustomerFirstName,CustomerEmail,PaymentID,CustomerShippingAddress,CustomerBillingAddress
FROM Customer1 ; 


/*Payment Details */

SELECT paymentID , cardType, CardCompany , CardNumber , securityCode 
FROM Payment1 ; 



/*Order Details */

SELECT OrderID,ShippedDate,DeliverDate,OrderDate,CustomerID,PaymentID,ProductID,OrderType,Quantity,TotalDue
From Orders1; 
 

/*aggregate querry */


SELECT OrderDate, SUM(TotalDue) as 'Revenue'
FROM Orders1 
GROUP BY OrderDate
ORDER BY OrderDate;

/*joining 2 tables to see see the customer and their respective credit card details  */

Select C.CustomerLastName , C.CustomerFirstName , C.CustomerEmail , P.CardCompany , P.CardNumber 
From Customer1 as C INNER JOIN Payment1 as P ON C.PaymentID = P.PaymentID 


/* This shows the the details of all the customers and their respective order ID and Orderdate(IF ANY). Left outerjoin is neccessary as every customer does not have a paymentID / Order . Some customer might merely be registered with us but haven't placed any orders . Therefore left outer join would show all the customer details regardless if they have placed an order or not*/

select c.CustomerID , c.CustomerLastName , c.CustomerFirstName , c.CustomerEmail , p.Order_ID , p.Order_Date
from Customer1 as C Left OUTER JOIN ORDERS AS P 
on c.PaymentID = p.Payment_ID ;

/*showing orders that have more product quantity than the average quantity of all the orders */

SELECT OrderID, TotalDue , OrderDate , Quantity
FROM Orders1
WHERE quantity > 
(SELECT AVG(quantity)
FROM Orders1)
ORDER BY quantity;
