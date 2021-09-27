/*A set of rows/a table

Union all includes repeated values

Union, union all, intersect, minus

A union combines similar data types into one table, new rows. A join combines data in to new columns via relationships between tables.

Inner join returns values from both tables where the join value is not null. Full join returns values from both tables even though there may be null values.

Left join will return values from the left table where the join value is not null, but omit results where the join value is nulll on the right table. Full join is the same as outer join.

Cross join creates a paired combination of all values of two tables, creating a table by essentially multiplying the values by one another.

Yes */

----------------------------------------

SELECT COUNT(ProductID)
FROM Production.Product

SELECT COUNT(ProductSubcategoryID)
FROM Production.Product
WHERE P.ProductSubcategoryID != NULL

SELECT ProductSubcategoryID, COUNT(ProductID)
FROM Production.Product
WHERE P.ProductSubcategoryID != NULL

SELECT COUNT(ProductID)
FROM Production.Product AS P
WHERE P.ProductSubcategoryID != NULL

SELECT SUM(Quantity)
FROM Production.ProductInventory

SELECT ProductID, SUM(Quantity)
FROM Production.ProductInventory
WHERE LocationID =40
GROUP BY ProductID
HAVING SUM(Quantity) < 100

SELECT Shelf, ProductID, SUM(Quantity)
FROM Production.ProductInventory
WHERE LocationID =40
GROUP BY ProductID, Shelf
HAVING SUM(Quantity) < 100

SELECT ProductID, AVG(Quantity)
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID

SELECT ProductID, Shelf, AVG(Quantity)
FROM Production.ProductInventory
GROUP BY ProductID, Shelf

SELECT ProductID, Shelf, AVG(Quantity)
FROM Production.ProductInventory
WHERE Shelf <> 'N/A'
GROUP BY ProductID, Shelf

SELECT Color, Class, Count(*) AS TheCount, AVG(ListPrice)
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

SELECT DISTINCT c.CustomerID, c.CompanyName, c.ContactName 
FROM Orders o INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
WHERE OrderDate > '1998-1-1'

SELECT c.ContactName, MAX(o.OrderDate)
FROM Customers c LEFT JOIN Orders o ON c.CustomerId = o.CustomerId
GROUP BY c.ContactName

SELECT c.ContactName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c LEFT JOIN Orders o ON c.CustomerId = o.CustomerId
GROUP BY c.ContactName

SELECT c.CustomerID, c.CompanyName, c.ContactName, 
SUM(od.Quantity) 
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID LEFT JOIN Order Details od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName
ORDER BY QTY

