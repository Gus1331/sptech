CREATE DATABASE practice05;
USE practice05;

CREATE TABLE cliente (
	clienteId INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telFixo VARCHAR(12),
    telCelular VARCHAR(12),
    endereco VARCHAR(45));

CREATE TABLE pet (
	petId INT PRIMARY KEY AUTO_INCREMENT,
    tipoAnimal VARCHAR(45),
    nome VARCHAR(45),
    raca VARCHAR(45),
    dtNascimento DATE,
    fkCliente INT,
    CONSTRAINT ClintePet FOREIGN KEY (fkCliente) REFERENCES cliente(clienteId)
    )AUTO_INCREMENT = 101;
    
    
INSERT INTO cliente VALUES
	(NULL, 'Fernanda Carvalho', '11 91111-111', '11 91111-111', 'Rua Chuva de Novembro'),
    (NULL, 'Yamato Carvalho', '11 91111-111', '11 91111-111', 'Rua Mestre das Marionetes'),
    (NULL, 'Fernanda Luis', '11 91111-111', '11 91111-111', 'Rua Domination'),
    (NULL, 'Wesley Monteiro', '11 91111-111', '11 91111-111', 'Rua Sangue e trovão'),
    (NULL, 'Bolivia Carlos', '11 91111-111', '11 91111-111', 'Rua Igreja de ossos');
    
INSERT INTO pet VALUES
	(NULL, 'gato', 'Julia', 'siberiano', '2000-02-02', 1),
    (NULL, 'gato', 'Zeus', 'siberiano', '2006-04-12', 1),
    (NULL, 'cachorro', 'Tony', 'vira-lata', '2012-02-04', 2),
    (NULL, 'cachorro', 'Totó', 'Husky', '2022-02-02', 3),
    (NULL, 'gato', 'tobias', 'Lhasa-apso', '2020-12-02', 4),
    (NULL, 'tartaruga', 'Julia', 'desconhecido', '1900-06-22', 5),
    (NULL, 'camelo', 'Cronos', 'desconhecido', '2009-07-11', 5);
    
SELECT * FROM pet;
SELECT * FROM cliente;

ALTER TABLE cliente MODIFY COLUMN nome VARCHAR(50);

SELECT * FROM pet WHERE tipoAnimal = 'cachorro';
SELECT nome, dtNascimento FROM pet;
SELECT * FROM pet ORDER BY nome;
SELECT * FROM cliente ORDER BY endereco DESC;
SELECT * FROM pet WHERE nome LIKE 'j%';
SELECT * FROM cliente WHERE nome LIKE '%Carvalho%';
UPDATE cliente SET telFixo = '11 91111-222' WHERE clienteId = 1;
SELECT * FROM cliente WHERE clienteId = 1;

SELECT * FROM pet 
	JOIN cliente ON clienteId = fkCliente
    WHERE cliente.clienteId = 5;
    
DELETE FROM pet WHERE petId = 105;
SELECT * FROM pet;

DROP TABLE pet;
DROP TABLE cliente;
-- 2 ----------------------------------------------------------------------------- ------------

CREATE TABLE pessoa (
	pessoaId INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE,
    profissao VARCHAR(45));
    
CREATE TABLE gasto (
	gastoId INT PRIMARY KEY AUTO_INCREMENT,
    valor FLOAT,
    descricao VARCHAR(45),
    fkPessoa INT,
    CONSTRAINT gastoPessoa FOREIGN KEY (fkPessoa) REFERENCES pessoa(pessoaId));	
    
INSERT INTO pessoa VALUES
	(NULL, 'Kin', '1970-01-19', 'Samurai'),
    (NULL, 'Momo', '1995-01-19', 'Presidente'),
    (NULL, 'Kanjuro', '1968-07-30', 'Espião');
    
INSERT INTO gasto VALUES
	(NULL, 20.1, 'Bola de basquete', 1),
    (NULL, 50.5, 'Cinema 05/11', 1),
    (NULL, 10.99, 'Fone de ouvido', 2),
    (NULL, 8.35, 'Pincel', 3),
    (NULL, 39.9, 'Sopa', 3);
    
SELECT * FROM pessoa;
SELECT * FROM gasto;
SELECT * FROM pessoa WHERE profissao = 'Espião';
SELECT * FROM gasto WHERE valor = 50.5;
SELECT * FROM pessoa JOIN gasto 
	ON pessoaId = fkPessoa;
SELECT * FROM pessoa JOIN gasto 
	ON pessoaId = fkPessoa
    WHERE pessoa.pessoaId = 1;
    
DELETE FROM gasto WHERE gastoId = 2;

DROP TABLE gasto;
DROP TABLE pessoa;


 -- 3 ----------------------------------------------------------------------------------------------------------
 CREATE DATABASE PraticaFuncionario;
 USE PraticaFuncionario;
 
 CREATE TABLE setor (
	setorId INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    andar CHAR(2));
    
CREATE TABLE funcionario (
	funcionarioid INT PRIMARY KEY AUTO_INCREMENT,
    fkSetor INT,
    nome VARCHAR(45),
    tel VARCHAR(12),
    salario INT,
    CONSTRAINT setorFuncionario FOREIGN KEY (fkSetor) REFERENCES setor(setorId),
    CONSTRAINT salarioCheck CHECK (salario >= 1));	

CREATE TABLE acompanhante (
	acompanhanteId INT PRIMARY KEY AUTO_INCREMENT,
    fkFuncionario INT,
    nome VARCHAR(45),
    relacao VARCHAR(45),
    dtNascimento DATE,
    CONSTRAINT acompanhanteFuncionario FOREIGN KEY (fkFuncionario) REFERENCES funcionario(funcionarioId));

INSERT INTO setor VALUES
	(NULL, 'vendas', '01'),
    (NULL, 'negócios', '02'),
    (NULL, 'manutenção', '03');
    
INSERT INTO funcionario VALUES
	(NULL, 1, 'Alex', '11 9111111', 3300),
    (NULL, 1, 'Michael', '11 9111111', 3100),
    (NULL, 1, 'Cesar', '11 9111111', 3900),
    (NULL, 2, 'Bruno', '11 9111111', 3000),
    (NULL, 2, 'Claudio', '11 9111111', 3500),
    (NULL, 3, 'Yasmin', '11 9111111', 4000),
    (NULL, 3, 'Gabriela', '11 9111111', 1700);

INSERT INTO acompanhante VALUES 
	(NULL, 2 , 'Stefany', 'filha', '2000-01-01'),
    (NULL, 3 , 'Lurdes', 'irmã', '2000-01-01'),
    (NULL, 4 , 'Mikaela', 'esposa', '2000-01-01'),
    (NULL, 5 , 'Felipe', 'filho', '2000-01-01'),
    (NULL, 6 , 'Rafael', 'amigo', '2000-01-01'),
    (NULL, 6 , 'João', 'amigo', '2000-01-01');
    
SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

SELECT * FROM funcionario JOIN setor
	ON fkSetor = setorId;

SELECT * FROM funcionario JOIN setor
	ON fkSetor = setorId
	WHERE setor.nome = 'Manutenção';
    
SELECT * FROM funcionario JOIN acompanhante
	ON fkFuncionario = funcionarioId;
    
SELECT * FROM funcionario JOIN acompanhante
	ON fkFuncionario = funcionarioId
	WHERE funcionario.nome = 'Cesar';
    
SELECT * FROM funcionario JOIN acompanhante
	ON fkFuncionario = funcionarioId
    JOIN setor
    ON fkSetor = setorID;
    
DROP DATABASE PraticaFuncionario;
-- 4 ----------------------------------------------------------------------------------------------------
CREATE DATABASE Treinador;
USE Treinador;

CREATE TABLE treinador(
	treinadorId INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tel CHAR(12),
    email VARCHAR(45),
    fkTreinador INT,
    CONSTRAINT treinadorTreinador FOREIGN KEY (fkTreinador) 
    REFERENCES treinador(treinadorId))AUTO_INCREMENT = 10;
    
CREATE TABLE nadador (
	nadadorId INT PRIMARY KEY AUTO_INCREMENT,
    fkTreinador INT,
    nome VARCHAR(45),
    estado VARCHAR(45),
    dtNascimento DATE)AUTO_INCREMENT = 100;
    
INSERT INTO treinador VALUES 
	(NULL, 'Eddie', '11 911111111', 'example@email.com', NULL),
    (NULL, 'Miles', '11 911111111', 'example@email.com', NULL),
    (NULL, 'Peter', '11 911111111', 'example@email.com', 10),
    (NULL, 'Mary', '11 911111111', 'example@email.com', 10),
    (NULL, 'May', '11 911111111', 'example@email.com', 11);
    
INSERT INTO nadador VALUES
	(NULL, 10, 'Draco', 'Acre', '2000-01-02'),
    (NULL, 11, 'Newton', 'Goias', '2000-01-02'),
    (NULL, 12, 'Charles', 'São Paulo', '2000-01-02'),
    (NULL, 12, 'Lucio', 'Rio de janeiro', '2000-01-02'),
    (NULL, 13, 'Raze', 'Bahia', '2000-01-02'),
    (NULL, 14, 'Paula', 'São Paulo', '2000-01-02');
    
SELECT * FROM treinador;
SELECT * FROM nadador;

SELECT * FROM treinador JOIN nadador
	ON nadador.fkTreinador = treinadorId;
    
    SELECT * FROM treinador JOIN nadador
	ON nadador.fkTreinador = treinadorId
	WHERE treinadorId = 12;
    

DROP TABLE treinador;
DROP TABLE nadador;

