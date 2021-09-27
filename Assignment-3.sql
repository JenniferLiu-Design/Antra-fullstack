The answer depends. Joins typically have better performance, but subqueries make more logical sense and are easier to read by some. I'd personally typically default to using joins. 

CTEs stand for Common Table Expressions. They can be used within a select, insert, update, or delete statement. You can use CTEs for recursive queries. 

Table variables are local variables that store data temporarily. The lifecycle of the table variables starts in the declaration point and ends at the end of the batch. They are stored in tempdb. 

Truncate simply deallocates all the data pages used by the table. Delete logs each row and therefore allows rollback in case you need to undo your delete. Because of this, truncate has significantly better performance. 

If you choose to generate an identity column, it will automatically increment. Delete will not reset the value of the identity column but truncate will.

I feel like this was explained in the previous two answers.

---------------------

SELECT DISTINCT city FROM Customers WHERE city in (SELECT city FROM Employees)

SELECT DISTINCT city from Customers WHERE City Not in (SELECT DISTINCT city FROM Employees WHERE city != null)

SELECT ProductID, SUM(Quantity) as QuantityOrdered FROM [Order Details]
GROUP BY ProductID

SELECT City, SUM(Quantity) FROM Orders o JOIN [Order details] od on o.orderid join customers c ON c.customerid=o.customerID
GROUP BY city

select city from Customers
except
select city from customers
group by city
having COUNT(*)=1
union 
select city from customers
group by city
having COUNT(*)=0

select city from customers group by city having COUNT(*)>=2

select distinct city from orders o join [order details] od on o.orderid=od.orderid join customers c on c.customerid=o.CustomerID
group by city,ProductID
having COUNT(*)>=2

select distinct c.CustomerID from orders o join [order details] od on o.orderid=od.orderid join customers c on c.customerid=o.CustomerID
where City <> ShipCity

select top 5 ProductID,AVG(UnitPrice) as AvgPrice,(select top 1 City from Customers c join Orders o on o.CustomerID=c.CustomerID join [Order Details] od2 on od2.OrderID=o.OrderID where od2.ProductID=od1.ProductID group by city order by SUM(Quantity) desc) as City from [Order Details] od1
group by ProductID 
order by sum(Quantity) desc

select distinct City from Employees where city not in (select ShipCity from Orders where ShipCity is not null)

select distinct City from Employees where City is not null except (select ShipCity from Orders where ShipCity is not null)

select (select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,e.City
order by COUNT(*) desc) as MostOrderedCity,
(select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,e.City
order by sum(Quantity) desc) as MostQunatitySoldCity
