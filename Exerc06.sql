
-- Criando o banco de dados chamado LojaDB
CREATE DATABASE LojaDB;

-- Usando o banco de dados LojaDB para as próximas operações
USE LojaDB;
-- Criando a tabela Clientes que armazena os dados dos clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,  -- ClienteID é a chave primária, ou seja, identifica unicamente cada cliente
    NomeCliente VARCHAR(100),   -- Nome do cliente, armazenado como uma string de até 100 caracteres
    Cidade VARCHAR(50)          -- Cidade onde o cliente mora, armazenado como uma string de até 50 caracteres
);

-- Criando a tabela Pedidos que armazena os pedidos feitos pelos clientes
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,   -- PedidoID é a chave primária, identificando unicamente cada pedido
    ClienteID INT,              -- ClienteID é uma chave estrangeira, associando cada pedido a um cliente
    DataPedido DATE,            -- Data do pedido, armazenada como um valor de data
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  -- ClienteID é uma chave estrangeira que referencia a chave primária da tabela Clientes
);


-- Criando a tabela Produtos que armazena os dados dos produtos disponíveis
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,  -- ProdutoID é a chave primária, identificando unicamente cada produto
    NomeProduto VARCHAR(100),   -- Nome do produto
    CategoriaID INT,            -- CategoriaID é uma chave estrangeira que referencia a tabela Categorias
    Preco DECIMAL(10, 2)        -- Preço do produto, com até 10 dígitos no total e 2 casas decimais
);


-- Criando a tabela Categorias que armazena as categorias dos produtos
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,  -- CategoriaID é a chave primária, identificando unicamente cada categoria
    NomeCategoria VARCHAR(100)    -- Nome da categoria
);


-- Inserindo clientes na tabela Clientes
INSERT INTO Clientes (ClienteID, NomeCliente, Cidade) VALUES
(1, 'Maria Silva', 'São Paulo'),  -- Cliente com ID 1
(2, 'João Santos', 'Rio de Janeiro'),  -- Cliente com ID 2
(3, 'Ana Costa', 'Belo Horizonte');  -- Cliente com ID 3

	
-- Inserindo pedidos na tabela Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
(1, 1, '2024-01-15'),  -- Pedido ID 1 feito pelo cliente com ID 1 (Maria Silva)
(2, 2, '2024-01-20'),  -- Pedido ID 2 feito pelo cliente com ID 2 (João Santos)
(3, 1, '2024-02-10');  -- Pedido ID 3 feito pelo cliente com ID 1 (Maria Silva)


-- Inserindo categorias na tabela Categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
(1, 'Eletrônicos'),  -- Categoria com ID 1
(2, 'Vestuário');    -- Categoria com ID 2


-- Inserindo produtos na tabela Produtos
INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) VALUES
(1, 'Celular', 1, 1500.00),     -- Produto Celular, pertence à categoria Eletrônicos
(2, 'Televisão', 1, 3000.00),   -- Produto Televisão, pertence à categoria Eletrônicos
(3, 'Camiseta', 2, 50.00);      -- Produto Camiseta, pertence à categoria Vestuário


-- Exibindo o nome dos clientes e as datas dos pedidos que eles fizeram
SELECT Clientes.NomeCliente, Pedidos.DataPedido
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

--EXERCICIOS 

--1)

SELECT 
	a.NomeCliente, 
	b.DataPedido,
	b.DataPedido,
	b.PedidoID

FROM Clientes AS a
INNER JOIN Pedidos AS b
ON a.ClienteID = b.ClienteID;

--2)

SELECT
	a.NomeCliente,
	a.Cidade,
	b.PedidoID

FROM Clientes AS a
LEFT JOIN Pedidos AS b

ON a.ClienteID = b.ClienteID

--3)

SELECT 
	NomeCliente 
FROM Clientes

UNION

SELECT 
	b.NomeCliente
FROM Pedidos AS a

INNER JOIN Clientes AS b
ON a.ClienteID = b.ClienteID

--4)

SELECT 
	COUNT(NomeCliente)
FROM Clientes

UNION ALL

SELECT 
	COUNT(b.NomeCliente)
FROM Pedidos AS a

INNER JOIN Clientes AS b
ON a.ClienteID = b.ClienteID
GROUP BY NomeCliente

--5)

--CRIANDO A TABELA DETALHES DO PRODUTOS

CREATE TABLE DetalhesPedidos (
    DetalheID INT PRIMARY KEY IDENTITY(1,1),  -- Identificador único para cada linha
    PedidoID INT,                             -- Relaciona com a tabela Pedidos
    ProdutoID INT,                            -- Relaciona com a tabela Produtos
    Quantidade INT,                           -- Quantidade de produtos no pedido
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),  -- Chave estrangeira para Pedidos
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID) -- Chave estrangeira para Produtos
);

-- INSERINDO VALORES NA TABELA - DetalhesPedidos -
INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade)
VALUES
(1, 1, 2),  -- Pedido 1 contém 2 unidades do Produto 1
(1, 2, 1),  -- Pedido 1 contém 1 unidade do Produto 2
(2, 3, 5),  -- Pedido 2 contém 5 unidades do Produto 3
(3, 2, 2);  -- Pedido 3 contém 2 unidades do Produto 2


SELECT
	a.NomeCliente, 
	b.DataPedido,
	c.Quantidade,
	d.NomeProduto
	
	

FROM Clientes AS a
INNER JOIN Pedidos AS b
ON a.ClienteID = b.ClienteID

INNER JOIN DetalhesPedidos AS c
ON b.PedidoID = c.PedidoID

INNER JOIN Produtos AS d
ON c.ProdutoID = d.ProdutoID	


--6)

SELECT 
	c.NomeCliente,
	COUNT(DISTINCT a.ProdutoID)

FROM DetalhesPedidos AS a
INNER JOIN Pedidos AS b
ON a.PedidoID = b.PedidoID

INNER JOIN Clientes AS c
ON b.ClienteID = c.ClienteID

GROUP BY c.NomeCliente

--7)

SELECT
	NomeProduto,
	AVG(b.Quantidade) AS 'Quantidade Comprada'

FROM Produtos AS a
INNER JOIN DetalhesPedidos AS b
ON a.ProdutoID = b.ProdutoID
GROUP BY NomeProduto

--8)

--Objetivo: Exibir quantos pedidos foram feitos em cada mês.

SELECT 
	YEAR(Pedidos.DataPedido) AS 'Ano',
	MONTH(Pedidos.DataPedido) AS 'Mês',
	COUNT(PedidoID) AS 'Número de Pedidos'

FROM Pedidos
GROUP BY YEAR(Pedidos.DataPedido), MONTH(Pedidos.DataPedido)

--9)
--Objetivo: Mostrar o valor total vendido de produtos, agrupado por categoria de produto.

SELECT 
	d.NomeCategoria,
	SUM(b.Quantidade * c.Preco) AS 'Soma do Valor Total de Produtos Vendidos'

FROM Pedidos AS a

INNER JOIN DetalhesPedidos AS b
ON a.PedidoID = b.PedidoID

INNER JOIN Produtos AS c
ON b.ProdutoID = c.ProdutoID

INNER JOIN Categorias AS d
ON c.CategoriaID = d.CategoriaID
GROUP BY NomeCategoria

--10)
--Objetivo: Exibir o valor total do pedido mais caro de cada cliente.

--CRIANDO A COLUNA

ALTER TABLE Pedidos ADD Total DECIMAL(10, 2);


UPDATE Pedidos
SET Total = (
    SELECT SUM(DetalhesPedidos.Quantidade * Produtos.Preco)
    FROM DetalhesPedidos
    INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
    WHERE DetalhesPedidos.PedidoID = Pedidos.PedidoID
);

SELECT
	NomeCliente,
	MAX(b.Total) AS 'Preço do Pedido'

FROM Clientes AS a
INNER JOIN Pedidos AS b
ON a.ClienteID = b.ClienteID
GROUP BY NomeCliente
