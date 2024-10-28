--1)

DECLARE @valor1 INT, @valor2 FLOAT, @valor3 FLOAT, @valor4 INT
SET @valor1 = 10
SET @valor2 = 5
SET @valor3 = 34
SET @valor4 = 7

--a)
DECLARE @soma INT
SET @soma = @valor1 + @valor2
SELECT @soma

--b)
DECLARE @subtracao INT
SET @subtracao = @valor3 - @valor4
SELECT @subtracao

--c)
DECLARE @multiplicacao INT
SET @multiplicacao = @valor1 * @valor4
SELECT @multiplicacao

--d)
DECLARE @divisao FLOAT
SET @divisao = @valor3 / @valor4
SELECT ROUND(@divisao, 2)

--2)
DECLARE @produto VARCHAR(10), @quantidade INT, @preco FLOAT, @faturamento FLOAT
SET @produto = 'Celular'
SET @quantidade = 12
SET @preco = 9.99
SET @faturamento = @quantidade * @preco

SELECT @produto, @quantidade, @preco, @faturamento

--3)
DECLARE @nome VARCHAR(5), @data_nascimento DATE, @num_pets INT
SET @nome = 'André'
SET @data_nascimento = '10/02/1998'
SET @num_pets = 2

SELECT 'Meu nome é ' + @nome + ', nasci em ' + FORMAT(CAST(@data_nascimento AS DATETIME), 'dd/MM/yyyy') + ' e tenho ' + CAST(@num_pets AS VARCHAR(MAX)) + ' pets'

--4)
DECLARE @lojas_fechadas VARCHAR(MAX)
SET @lojas_fechadas = ''

SELECT 
@lojas_fechadas = @lojas_fechadas + StoreName + CHAR(10) 
FROM DimStore WHERE CloseDate IS NOT NULL AND CloseDate BETWEEN '01/01/2008' AND '31/12/2008'

PRINT 'As lojas que fecharam foram: ' + @lojas_fechadas

--5)
DECLARE @consultaPorSubcategoria VARCHAR(MAX), @subCategoria VARCHAR(MAX)
SET @subCategoria = 'Lamps'

SELECT ProductName, b.ProductSubcategoryName FROM DimProduct AS a INNER JOIN DimProductSubcategory AS b ON a.ProductSubcategoryKey = b.ProductSubcategoryKey WHERE ProductSubcategoryName = @subCategoria

