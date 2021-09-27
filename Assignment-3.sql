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

SELECT city FROM customers
EXCEPT SELECT 