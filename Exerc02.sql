use ContosoRetailDW

--1)
SELECT TOP (100) *
FROM FactSales 

ORDER BY SalesAmount ASC

--2)
SELECT TOP (10) *
FROM DimProduct

ORDER BY UnitPrice DESC, Weight DESC, Size DESC --outra forma seria pela data da venda

--3)
--a), b)
SELECT 
	ProductName AS 'Nome do Produto',
	Weight AS 'Peso'

FROM DimProduct
WHERE Weight > 220 


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
WHERE StoreType = 'Store' AND CloseDate IS NULL 

--Há 287 lojas ativas

--5)
SELECT 
	ProductKey,
	ProductName,
	BrandName,
	AvailableForSaleDate
	
FROM DimProduct 

WHERE BrandName = 'Litware' AND AvailableForSaleDate = '15/03/2009'

--6)
--a)	
SELECT 
	StoreKey,
	Status,
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
	--WHERE EmployeeCount BETWEEN 1 AND 20 Lojas que precisaram de 1 cafeteria
	--WHERE EmployeeCount BETWEEN 21 AND 50 Lojas que precisaram de 2 cafeteria
	WHERE EmployeeCount > 50--Lojas que precisaram de 3 cafeteria
	
--8)
SELECT
	ProductName,
	ProductDescription,
	ProductKey,
	UnitPrice

FROM DimProduct

WHERE ProductDescription LIKE '%LCD%'
ORDER BY UnitPrice ASC

--9)
SELECT 
	ProductName,
	BrandName,
	ColorName

FROM DimProduct

WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')

--10)
SELECT *
FROM DimProduct

WHERE Manufacturer = 'Contoso, Ltd' AND ColorName = 'Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice DESC
