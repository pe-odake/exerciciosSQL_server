use ContosoRetailDW

--1)
SELECT 
	COUNT(SalesQuantity),
	COUNT(ReturnQuantity)
FROM FactSales

--2)
SELECT 
AVG(YearlyIncome)
FROM DimCustomer

WHERE Occupation = 'Professional'

--3)
--a)
SELECT 
	MAX(EmployeeCount) AS 'Maior N�mero de Funcin�rios'
FROM DimStore

--b)
SELECT TOP (1) StoreName AS 'Nome da Loja com mais Funcion�rios'
FROM DimStore
ORDER BY StoreName DESC

--c)
SELECT 
	MIN(EmployeeCount) AS 'Menor N�mero de Funcin�rios'
FROM DimStore

--d)
SELECT TOP (1) StoreName AS 'Nome da Loja com menos Funcion�rios'
FROM DimStore
ORDER BY StoreName ASC

--4)
--a), b)
SELECT
COUNT (EmployeeKey)
FROM DimEmployee
WHERE Gender = 'F' AND EndDate IS NULL --A empresa possui 84 funcionarias mulheres 
 
SELECT
COUNT (EmployeeKey)
FROM DimEmployee
WHERE Gender = 'M' AND EndDate IS NULL--A empresa possui 203 funcionarias mulheres

SELECT TOP (1)
	FirstName,
	LastName,
	EmailAddress,
	StartDate

FROM DimEmployee

WHERE Gender = 'F' AND EndDate IS NULL
ORDER BY StartDate ASC

SELECT TOP (1)
	FirstName,
	LastName,
	EmailAddress,
	StartDate

FROM DimEmployee

WHERE Gender = 'M' AND EndDate IS NULL
ORDER BY StartDate ASC

--5)
SELECT 
COUNT(DISTINCT ColorName) AS 'Quantidade de Cores',
COUNT(DISTINCT BrandName) AS 'Quantidade de Marcas',
COUNT(DISTINCT ClassName) AS 'Quantidade de Classes de Produto'

FROM DimProduct