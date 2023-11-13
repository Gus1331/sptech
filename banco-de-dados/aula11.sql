-- Aula 12 - 04/05
-- Relacionamento n:n e funções matemáticas

CREATE DATABASE escolaIdiomas;
USE escolaIdiomas;

CREATE TABLE aluno (
idAluno int primary key auto_increment,
nome varchar(45),
bairro varchar(45));

INSERT INTO aluno VALUES
	(null, 'Quatro Braços', 'Cerqueira Cesar'),
	(null, 'Massa Cinzenta', 'Cerqueira Cesar'),
	(null, 'XLR8', 'Paraíso'),
	(null, 'WalkaTruta', 'Paraíso');
    
CREATE TABLE curso (
idCurso int primary key auto_increment,
nome varchar(45))auto_increment = 1000;

INSERT INTO curso VALUES
	(null, 'Inglês'),
	(null, 'Espanhol'),
	(null, 'Mandarim');
    
-- Criando a tabela associativa
CREATE TABLE alunoCurso (
idAlunoCurso int,
fkAluno int,
fkCurso int,
dtMatricula date,
nivel char(2),
nota float,
constraint fkAluno foreign key (fkAluno)
	references aluno(idAluno),
constraint fkCurso foreign key (fkCurso)
	references curso(idCurso),
constraint pkTripla primary key (idAlunoCurso, fkAluno, fkCurso));

SELECT * FROM aluno;
SELECT * FROM curso;
INSERT INTO alunoCurso VALUES
	(1, 1, 1000, '2023-01-01', 'B1', null),
	(2, 1, 1001, '2022-01-01', 'B3', 9.25),
	(1, 2, 1001, '2022-08-01', 'B3', 3.25),
	(1, 3, 1002, '2022-08-01', 'A1', 6),
	(1, 4, 1002, '2022-08-01', 'A1', 8.75);
    
SELECT * FROM aluno JOIN alunoCurso
	ON idAluno = fkAluno
    JOIN curso ON idCurso = fkCurso;
    
INSERT INTO aluno VALUES
	(null, 'Ultra T', 'Consolação');
    
INSERT INTO curso VALUES
	(null, 'Alemão');
    
SELECT * FROM aluno LEFT JOIN alunoCurso
	ON idAluno = fkAluno
    LEFT JOIN curso ON idCurso = fkCurso;
    
SELECT * FROM aluno RIGHT JOIN alunoCurso
	ON idAluno = fkAluno
    RIGHT JOIN curso ON idCurso = fkCurso;
    
SELECT * FROM aluno LEFT JOIN alunoCurso
	ON idAluno = fkAluno
    LEFT JOIN curso ON idCurso = fkCurso
    WHERE fkCurso is null;
    
SELECT * FROM aluno RIGHT JOIN alunoCurso
	ON idAluno = fkAluno
    RIGHT JOIN curso ON idCurso = fkCurso
    WHERE fkAluno is null;
    
SELECT * FROM aluno LEFT JOIN alunoCurso
	ON idAluno = fkAluno
    LEFT JOIN curso ON idCurso = fkCurso
    WHERE fkCurso is null
UNION
SELECT * FROM aluno RIGHT JOIN alunoCurso
	ON idAluno = fkAluno
    RIGHT JOIN curso ON idCurso = fkCurso
    WHERE fkAluno is null;
    
-- FUNÇÕES MATEMÁTICAS
-- COUNT()
SELECT COUNT(*) FROM alunoCurso;
SELECT * FROM alunoCurso;
SELECT COUNT(nota) FROM alunoCurso;

-- SOMA - SUM()
SELECT SUM(nota) FROM alunoCurso;
SELECT SUM(nota)/COUNT(nota) FROM alunoCurso;

-- MÉDIA - average AVG()
SELECT AVG(nota) FROM alunoCurso;

-- ROUND 
SELECT ROUND(AVG(nota),2) FROM alunoCurso;
SELECT ROUND(AVG(nota),3) FROM alunoCurso;

-- TRUNCATE
SELECT TRUNCATE(AVG(nota),2) FROM alunoCurso;
SELECT TRUNCATE(AVG(nota),3) FROM alunoCurso;

-- maior nota MAX()
SELECT MAX(nota) FROM alunoCurso;

-- menor nota MIN()
SELECT MIN(nota) FROM alunoCurso;

SELECT MAX(nota), MIN(nota) FROM alunoCurso;
SELECT MAX(nota) as Maior, 
MIN(nota) as Menor FROM alunoCurso;

SELECT * FROM alunoCurso;

SELECT nivel, AVG(nota) FROM alunoCurso
	GROUP BY nivel;
    
SELECT bairro, avg(nota) FROM aluno
	join alunoCurso on idAluno = fkAluno
    group by bairro;
    
SELECT nome, nota FROM aluno JOIN
alunoCurso ON idAluno = fkAluno
	WHERE nota = (SELECT max(nota) from alunoCurso);
    
SELECT DISTINCT nivel FROM alunoCurso;
SELECT SUM(DISTINCT nota) FROM alunoCurso;

-- -------------------------------------
SELECT * FROM alunoCurso;
SELECT * FROM aluno;

SELECT aluno.nome 'Nome do aluno', COUNT(idAlunoCurso) 'Quantidade de cursos'
	FROM alunoCurso
    JOIN aluno ON fkAluno = idAluno
	GROUP BY aluno.nome;
    
SELECT fkCurso, COUNT(*) qtde
	FROM alunoCurso
    GROUP BY fkCurso;
    
SELECT fkCurso, fkAluno FROM alunoCurso ORDER BY fkCurso;

SELECT al.nome, COUNT(*) qtde
	FROM escolaidiomas.alunoCurso ac
    INNER JOIN escolaidiomas.aluno al ON al.idAluno = ac.fkAluno
    INNER JOIN escolaidiomas.curso cs ON cs.idCurso = ac.fkCurso
    GROUP BY al.nome;
    
-- SUM 
SELECT SUM(nota) FROM  alunoCurso;

SELECT fkAluno, SUM(nota) nota, COUNT(*) qtde
	FROM alunoCurso GROUP BY fkAluno;
    
SELECT SUM(nota) / COUNT(nota) FROM alunoCurso;

SELECT fkAluno,
	SUM(fkAluno) +
	SUM(fkCurso) /
    COUNT(*) qtde
    FROM alunoCurso
    GROUP BY fkAluno;
    
    SELECT * FROM curso;
    SELECT * FROM alunoCurso;
    
SELECT SUM(idCurso) / COUNT(*) FROM curso GROUP BY idCurso;

SELECT fkAluno, SUM(nota) / COUNT(nota) FROM alunoCurso GROUP BY fkAluno;

SELECT AVG(nota) FROM alunoCurso;

SELECT fkAluno, AVG(nota) FROM alunoCurso GROUP BY fkAluno;

SELECT 'Aluno' tipo, fkAluno, AVG(nota) media
	FROM alunoCurso GROUP BY fkAluno
	UNION ALL 
    SELECT 'Curso' tipo, fkCurso, AVG(nota) media
    FROM alunoCurso GROUP BY fkCurso;
    
-- ROUND arredonda

SELECT ROUND(AVG(nota), 2) FROM alunoCurso;
SELECT ROUND(AVG(nota), 1) FROM alunoCurso;
SELECT ROUND(AVG(nota), 0) FROM alunoCurso;
SELECT ROUND(AVG(nota), 9) FROM alunoCurso;

-- TRUNCATE corta as casas
SELECT fkAluno, truncate(nota, 1), nota FROM alunoCurso;

SELECT TRUNCATE(AVG(nota), 2) FROM alunoCurso;
SELECT TRUNCATE(ROUND(AVG(nota), 2), 1) FROM alunoCurso;
SELECT ROUND(5.232, 2), ROUND(5.5, 0);

-- MAX MIN

SELECT MAX(nota), MIN(nota) FROM alunoCurso;

SELECT fkAluno,  MAX(nota), MIN(nota) FROM alunoCurso GROUP BY fkAluno;

SELECT nome, nota
	FROM aluno
    JOIN alunoCurso ON idAluno = fkAluno
    WHERE nota = (SELECT MAX(nota) FROM alunoCurso);
    
-- DISTINCT tira duplicidade

UPDATE alunoCurso set nota = 6 WHERE fkCurso = 1000;

-- primeiro count retora a quantidade de notas que não foram iguais, ex(aluno 1 , nota 6; aluno 2, nota 6 iria contar apenar uma vez)
SELECT COUNT(DISTINCT nota), COUNT(nota) FROM alunoCurso;
    
