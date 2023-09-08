-- CRIAR UM BANCO DE DADOS
-- TODO COMANDO SQL TERMINA COM ;
CREATE DATABASE bd1adsa;

-- selecionar banco de dados
USE bd1adsa;

-- criar a tabela empresa
CREATE TABLE empresa (
-- coluna tipo inteiro id chave primaria
id int primary key,
-- coluna tipo caracteres variaveis
nome varchar(50),
responsavel varchar(40)
);

-- descrever a tabela 
DESCRIBE empresa;

-- inserir dados na tabela
INSERT INTO empresa VALUES
	(1,'STEFANINI', 'RAFAEL');
    
-- exibir dados da tabela 
SELECT * FROM empresa;

INSERT INTO empresa VALUES
	(2, 'ITAU', ''),
    (3, 'SAFRA', 'GUSTAVO');
    
SELECT * FROM empresa;

-- exibir apenas os responsaveis
SELECT responsaveis FROM empresa;

SELECT id, nome FROM empresa;

-- exibir a empresa onde o responsavel é o rafael
SELECT nome FROM empresa WHERE responsavel = 'RAFAEL';

-- exibir a empresa onde o nome é safra
SELECT * FROM empresa WHERE nome = 'SAFRA';
 
 -- CRIAR A TABELA ALUNOS
 CREATE TABLE alunos(
	ra int primary key, 
    nome varchar(50),
    bairro varchar (50),
    id_turma int,
    id_empresa int 
 );
 
 insert into alunos values 
	( 01232009, 'FABRICIO', 'JARDIM MARIA LIDIA', '100', '1'),
	( 01232047, 'KEVIN', 'SANTA ETELVINA', '100', '2'),
	( 01232105, 'PATRICK', 'JARDIM VITAPOLIS', '100', '3'),
	( 01232016, 'PEDRO', 'JARDIM FERNANDES', '100', '1');
 
 
 SELECT * from turma;
 
 -- APAGA A TABELA
DROP TABLE turma;
 
CREATE TABLE turma(
	id int primary key,
    nome varchar(50)
);

INSERT INTO turma VALUES 
	( 100, '1ADSA'),
    ( 101, '1ADSB'),
    ( 102, '1ADSC');

 SELECT * from alunos;
 SELECT * from empresa;
 SELECT * from turma;