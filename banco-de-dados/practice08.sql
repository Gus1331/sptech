-- practice 08

CREATE DATABASE venda;
USE venda;

CREATE TABLE cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    endereco VARCHAR(45),
    indicacao INT,
	CONSTRAINT fkClienteIndicacao FOREIGN KEY (indicacao)
		REFERENCES cliente(idCliente));
        
CREATE TABLE venda (
	idVenda INT AUTO_INCREMENT,
    fkCliente INT, 
    PRIMARY KEY (idVenda, fkCliente),
    total DECIMAL(10,2),
    dtVenda DATE) AUTO_INCREMENT = 100;
    
CREATE TABLE produto (
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(100),
    preco DECIMAL(5,2)) AUTO_INCREMENT = 500;
    
CREATE TABLE vendaProduto (
	fkCliente INT,
	fkVenda INT,
    fkProduto INT,
    PRIMARY KEY (fkCliente, fkVenda, fkProduto),
    quantidade INT,
    desconto INT,
    CONSTRAINT fkClienteVendaProduto FOREIGN KEY (fkCliente)
		REFERENCES cliente(idCliente),
	CONSTRAINT fkVendaVendaProduto FOREIGN KEY (fkVenda)
		REFERENCES venda(idVenda),
	CONSTRAINT fkProdutoVendaProduto FOREIGN KEY (fkProduto)
        REFERENCES produto(idProduto));	
        
INSERT INTO cliente (nome, endereco, indicacao) VALUES 
	('Amando','rua hosges', NULL),
    ('Amanda','rua fersa', NULL),
    ('Paulo','rua gatede', NULL);
    
INSERT INTO cliente (nome, endereco, indicacao) VALUES 
    ('Paula','rua oluki', 1),
    ('Tonho','rua yuner', 4),
    ('Tonha','rua xerfas', 3);
    
INSERT INTO produto(nome, preco) VALUES
	('Nescau', 13.22),
    ('Leite', 8.99),
    ('Cereal', 19.50),
    ('Aveia', 8.79),
    ('Iorgute', 25.77);
    
INSERT INTO venda (fkCliente, dtVenda) VALUES
	(4, '2023-10-31'),
    (4, '2023-10-31'),
    (5, '2023-10-31'),
    (5, '2023-11-01'),
    (6, '2023-10-31'),
    (3, '2023-10-31'),
    (4, '2023-11-11'),
    (2, '2023-10-31');
    
INSERT INTO vendaProduto (fkVenda, fkCliente, fkProduto, quantidade) VALUES
	(100, 4, 500, 3),
    (100, 4, 501, 6),
    (100, 4, 502, 1),
    (100, 4, 503, 2),
    
	(101, 4, 500, 1),
    (101, 4, 501, 2),
    
    (102, 5, 502, 1),
    (102, 5, 503, 2),
    
    (103, 5, 502, 3),
    
	(104, 6, 500, 1),
    (104, 6, 501, 2),
    (104, 6, 502, 7),
    
	(105, 3, 500, 9),
    (105, 3, 503, 3),

	(106, 4, 500, 1),

	(107, 2, 501, 35);
    
SELECT * FROM cliente LEFT JOIN venda ON fkCliente = idCliente;
    
SELECT * FROM cliente JOIN venda on fkCliente = idCliente WHERE nome = 'Paula';
    
SELECT * FROM cliente LEFT JOIN cliente AS indicador ON cliente.indicacao = indicador.idCliente;
    
 SELECT * FROM cliente 
	LEFT JOIN cliente AS indicador 
	ON cliente.indicacao = indicador.idCliente
    WHERE indicador.nome = 'Amando';
    
 SELECT cliente.nome AS 'Cliente',
	cliente.endereco AS 'Endereço',
    cliente.email AS 'Email',
	indicador.nome AS 'Indicador',
    venda.dtVenda AS 'Data da venda',
    produto.nome AS 'Produto',
    vendaProduto.quantidade AS 'Quantidade'
	FROM cliente 
	LEFT JOIN cliente AS indicador 
	ON cliente.indicacao = indicador.idCliente
    JOIN venda
    ON venda.fkCliente = cliente.idCliente
    JOIN vendaProduto
    ON fkVenda = idVenda
    JOIN produto
    ON fkProduto = idProduto;

 SELECT venda.dtVenda AS 'Data',
	produto.nome AS 'Produto',
    vendaProduto.quantidade AS 'Quantidade'
	FROM cliente 
	LEFT JOIN cliente AS indicador 
	ON cliente.indicacao = indicador.idCliente
    JOIN venda
    ON venda.fkCliente = cliente.idCliente
    JOIN vendaProduto
    ON fkVenda = idVenda
    JOIN produto
    ON fkProduto = idProduto;
    
 SELECT	produto.nome AS 'Produto',
    sum(produto.preco) AS 'Total', count(*)
	FROM vendaProduto
    JOIN produto ON fkProduto = idProduto
    GROUP BY produto.nome;