-- Criação da tabela exemplo
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL(10, 2),
    Estoque INT
);

-- Inserção de dados na tabela Produtos
INSERT INTO Produtos (Nome, Categoria, Preco, Estoque) VALUES 
('Produto A', 'Eletrônicos', 150.00, 10),
('Produto B', 'Eletrônicos', 250.00, 5),
('Produto C', 'Eletrodomésticos', 300.00, 8),
('Produto D', 'Eletrônicos', 200.00, 0),
('Produto E', 'Eletrodomésticos', 100.00, 20);

-- Criação de outra tabela para joins
CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY AUTO_INCREMENT,
    NomeFornecedor VARCHAR(100),
    Categoria VARCHAR(50)
);

-- Inserção de dados na tabela Fornecedores
INSERT INTO Fornecedores (NomeFornecedor, Categoria) VALUES 
('Fornecedor X', 'Eletrônicos'),
('Fornecedor Y', 'Eletrodomésticos'),
('Fornecedor Z', 'Móveis');

-- ===================== TÓPICO: Operadores Lógicos (AND, OR, NOT) =====================
-- Seleciona produtos eletrônicos com preço maior que 100 e em estoque
SELECT * 
FROM Produtos
WHERE Categoria = 'Eletrônicos' AND Preco > 100 AND Estoque > 0;

-- Seleciona produtos da categoria "Eletrodomésticos" ou sem estoque
SELECT * 
FROM Produtos
WHERE Categoria = 'Eletrodomésticos' OR Estoque = 0;

-- Seleciona produtos que não são da categoria "Eletrônicos"
SELECT * 
FROM Produtos
WHERE NOT Categoria = 'Eletrônicos';

-- ===================== TÓPICO: Operadores de Comparação =====================
-- Seleciona produtos com preço maior que 200
SELECT * 
FROM Produtos
WHERE Preco > 200;

-- Seleciona produtos com preço menor ou igual a 150
SELECT * 
FROM Produtos
WHERE Preco <= 150;

-- Seleciona produtos com preço diferente de 100
SELECT * 
FROM Produtos
WHERE Preco != 100;

-- ===================== TÓPICO: Joins (Inner Join, Left Join, Right Join) =====================
-- Inner Join: Seleciona os produtos que têm fornecedor correspondente na mesma categoria
SELECT P.Nome AS Produto, F.NomeFornecedor AS Fornecedor
FROM Produtos P
INNER JOIN Fornecedores F
ON P.Categoria = F.Categoria;

-- Left Join: Inclui todos os produtos, mesmo que não tenham fornecedor correspondente
SELECT P.Nome AS Produto, F.NomeFornecedor AS Fornecedor
FROM Produtos P
LEFT JOIN Fornecedores F
ON P.Categoria = F.Categoria;

-- Right Join: Inclui todos os fornecedores, mesmo que não tenham produtos correspondentes
SELECT P.Nome AS Produto, F.NomeFornecedor AS Fornecedor
FROM Produtos P
RIGHT JOIN Fornecedores F
ON P.Categoria = F.Categoria;

-- ===================== TÓPICO: Count e Sum =====================
-- Conta quantos produtos estão na tabela
SELECT COUNT(*) AS TotalProdutos
FROM Produtos;

-- Soma os preços de todos os produtos
SELECT SUM(Preco) AS SomaPrecos
FROM Produtos;

-- ===================== TÓPICO: Cláusulas WHERE e ON =====================
-- WHERE filtra os produtos com preço maior que 200
SELECT * 
FROM Produtos
WHERE Preco > 200;

-- ON define a condição de relacionamento entre tabelas
SELECT P.Nome AS Produto, F.NomeFornecedor AS Fornecedor
FROM Produtos P
INNER JOIN Fornecedores F
ON P.Categoria = F.Categoria;

-- ===================== TÓPICO: IN e BETWEEN =====================
-- Seleciona produtos com categorias específicas
SELECT * 
FROM Produtos
WHERE Categoria IN ('Eletrônicos', 'Eletrodomésticos');

-- Seleciona produtos com preço entre 100 e 250
SELECT * 
FROM Produtos
WHERE Preco BETWEEN 100 AND 250;

-- ===================== TÓPICO: ORDER BY =====================
-- Ordena os produtos pelo preço em ordem crescente
SELECT * 
FROM Produtos
ORDER BY Preco ASC;

-- Ordena os produtos pelo preço em ordem decrescente
SELECT * 
FROM Produtos
ORDER BY Preco DESC;

-- ===================== TÓPICO: GROUP BY e HAVING =====================
-- Agrupa os produtos por categoria e conta quantos existem em cada uma
SELECT Categoria, COUNT(*) AS TotalProdutos
FROM Produtos
GROUP BY Categoria;

-- Filtra as categorias que têm mais de 1 produto
SELECT Categoria, COUNT(*) AS TotalProdutos
FROM Produtos
GROUP BY Categoria
HAVING COUNT(*) > 1;
