--use ContosoRetailDW

--Quest�o 1

--SELECT CustomerKey
--FROM DimCustomer
--Houve uma redu��o do n�mero de clientes havia um total de 19500, e agora h� 18869

--Quest�o 2

--SELECT
--CustomerKey AS Cliente,
--FirstName AS 'Nome',
--EmailAddress AS Email,
--BirthDate AS 'Aniversario do Cliente' 
--FROM DimCustomer

--Quest�o 3

--SELECT TOP (100) 
--FirstName AS '1� Nome',
--EmailAddress AS Email,
--BirthDate AS 'Anivers�rio do Cliente'
--FROM DimCustomer

--SELECT TOP (20) PERCENT 
--FirstName AS '1� Nome',
--EmailAddress AS Email,
--BirthDate AS 'Anivers�rio do Cliente'
--FROM DimCustomer

--Quest�o 4

--SELECT DISTINCT
--Manufacturer AS Forcedores
--FROM DimProduct

--Quest�o 5

--SELECT DISTINCT ProductKey
--FROM DimProduct

--SELECT DISTINCT ProductKey
--FROM FactSales

--h� um produto que n�o foi vendido