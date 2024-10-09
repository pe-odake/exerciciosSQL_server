use ContosoRetailDW

--1)
SELECT 
	SUM(SalesQuantity) AS 'Quant. Venda',
	SUM(ReturnQuantity) AS 'Quant. Devolvida'
FROM FactSales

WHERE channelKey = 1
	
--2)
SELECT 
AVG(YearlyIncome) AS 'Média do Salario'
FROM DimCustomer

WHERE Occupation = 'Professional'

--3)
--a), b)
SELECT 
	MAX(EmployeeCount) AS 'Maior Número de Funcinários',
	MIN(EmployeeCount) AS 'Menor Número de Funcinários'
FROM DimStore

--c)
SELECT TOP (1)
	StoreName AS 'Nome da Loja com mais Funcionários',
	EmployeeCount
FROM DimStore

ORDER BY EmployeeCount DESC 

--d)
SELECT TOP (1)
	StoreName AS 'Nome da Loja com menos Funcionários',
	EmployeeCount
FROM DimStore

WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC

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
