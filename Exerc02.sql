use ContosoRetailDW

--1)
SELECT TOP (100) *
FROM FactSales 

ORDER BY SalesAmount ASC

--2)
SELECT TOP (10) 
	ProductName,
	UnitPrice,
	Weight,
	Size

FROM DimProduct

ORDER BY UnitPrice DESC, Weight DESC, Size DESC

--3)
--a), b)
SELECT 
	ProductName AS 'Nome do Produto',
	Weight AS 'Peso'

FROM DimProduct
WHERE Weight > 100


--c)
ORDER BY Weight DESC

--4)
--a), b)
SELECT 
	StoreName AS 'Nome da Loja',
	OpenDate AS 'Data de Abertura',
	Closedate AS 'Data de Fechamento',
	EmployeeCount AS 'Número de Funcionários'

FROM DimStore
WHERE CloseDate IS NULL 

--Há 294 lojas ativas

--5)
SELECT 
	ProductKey,
	ProductName,
	Manufacturer,
	AvailableForSaleDate
	
FROM DimProduct 

WHERE Manufacturer = 'Litware, Inc.' AND AvailableForSaleDate = '15/03/2009'

--6)
--a)	
SELECT 
	Status,
	StoreKey,
--b)
	Closedate 

FROM DimStore

WHERE CloseDate IS NOT NULL
--O closeDate se refere a quando as lojas fecharam, portanto as lojas que não estão mais ativas

--7)
SELECT 
	StoreKey,
	StoreName,
	EmployeeCount

FROM DimStore
	WHERE EmployeeCount BETWEEN 1 AND 20 --Lojas que precisaram de 1 cafeteria
------------------------------------
SELECT 
	StoreKey,
	StoreName,
	EmployeeCount

FROM DimStore
	WHERE EmployeeCount BETWEEN 21 AND 50 --Lojas que precisaram de 2 cafeteria
------------------------------------
SELECT 
	StoreKey,
	StoreName,
	EmployeeCount

FROM DimStore
	WHERE EmployeeCount > 51--Lojas que precisaram de 3 cafeteria


--8)
SELECT
	ProductName,
	ProductKey,
	UnitPrice

FROM DimProduct

WHERE ProductName LIKE '%LCD%'
ORDER BY UnitPrice ASC

--9)
SELECT 
	ProductName,
	Manufacturer,
	ColorName

FROM DimProduct

WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND Manufacturer IN ('Contoso, Ltd', 'Litware, Inc.', 'Fabrikam, Inc.')

--10)
SELECT *
FROM DimProduct

WHERE Manufacturer = 'Contoso, Ltd' AND ColorName = 'Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice DESC