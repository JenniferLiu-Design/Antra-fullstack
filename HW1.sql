SELECT productid,Name,Color,ListPrice FROM [Production].[Product]

SELECT productid,Name,Color,ListPrice FROM [Production].[Product] 
WHERE ListPrice <> 0

SELECT productid,Name,Color,ListPrice FROM [Production].[Product]  
WHERE color = null

SELECT productid,Name,Color,ListPrice FROM [Production].[Product] 
WHERE color = not null

SELECT productid,Name,Color,ListPrice FROM [Production].[Product] 
WHERE color = not null and ListPrice > 0

SELECT Name+':'+color FROM production.Product 
WHERE color != null

SELECT productid,Name FROM [Production].[Product] 
WHERE productid <> 400 and 500

SELECT productid,Name,Color FROM [Production].[Product] 
WHERE color in ('Black','Blue')

SELECT productid,Name,Color,ListPrice FROM [Production].[Product] 
WHERE name like 'S%' 

SELECT Name,ListPrice FROM [Production].[Product] order by name

SELECT Name,ListPrice FROM Production.Product 
WHERE Name like 'S%' or Name like 'A%' 

SELECT [Name], ListPrice 
FROM Production.Product
WHERE [Name] LIKE 'spo[^k]%'
ORDER BY [Name]

SELECT DISTINCT Color from Production.Product 
ORDER BY Color desc

SELECT distinct ProductSubcategoryID, Color 
FROM Production.Product 
WHERE Color is not null and ProductSubcategoryID is not null
ORDER BY ProductSubcategoryID,Color

SELECT ProductSubcategoryID,LEFT([NAME],35) AS [NAME],color,ListPrice FROM Production.Product
WHERE ListPrice between 1000 and 2000 or ( ProductSubcategoryID = 1 and Color in ('Red','Black'))
ORDER BY ProductID

