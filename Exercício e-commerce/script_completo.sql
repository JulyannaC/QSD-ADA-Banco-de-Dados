--BANCO DE DADOS E-COMMERCE

--Tabela Clientes

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    endereco_id INT REFERENCES endereco(id_endereco),
    telefone VARCHAR(20)
);

-- Exemplo de inserção de pedido
INSERT INTO clientes (nome, cpf, email, endereco_id, telefone)
VALUES ('Bianca Silva', '123.456.789-00', 'bianca@email.com', 1, '(11) 98765-4321');

INSERT INTO clientes (nome, cpf, email, endereco_id, telefone)
VALUES ('Lucas Oliveira', '111.222.333-44', 'lucas@email.com', 2, '(11) 99999-8888');

INSERT INTO clientes (nome, cpf, email, endereco_id, telefone)
VALUES ('Carla Santos', '555.666.777-88', 'carla@email.com', 3, '(11) 98765-4321');

INSERT INTO clientes (nome, cpf, email, endereco_id, telefone)
VALUES ('Camila Rodrigues', '987.654.321-00', 'camila@email.com', 4, '(11) 98765-4321');



select * from clientes;

--Tabela pedidos

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(20) NOT NULL,
    valor_total NUMERIC(10, 2) NOT NULL,
    endereco_id INT REFERENCES endereco(id_endereco)
);

-- Exemplo de inserção de pedido
INSERT INTO pedidos (id_cliente, data_pedido, status_pedido, valor_total, endereco_id)
VALUES (1, '2024-04-30', 'Enviado', 89.97, 1);

INSERT INTO pedidos (id_cliente, data_pedido, status_pedido, valor_total, endereco_id)
VALUES (2, '2024-04-30', 'Pendente', 3599.96, 2);

INSERT INTO pedidos (id_cliente, data_pedido, status_pedido, valor_total, endereco_id)
VALUES (3, '2024-05-01', 'Enviado', 649.5, 3);

INSERT INTO pedidos (id_cliente, data_pedido, status_pedido, valor_total, endereco_id)
VALUES (4, '2024-05-02', 'Entregue', 8.994, 4);


select * from pedidos;

--Tabela endereço

CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    tipo_logradouro VARCHAR(100),
    logradouro VARCHAR(100),
    bairro VARCHAR(100),
    uf VARCHAR(2),
    cidade VARCHAR(50),
    cep VARCHAR(10)
);

-- Inserindo endereço para o cliente com id_cliente = 1
INSERT INTO endereco (id_cliente, tipo_logradouro, logradouro, bairro, uf, cidade, cep)
VALUES (1, 'Rua', 'Clóvis da Costa Gomes, 30', 'Centro', 'SP', 'São Paulo', '01234-567');

-- Inserindo endereço para o cliente com id_cliente = 2
INSERT INTO endereco (id_cliente, tipo_logradouro, logradouro, bairro, uf, cidade, cep)
VALUES (2, 'Avenida', 'Getúlio Vargas, 456', 'Jardins', 'RJ', 'Rio de Janeiro', '02345-678');

-- Inserindo endereço para o cliente com id_cliente = 3
INSERT INTO endereco (id_cliente, tipo_logradouro, logradouro, bairro, uf, cidade, cep)
VALUES (3, 'Rua', 'Casa Nova, 789', 'Boa Vista', 'MG', 'Belo Horizonte', '03456-789');

-- Inserindo endereço para o cliente com id_cliente = 4
INSERT INTO endereco (id_cliente, tipo_logradouro, logradouro, bairro, uf, cidade, cep)
VALUES (4, 'Avenida', 'Principal, 1010', 'Centro', 'SP', 'São Paulo', '04567-890');


--Tabela produtos

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10, 2) NOT NULL,
    categoria VARCHAR(50),
    estoque INT NOT NULL
);

-- Exemplo de inserção de produto
INSERT INTO produtos (nome_produto, descricao, preco, categoria, estoque)
VALUES ('Camiseta', 'Camiseta de algodão', 29.99, 'Roupas', 100);

INSERT INTO produtos (nome_produto, descricao, preco, categoria, estoque)
VALUES ('Smartphone', 'Modelo X - 128GB', 899.99, 'Eletrônicos', 50);

INSERT INTO produtos (nome_produto, descricao, preco, categoria, estoque)
VALUES ('Fones de Ouvido', 'Bluetooth, cancelamento de ruído', 129.90, 'Acessórios', 100);

INSERT INTO produtos (nome_produto, descricao, preco, categoria, estoque)
VALUES ('Notebook', 'Core i5, 8GB RAM, SSD 256GB', 1499.00, 'Eletrônicos', 30);


select * from produtos;

-- Tabela itens do pedido

CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido),
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    preco_unitario NUMERIC(10, 2) NOT NULL
);

-- Exemplo de inserção de item do pedido
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (1, 1, 3, 29.99);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (2, 2, 4, 899.99);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (3, 3, 5, 129.90);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (4, 4, 6, 1499.00);


select * from itens_pedido;

--INNER JOIN

SELECT P.id_pedido, P.data_pedido, C.nome AS nome_cliente, P.status_pedido, P.valor_total, P.endereco_entrega
FROM Pedidos as P
INNER JOIN clientes as C ON P.id_cliente = C.id_cliente;

SELECT pedidos.id_pedido, produtos.nome_produto, itens_pedido.quantidade, itens_pedido.preco_unitario
FROM pedidos
INNER JOIN itens_pedido ON pedidos.id_pedido = itens_pedido.id_pedido
INNER JOIN produtos ON itens_pedido.id_produto = produtos.id_produto;

SELECT P.id_pedido, P.data_pedido, C.nome AS nome_cliente, produtos.nome_produto, itens_pedido.quantidade, itens_pedido.preco_unitario
FROM Pedidos as P
INNER JOIN clientes as C ON P.id_cliente = C.id_cliente
INNER JOIN itens_pedido ON P.id_pedido = itens_pedido.id_pedido
INNER JOIN produtos ON itens_pedido.id_produto = produtos.id_produto;


-- LEFT JOIN

SELECT C.nome AS nome_cliente, P.id_pedido, P.data_pedido, P.status_pedido, P.valor_total
FROM clientes as C
LEFT JOIN pedidos as P ON C.id_cliente = P.id_cliente;

SELECT produtos.nome_produto, itens_pedido.id_pedido, itens_pedido.quantidade, itens_pedido.preco_unitario
FROM produtos
LEFT JOIN itens_pedido ON produtos.id_produto = itens_pedido.id_produto;

-- CONCAT e COALESCE 
SELECT 
    P.id_pedido, 
    P.data_pedido, 
    CONCAT(COALESCE(C.nome, 'Cliente não encontrado'), ' - ', COALESCE(P.status_pedido, 'Status não encontrado')) AS detalhes_pedido,
    P.valor_total
FROM 
    Pedidos as P
INNER JOIN 
    clientes as C ON P.id_cliente = C.id_cliente;


SELECT CONCAT(clientes.nome, ' ', clientes.cpf) AS "Nome e CPF"
FROM clientes;

-- UNION

SELECT nome_produto FROM produtos
UNION
SELECT nome FROM clientes;


-- Exemplo de UNION ALL para listar todos os clientes e todos os produtos
SELECT id_cliente AS id, nome AS nome_ou_produto, 'Cliente' AS tipo_entidade
FROM clientes

UNION ALL

SELECT id_produto AS id, nome_produto AS nome_ou_produto, 'Produto' AS tipo_entidade
FROM produtos;