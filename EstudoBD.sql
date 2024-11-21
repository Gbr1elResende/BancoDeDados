-- Criação do banco de dados
CREATE DATABASE estudo_banco_dados;
USE estudo_banco_dados;

-- Criação da tabela clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    cidade VARCHAR(50)
);

-- Criação da tabela pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    valor DECIMAL(10, 2),
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserção de dados na tabela clientes
INSERT INTO clientes (nome, idade, cidade) VALUES
('João Silva', 30, 'São Paulo'),
('Maria Oliveira', 25, 'Rio de Janeiro'),
('Carlos Pereira', 35, 'Belo Horizonte'),
('Ana Souza', 28, 'São Paulo'),
('Lucas Lima', 22, 'Rio de Janeiro');

-- Inserção de dados na tabela pedidos
INSERT INTO pedidos (id_cliente, valor, data_pedido) VALUES
(1, 200.50, '2024-10-15'),
(2, 150.00, '2024-10-17'),
(3, 300.75, '2024-10-19'),
(4, 125.30, '2024-10-20'),
(5, 180.00, '2024-10-22'),
(1, 220.00, '2024-10-23'),
(2, 130.25, '2024-10-24');

SELECT * FROM clientes c INNER JOIN pedidos p ON c.id_cliente = p.id_cliente WHERE c.cidade = 'São Paulo' AND p.valor > 200;
SELECT * FROM clientes c INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
SELECT * FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;
SELECT * FROM clientes c RIGHT JOIN pedidos p ON c.id_cliente = p.id_cliente;
SELECT * FROM clientes c RIGHT JOIN pedidos p ON c.id_cliente = p.id_cliente;

SELECT c.nome, SUM(p.valor) AS total_gasto
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;

SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;
