use ContosoRetailDW

--1)
SELECT
	a.ProductSubcategoryName,
	a.ProductSubcategoryKey

FROM DimProductSubcategory AS a

INNER JOIN DimProduct AS b
ON a.ProductSubcategoryKey = b.ProductSubcategoryKey

--2)
SELECT
	b.ProductCategoryKey,
	ProductSubcategoryName,
	b.ProductCategoryName

FROM DimProductSubcategory AS a

LEFT JOIN DimProductCategory AS b
ON a.ProductCategoryKey = b.ProductCategoryKey

--3)
SELECT
	StoreKey,
	StoreName,
	EmployeeCount,
	b.ContinentName,
	b.RegionCountryName

FROM DimStore AS a

LEFT JOIN DimGeography AS b
ON a.GeographyKey = b.GeographyKey

--4)
SELECT
	ProductKey,
	ProductName,
	b.ProductSubcategoryName,
	c.ProductCategoryName,
	c.ProductCategoryKey

FROM DimProduct AS a

LEFT JOIN DimProductSubcategory AS b
ON a.ProductSubcategoryKey = b.ProductSubcategoryKey

LEFT JOIN DimProductCategory AS c
ON b.ProductCategoryKey = c.ProductCategoryKey


--5)
--a)
SELECT TOP(100) *
FROM FactStrategyPlan

--b)
SELECT
	b.AccountName,
	StrategyPlanKey,
	DateKey,
	Amount

FROM FactStrategyPlan AS a

INNER JOIN DimAccount AS b
ON a.AccountKey = b.AccountKey

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
	ProductSubcategoryName

FROM DimProduct AS a
RIGHT JOIN DimProductSubcategory AS b

ON a.ProductSubcategoryKey = b.ProductSubcategoryKey
WHERE a.ProductKey IS NULL

--8) 
SELECT
	DISTINCT BrandName,
	DimChannel.ChannelName

FROM DimProduct
INNER JOIN FactSales
ON FactSales.ProductKey = DimProduct.Productkey
INNER JOIN DimChannel
ON DimChannel.ChannelKey = FactSales.ChannelKey
WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware')

---------------------

SELECT
	DISTINCT BrandName,
	DimChannel.ChannelName

FROM DimProduct CROSS JOIN DimChannel
WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware')

--9)
SELECT
	OnlineSalesKey,
	Datekey,
	PromotionName,
	SalesAmount
FROM FactOnlineSales

INNER JOIN DimPromotion
ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE PromotionName <> 'No Discount'

ORDER BY DateKey ASC

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
