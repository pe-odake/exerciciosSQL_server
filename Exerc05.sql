use ContosoRetailDW

--1)

SELECT 
	ProductSubCategoryName,
	DimProductSubcategory.ProductSubcategoryKey

FROM DimProductSubCategory
INNER JOIN DimProduct
ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey

--2)

SELECT 
	ProductCategoryName,
	DimProductSubcategory.ProductCategoryKey

FROM DimProductCategory
LEFT JOIN DimProductSubcategory

ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey

--3)

SELECT 
	StoreKey, 
	StoreName,
	EmployeeCount,
	DimGeography.ContinentName,
	DimGeography.RegionCountryName

FROM DimStore
LEFT JOIN DimGeography

ON DimStore.GeographyKey = DimGeography.GeographyKey

--4)
--a)

SELECT
	DimProduct.ProductName AS 'Produto', 
	DimProduct.ClassName AS 'Classe do Produto',
	DimProductCategory.ProductCategoryDescription AS 'Categoria'
FROM
	DimProduct
LEFT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategorykey = DimProductSubcategory.ProductSubcategorykey
		LEFT JOIN DimProductCategory
			ON DimProduct.ProductSubcategorykey = DimProductSubcategory.ProductSubcategorykey

--5)
--a)
SELECT TOP(1000) *

FROM FactStrategyPlan

--b)
SELECT
	AccountName,
	FactStrategyPlan.AccountKey,
	FactStrategyPlan.StrategyPlanKey,
	FactStrategyPlan.DateKey,
	AccountName,
	FactStrategyPlan.Amount

FROM DimAccount
INNER JOIN FactStrategyPlan

ON FactStrategyPlan.AccountKey = DimAccount.AccountKey

--6)
SELECT 
	FactStrategyPlan.StrategyPlanKey,
	FactStrategyPlan.DateKey,
	DimScenario.ScenarioName,
	FactStrategyPlan.Amount

FROM DimScenario
INNER JOIN FactStrategyPlan

ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey

--7)
SELECT
	DimProductSubcategory.ProductSubcategoryName

FROM DimProductSubcategory
LEFT JOIN DimProduct

ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
WHERE DimProduct.ProductKey IS NULL

--8)
SELECT
	BrandName,
	DimChannel.ChannelName

FROM DimProduct
INNER JOIN FactSales
ON FactSales.ProductKey = DimProduct.Productkey
INNER JOIN DimChannel
ON DimChannel.ChannelKey = FactSales.ChannelKey
WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware')

--9)
SELECT
	FactSales.SalesKey,
	DimChannel.ChannelName,
	DimStore.StoreName,
	DimProduct.ProductName,
	FactSales.SalesAmount

FROM FactSales

INNER JOIN DimChannel
ON FactSales.channelKey = DimChannel.ChannelKey

INNER JOIN DimStore
ON FactSales.StoreKey = DimStore.StoreKey

INNER JOIN DimProduct
ON FactSales.ProductKey = DimProduct.ProductKey

ORDER BY FactSales.SalesAmount DESC

--10)
SELECT
	FactSales.SalesKey,
	DimChannel.ChannelName,
	DimStore.StoreName,
	DimProduct.ProductName,
	FactSales.SalesAmount

FROM FactSales

INNER JOIN DimChannel
ON FactSales.channelKey = DimChannel.ChannelKey
		
INNER JOIN DimStore
ON FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimProduct
ON FactSales.ProductKey = DimProduct.ProductKey

ORDER BY FactSales.SalesAmount DESC