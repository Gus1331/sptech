/*
	ENTIDADES = tabelas
    
    CARDINALIDADE = quantidades de vezes a se relacionar (com retorno)
    
    JOIN
		SELECT * FROM Empresa JOIN Aluno ON id = fk;
		SELECT * FROM Empresa JOIN Aluno ON idEmpresa = fkEmpresa;
    
*/

CREATE DATABASE aulaJoin;

USE aulaJoin;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
responsavel VARCHAR(45)
) AUTO_INCREMENT = 1000;

INSERT INTO empresa VALUES
	(NULL, 'Accenture', 'Rafaela'),
    (NULL, 'C6Bank', 'Andresa');
    
CREATE TABLE aluno (
	ra INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    bairro VARCHAR(45),
    fkEmpresa INT, CONSTRAINT fkEMP FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa));
    
INSERT INTO aluno VALUES
	('01232999', 'Pedro', 'Consolação', 1000),
    ('01232998', 'Big Suzane', 'Paraiso', 1000),
    ('01232997', 'Hikari', 'Consolacion', 1001);
    
    
SELECT * FROM aluno;

-- JOIN
SELECT * FROM empresa JOIN aluno ON idEmpresa = fkEmpresa;

SELECT aluno.nome, empresa.nome FROM empresa JOIN aluno ON idEmpresa = fkEmpresa;

SELECT aluno.nome AS 'NomeAluno', empresa.nome AS 'NomeEmpresa' FROM empresa JOIN aluno ON idEmpresa = fkEmpresa;


SELECT a.nome AS 'NomeAluno', 
	e.nome AS 'NomeEmpresa' 
    FROM empresa AS e 
    JOIN aluno AS a 
    ON idEmpresa = fkEmpresa;
    

SELECT a.nome AS 'NomeAluno', 
	e.nome AS 'NomeEmpresa' 
    FROM empresa AS e 
    JOIN aluno AS a 
    ON idEmpresa = fkEmpresa
    WHERE e.nome = 'Accenture';
    