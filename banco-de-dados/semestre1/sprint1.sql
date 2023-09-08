CREATE DATABASE asl;
DROP DATABASE asl;

USE asl;

CREATE TABLE sensor
	(sensorId INT PRIMARY KEY AUTO_INCREMENT,
    empresaId INT NOT NULL,
    esteira VARCHAR(10),
    tipo VARCHAR(7) NOT NULL);
     
ALTER TABLE sensor MODIFY COLUMN tipo VARCHAR(7), ADD CONSTRAINT checktipo CHECK (tipo = 'entrada' OR tipo = 'saida');

CREATE TABLE registro
	(registroId INT PRIMARY KEY AUTO_INCREMENT,
    sensorId INT,
    dataRegistro DATETIME DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE esteira
	(empresaId INT PRIMARY KEY AUTO_INCREMENT,
    identificacao VARCHAR(10),
	produto VARCHAR(25),
    condicao VARCHAR(10),
    producaoEstimadaPorMin INT);
    
ALTER TABLE esteira MODIFY COLUMN condicao VARCHAR(11), ADD CONSTRAINT checkCondicao CHECK (condicao = 'funcionando' OR condicao = 'parado');

CREATE TABLE cliente
	(clientesId INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    qtdSensores INT DEFAULT NULL,
    email VARCHAR(256) NOT NULL,
    tel VARCHAR(15),
    cnpj INT DEFAULT NULL,
    cpf INT DEFAULT NULL,	
    senha VARCHAR(30) NOT NULL);


-- VALORES -------------------------------------------------

INSERT INTO sensor VALUES 
(NULL, 1, '1', 'Cerveja', 'entrada', 30000, '2020-05-13'),
(NULL, 2, '2', 'Danone', 'saida', 20000, '2021-08-29') ,
(NULL, 3, '3', 'Chocolate', 'saida', 45000, '2022-01-01');

INSERT INTO cliente VALUES
    (NULL, 'Joao', 30, 'joao123@gmail.com', '1198756875', 031332203-12, 'joao123'),
    (NULL, 'CacauChocolates', 100, 'chocolatescacau@hotmail.com', '1138698796', 13941123, 'cacauchoco2930'),
    (NULL, 'Patricia', 25, 'patricia875@gmail.com', '1197563457', 0234124129-90, 'paty2039');

INSERT INTO esteira VALUES
    (NULL, '1', 'funcionando', 20, 8, 12, 0), 
    (NULL, '2', 'parado', 20, 40, 20, 10),
    (NULL, '1', 'funcionando' ,10, 7, 3, 0);
    
    
SELECT * FROM sensor;

SELECT * FROM cliente;

SELECT * FROM esteira;