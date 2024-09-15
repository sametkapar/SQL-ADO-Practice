--En çok satýlan 5 ürün isimleri ile listeleme

SELECT TOP(5) P.ProductID, P.ProductName, SUM(OD.Quantity) AS ToplamSatýþ
FROM [Order Details] AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY SUM(OD.Quantity) DESC

--Personellerin kazandýrdýklarý satýþ tutarlarý

SELECT E.EmployeeID, E.FirstName +' '+E.LastName AS Çalýþan, SUM(OD.UnitPrice*Od.Quantity) AS ToplamSatýþ, SUM(P.UnitPrice*Od.Quantity) AS Ýndirimsiz
FROM Orders AS O
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON Od.ProductID = P.ProductID
GROUP BY E.EmployeeID, E.FirstName +' '+E.LastName 
ORDER BY SUM(OD.UnitPrice*Od.Quantity) DESC

--Müþterilerin aldýklarý toplam ürün fiyatlarý

SELECT C.CompanyName, C.ContactName, SUM(OD.UnitPrice*OD.Quantity) AS [Toplam alýþ]
FROM Orders AS O
JOIN Customers AS C ON C.CustomerID = O.CustomerID
JOIN [Order Details] AS OD ON OD.OrderID =O.OrderID
GROUP BY C.CompanyName, C.ContactName
ORDER BY SUM(OD.UnitPrice*OD.Quantity) DESC
