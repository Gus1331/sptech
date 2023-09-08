-- Aula 2
-- comandos DDL e DML

-- CREATE DATABASE, se ele já estiver criando
-- ultilizar apenas o comando USE

-- CREATE DATABASE bd1adsa;

-- mostrar bancos de dados existentes
-- SHOW DATABASES;


USE bd1adsa;

-- DDL CREATE TABLE
CREATE TABLE turma (
id int primary key,
nome varchar(45));

-- VARCHAR (CARCTER QUE VARIA)

DESCRIBE turma;

INSERT INTO turma VALUES
(1, '1ADSA'),
(2, '1ADSB'),
(3, '1ADSC');

SELECT * FROM turma;

-- EXIBIR O NOME DA TURMA QUE TERMINA COM A
SELECT * FROM turma WHERE nome LIKE '%A';

INSERT INTO turma VALUES
	(4, '1CCOA'),
	(5, '1SISA');

INSERT INTO turma VALUES
	(6,'2CCOA');
    
    -- EXIBIR O NOME DA TURMA QUE COMEÇA COM @
    SELECT * FROM turma WHERE nome LIKE '2%';
    
    -- EXIBIR O NOME DA TURMA ONDE A PENULTIMA É B
    SELECT * FROM turma WHERE nome LIKE '%S_';
    
    -- exibir o nome da turma onde a segunda letra é c
    SELECT nome FROM turma WHERE nome LIKE '_C%';
    
    SELECT * FROM turma;
    
    -- ordenar pelo nome em ordem crescente
    SELECT * FROM turma ORDER BY nome;
    -- ordenar pelo nome em ordem decrescente
    SELECT * FROM turma ORDER BY nome DESC;

-- DDL ALTER TABLE
-- RENOMEAR UM CAMPO
ALTER TABLE turma RENAME COLUMN id TO idTurma;
DESCRIBE turma;

-- MODIFICAR A QUANTIDADE DOS CARACTERES DO NOME
ALTER TABLE turma MODIFY COLUMN nome varchar(100);

-- ADICIONAR UMA COLUNA
ALTER TABLE turma ADD COLUMN coordenador varchar(50);


SELECT * FROM turma;

-- DML UPTADE PARA ATUALIZAR O DADO
UPDATE turma SET coordenador = 'Thiago' 
	WHERE idTurma = 1;
    
UPDATE turma SET idTurma = 100
	WHERE idTurma = 1;
    
-- EXCLUIR uma tupla ou registro
DELETE FROM turma WHERE idTurma = 6;

-- excluir uma coluna (DDL)
ALTER TABLE turma DROP COLUMN coordenador;
DESCRIBE turma;

-- EXCLUIR A TABELA
-- DROP TABLE turma;
