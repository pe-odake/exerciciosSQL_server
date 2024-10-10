use ContosoRetailDW

--1)
--a)
SELECT 
	channelKey,
	COUNT(SalesQuantity) AS 'Quantidade Vendida'

FROM FactSales

GROUP BY channelKey

--b)
SELECT 
	StoreKey,
	SUM(SalesQuantity) AS 'Quant. Vendida',
	SUM(ReturnQuantity) AS 'Quant. Retornada'

FROM FactSales

GROUP BY StoreKey
ORDER By StoreKey ASC

--c) 
SELECT
	channelKey AS 'Chaave do Canal',
	SUM(SalesQuantity) AS 'Quant. Vendida'
	
FROM FactSales 
WHERE DateKey = '2007'
GROUP BY channelKey

--2)
--a), b)

SELECT TOP (10)
	ProductKey,
	COUNT(SalesQuantity) AS 'Quant. Vendida',
	SUM(SalesAmount) 'Valor Total Vendido'

FROM FactSales
GROUP BY ProductKey
--HAVING SUM(SalesAmount) > 5000000

ORDER BY SUM(SalesAmount) DESC

--3)
--a)

SELECT TOP (1)
	CustomerKey,
	SUM(SalesQuantity) AS 'Quant. de Compras'

FROM FactOnlineSales

GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC

--b)
SELECT TOP (3)
	ProductKey,
	SUM(SalesQuantity) AS 'Quant. Comprada'


FROM FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY ProductKey

ORDER BY SUM(SalesQuantity) DESC

--4)
--a)

SELECT 
	BrandName,
	COUNT(ProductKey) AS 'Número de Produtos por Marca' -- Pode-se para contar as colunas usar '*'
	
FROM DimProduct
GROUP BY BrandName

--b)
SELECT 
	ClassName,
	AVG(UnitPrice) AS 'Média por Classe'

FROM DimProduct
GROUP BY ClassName

--c)
SELECT 
	ColorName,
	SUM(Weight) AS 'Peso Total das Cores'

FROM DimProduct
GROUP BY ColorName

--5)

SELECT 
	StockTypeName,
	SUM(Weight)

FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY SUM(Weight) DESC

--6)

SELECT 
	BrandName,
	COUNT(DISTINCT ColorName) AS 'COres dos Produtos'

FROM DimProduct
GROUP BY BrandName
ORDER BY COUNT(DISTINCT ColorName) ASC
--Nenhuma marca possui todas as cores
	
--7)

SELECT 
	Gender,
	COUNT(CustomerKey) AS 'ID do Cliente',
	AVG(YearlyIncome) AS 'Média do Cliente'

FROM DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender
	
--8)
	
SELECT 
	Education,
	COUNT(CustomerKey) AS 'Número de CLientes',
	AVG(YearlyIncome) AS 'Média Salarial'

FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education
ORDER BY COUNT(CustomerKey) DESC

--9)

SELECT
	DepartmentName,
	COUNT(EmployeeKey)
	

FROM DimEmployee
WHERE EndDate IS NULL
GROUP BY DepartmentName
ORDER BY COUNT(EmployeeKey) DESC

--10)
SELECT 
	Title ,
	SUM(VacationHours)

FROM DimEmployee
WHERE EndDate IS NULL AND
Gender ='F' AND DepartmentName IN('Production','Marketing','Engineering','Finance') AND
HireDate BETWEEN ('1999/01/01') AND ('2000/12/31')
GROUP BY Title;
