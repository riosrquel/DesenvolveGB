CREATE OR REPLACE TABLE `t1engenhariadados.treinamento_Raquel.Clientes`
(
  ID_Cliente INT64,
  Nome_Cliente STRING,
  Email_Cliente STRING,
  Estado_Cliente STRING
);
CREATE OR REPLACE TABLE `t1engenhariadados.treinamento_Raquel.Produtos` (
    ID_Produto INT64,
    Nome_Produto STRING,
    Categoria_Produto STRING,
    Preco_Produto NUMERIC
);
CREATE OR REPLACE TABLE `t1engenhariadados.treinamento_Raquel.Vendas` (
    ID_Venda INT64,
    ID_Cliente INT64,
    ID_Produto INT64,
    Data_Venda DATE,
    Quantidade INT64
);

-- Clientes
INSERT INTO `t1engenhariadados.treinamento_Raquel.Clientes` (ID_Cliente, Nome_Cliente, Email_Cliente, Estado_Cliente)
VALUES
    (1, 'Ana Silva', 'ana.s@email.com', 'SP'),
    (2, 'Bruno Costa', 'b.costa@email.com', 'RJ'),
    (3, 'Carla Dias', 'carla.d@email.com', 'SP'),
    (4, 'Daniel Souza', 'daniel.s@email.com', 'MG');

-- Produtos
INSERT INTO `t1engenhariadados.treinamento_Raquel.Produtos` (ID_Produto, Nome_Produto, Categoria_Produto, Preco_Produto)
VALUES
    (101, 'Fundamentos de SQL', 'Dados', 60.00),
    (102, 'Duna', 'Ficção Científica', 80.50),
    (103, 'Python para Dados', 'Programação', 75.00),
    (104, 'O Guia do Mochileiro', 'Ficção Científica', 42.00);

-- Vendas
INSERT INTO `t1engenhariadados.treinamento_Raquel.Vendas` (ID_Venda, ID_Cliente, ID_Produto, Data_Venda, Quantidade)
VALUES
    (1, 1, 101, '2024-01-15', 1),
    (2, 2, 102, '2024-01-18', 1),
    (3, 3, 103, '2024-02-02', 2),
    (4, 1, 102, '2024-02-10', 1),
    (5, 4, 101, '2024-02-20', 1),
    (6, 2, 104, '2024-03-05', 1);


SELECT Nome_Cliente
FROM `t1engenhariadados.treinamento_Raquel.Clientes`
WHERE Estado_Cliente = 'SP';

SELECT Nome_Produto
FROM `t1engenhariadados.treinamento_Raquel.Produtos`
WHERE Categoria_Produto = 'Ficção Científica';

SELECT
    C.Nome_Cliente,
    P.Nome_Produto,
    V.Data_Venda
FROM `t1engenhariadados.treinamento_Raquel.Vendas` AS V
JOIN `t1engenhariadados.treinamento_Raquel.Clientes` AS C ON V.ID_Cliente = C.ID_Cliente
JOIN `t1engenhariadados.treinamento_Raquel.Produtos` AS P ON V.ID_Produto = P.ID_Produto
ORDER BY V.Data_Venda;

SELECT
    V.ID_Venda,
    (V.Quantidade * P.Preco_Produto) AS Valor_Total
FROM `t1engenhariadados.treinamento_Raquel.Vendas` AS V
JOIN `t1engenhariadados.treinamento_Raquel.Produtos` AS P ON V.ID_Produto = P.ID_Produto;

SELECT
    P.Nome_Produto,
    SUM(V.Quantidade) AS Total_Quantidade_Vendida
FROM `t1engenhariadados.treinamento_Raquel.Vendas` AS V
JOIN `t1engenhariadados.treinamento_Raquel.Produtos` AS P ON V.ID_Produto = P.ID_Produto
GROUP BY P.Nome_Produto
ORDER BY Total_Quantidade_Vendida DESC
LIMIT 1;

CREATE OR REPLACE VIEW `t1engenhariadados.treinamento_Raquel.v_relatorio_vendas_detalhado` AS
SELECT
    V.ID_Venda,
    V.Data_Venda,
    C.Nome_Cliente,
    C.Estado_Cliente,
    P.Nome_Produto,
    P.Categoria_Produto,
    V.Quantidade,
    P.Preco_Produto,
    (V.Quantidade * P.Preco_Produto) AS Valor_Total
FROM `t1engenhariadados.treinamento_Raquel.Vendas` AS V
JOIN `t1engenhariadados.treinamento_Raquel.Clientes` AS C ON V.ID_Cliente = C.ID_Cliente
JOIN `t1engenhariadados.treinamento_Raquel.Produtos` AS P ON V.ID_Produto = P.ID_Produto;

