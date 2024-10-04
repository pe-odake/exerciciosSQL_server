--use ContosoRetailDW

--Questão 1

--SELECT CustomerKey
--FROM DimCustomer
--Houve uma redução do número de clientes havia um total de 19500, e agora há 18869

--Questão 2

--SELECT
--CustomerKey AS Cliente,
--FirstName AS 'Nome',
--EmailAddress AS Email,
--BirthDate AS 'Aniversario do Cliente' 
--FROM DimCustomer

--Questão 3

--SELECT TOP (100) 
--FirstName AS '1° Nome',
--EmailAddress AS Email,
--BirthDate AS 'Aniversário do Cliente'
--FROM DimCustomer

--SELECT TOP (20) PERCENT 
--FirstName AS '1° Nome',
--EmailAddress AS Email,
--BirthDate AS 'Aniversário do Cliente'
--FROM DimCustomer

--Questão 4

--SELECT DISTINCT
--Manufacturer AS Forcedores
--FROM DimProduct

--Questão 5

--SELECT DISTINCT ProductKey
--FROM DimProduct

--SELECT DISTINCT ProductKey
--FROM FactSales

--há um produto que não foi vendido