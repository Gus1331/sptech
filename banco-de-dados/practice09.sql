-- practice 09
CREATE DATABASE practice09;

USE practice09;

-- 1

CREATE TABLE professor (
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    disciplina VARCHAR(45)) AUTO_INCREMENT = 10000;
    
CREATE TABLE grupo(
	idGrupo INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
    descricao VARCHAR(45)) AUTO_INCREMENT = 0;
    
CREATE TABLE aluno (
	RA CHAR(8) PRIMARY KEY,
    fkGrupo INT,
    nome VARCHAR(45),
    email VARCHAR(45),
	CONSTRAINT fkGrupoAluno FOREIGN KEY (fkGrupo)
		REFERENCES grupo(idGrupo));
    
CREATE TABLE avaliacao (
	fkGrupo INT,
    fkProfessor INT,
    dtAvaliacao DATETIME,
    nota INT,
    PRIMARY KEY(fkGrupo, fkProfessor),
    CONSTRAINT fkGrupoAvalicao FOREIGN KEY (fkGrupo)
		REFERENCES grupo(idGrupo),
	CONSTRAINT fkProfessorAvaliacao FOREIGN KEY (fkProfessor)
		REFERENCES professor(idProfessor));
    
-- 2

INSERT INTO professor(nome, disciplina) VALUES
	('Vivian', 'Banco de dados'),
    ('Caio', 'Algoritmos'),
    ('Fernando', 'Pesquisa & Inovação');
    
INSERT INTO grupo(nome, descricao) VALUES
	('ASL', 'Monitoramento industrial'),
    ('Lux Max', 'Monitoramento de luz empresarial'),
    ('Estufas Nature', 'Monitoramento de umidade em estufas');
    
INSERT INTO aluno(ra, nome, fkGrupo, email) VALUES
	('01230000', 'Alberto Kennedy', 1, 'alberto@email.com'),
    ('01230001', 'Fernanda Ferreira', 2, 'fefeh@email.com'),
    ('01230002', 'Lucas Santos', 1, 'lucas@email.com'),
    ('01230003', 'Polly Plantar', 3, 'polly@email.com'),
    ('01230004', 'Sprig Plantar', 3, 'sprig@email.com'),
    ('01230005', 'Gus Sicarius', 2, 'Gus@email.com');
    
    
INSERT INTO avaliacao(fkProfessor, fkGrupo, nota, dtAvaliacao) VALUES
	(10000, 1, 5, '2023-07-17 12:30:00'),
    (10001, 1, 6, '2023-05-16 12:00:00'),
	(10002, 2, 10, '2023-02-10 08:30:00'),
    (10002, 3, 8, '2023-07-30 09:30:00'),
	(10001, 3, 9, '2023-11-10 11:30:00'),
    (10000, 3, 5, '2023-09-13 22:30:00'),
	(10000, 2, 10, '2023-12-13 15:30:00'),
    (10002, 1, 6, '2023-01-23 12:30:00');
    
    
-- 3 

SELECT * FROM aluno;

SELECT * FROM professor;

SELECT * FROM grupo;

SELECT * FROM avaliacao;

-- 5

SELECT * FROM aluno
	LEFT JOIN grupo ON fkGrupo = idGrupo;
    
-- 6 

SELECT * FROM grupo
	JOIN aluno ON fkGrupo = idGrupo
    WHERE idGrupo = 2;
    
-- 7 

SELECT fkGrupo, Round(AVG(nota), 2) FROM avaliacao GROUP BY fkGrupo;

-- 8

SELECT fkGrupo, MAX(nota) FROM avaliacao GROUP BY fkGrupo;
SELECT fkGrupo, MIN(nota) FROM avaliacao GROUP BY fkGrupo;

SELECT MAX(nota) FROM avaliacao;
SELECT MIN(nota) FROM avaliacao;

-- 9

SELECT fkGrupo, SUM(nota) FROM avaliacao GROUP BY fkGrupo;

SELECT SUM(nota) FROM avaliacao;

-- 10
SELECT p.nome AS 'Professor', g.idGrupo AS 'Grupo', g.nome, g.descricao, a.dtAvaliacao AS 'Data e horário'
	FROM avaliacao AS a
    JOIN professor AS p ON fkProfessor = idProfessor
	JOIN grupo AS g ON fkGrupo= idGrupo;
    
-- 11

SELECT * FROM professor 
	JOIN avaliacao ON fkProfessor = idProfessor
    JOIN grupo ON fkGrupo = idGrupo
	WHERE fkGrupo = 2;
    
-- 12
SELECT g.nome, g.descricao, p.nome 'Professor' FROM grupo g
	JOIN avaliacao ON fkGrupo = idGrupo
    JOIN professor p ON fkProfessor = idProfessor
    WHERE p.nome = 'Fernando';
    
-- 13

SELECT al.nome 'Aluno', 
	g.idGrupo 'Grupo', 
	g.nome 'Nome do grupo', 
	g.descricao 'Descrição', 
    av.dtAvaliacao 'Avaliado em',
    p.nome 'Professor', 
    av.nota 'Nota'
	FROM grupo g
    JOIN aluno al ON al.fkGrupo = idGrupo
    JOIN avaliacao av ON av.fkGrupo = idGrupo
    JOIN professor p ON fkProfessor = idProfessor
    ORDER BY idGrupo;
    
-- 14

SELECT COUNT(DISTINCT(nota)) QTD FROM avaliacao;

-- 15

SELECT p.nome 'Professor',
	AVG(nota) 'Média',
    SUM(nota) 'Soma das  notas'
    FROM avaliacao
    JOIN professor p ON fkProfessor = idProfessor
    GROUP BY fkProfessor;
    
-- 16
SELECT g.nome 'Grupo',
	AVG(nota) 'Média',
    SUM(nota) 'Soma das  notas'
    FROM grupo g
    JOIN avaliacao ON fkGrupo = idGrupo
    GROUP BY fkGrupo;
    
-- 17

SELECT p.nome 'Professor',
	MIN(nota) 'Menor nota atribuida',
    MAX(nota) 'Maior nota atribuida'
    FROM avaliacao
    JOIN professor p ON fkProfessor = idProfessor
    GROUP BY fkProfessor;
    
-- 18

SELECT g.nome 'Grupo',
	MIN(nota) 'Menor nota',
    MAX(nota) 'Maior nota'
    FROM avaliacao
    JOIN grupo g ON fkGrupo = idGrupo
    GROUP BY fkGrupo;
    