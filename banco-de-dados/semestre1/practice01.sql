-- 1 ----------------------------
CREATE DATABASE sprint1;

CREATE TABLE atleta(
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT);

INSERT INTO atleta VALUES
	(001, 'RAFAEL', 'Basquete', 5),
    (002, 'AYLLE', 'Volley', 7),
    (003, 'DIEGO', 'Handbol', 0),
    (004, 'LUCAS', 'Corrida', 13),
    (005, 'BRUNA', 'Corrida', 26);
    
-- Exibir todos os dados da tabela.
SELECT * FROM atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
SELECT nome, qtdMedalha FROM atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
SELECT * FROM  atleta WHERE modalidade LIKE 'Corrida';

-- Exibir os dados da tabela ordenados pela modalidade
SELECT * FROM atleta ORDER BY modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
SELECT * FROM atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM atleta WHERE nome LIKE '%S%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
SELECT * FROM atleta WHERE nome LIKE 'B%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o
SELECT * FROM atleta WHERE nome LIKE '%o';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r
SELECT * FROM atleta WHERE nome LIKE '%r_';

-- Eliminar a tabela
DROP TABLE atleta;

-- 2 --------------------------
USE sprint1;

CREATE TABLE musica (
	idMusica INT PRIMARY KEY,
	titulo VARCHAR(40),
	artista VARCHAR(40),
    genero VARCHAR(40));
    
INSERT INTO musica VALUES 
	(101,'HOLY WARS', 'MEGADETH', 'METAL'),
    (102,'TURBO LOVER', 'JUDASPRIEST', 'ROCK'),
    (103,'KICKSTART MY HEART', 'MÖTLEY CRÜE', 'ROCK'),
    (104,"'TIL WE DIE", 'SLIPKNOT', 'ROCK'),
    (105,'SUNFLOWER', 'SWAE LEE', 'POP'),
    (106,'MUMBLE RAP', 'BELLY', 'RAP'),
    (107,'CUSTER', 'SLIPKNOT', 'METAL');
    
    
-- Exibir todos os dados da tabela.
SELECT * FROM musica;

-- Exibir apenas os títulos e os artistas das músicas.
SELECT titulo, artista FROM musica;

-- Exibir apenas os dados das músicas de um determinado gênero.
SELECT * FROM musica WHERE genero LIKE 'ROCK';

-- Exibir apenas os dados das músicas de um determinado artista.
SELECT * FROM musica WHERE artista LIKE 'SLIPKNOT';

-- Exibir os dados da tabela ordenados pelo título da música.
SELECT * FROM musica ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
SELECT * FROM musica ORDER BY artista DESC;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
SELECT * FROM musica WHERE titulo LIKE 'K%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
SELECT * FROM musica WHERE artista LIKE '%T';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM musica WHERE genero LIKE '_O%';
-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM musica WHERE titulo LIKE '%I_';
-- Elimine a tabela.
DROP TABLE musica;

-- 3 ----------------------
USE sprint1;

CREATE TABLE filme (
	idFilme INT PRIMARY KEY,
	titulo VARCHAR(50),
	genero VARCHAR(40),
	diretor VARCHAR(40)
);

INSERT INTO filme VALUES 
	(201, 'THE DIRT', 'COMÉDIA', 'NETFLIX'),
    (202, 'SPIDERMAN ITSV', 'HEROI', 'SONY PICTURES'),
    (203, 'METAL LORDS', 'MUSICA', 'NETFLIX'),
    (204, 'ORIGEM DOS GUARDIOES', 'ANIMAÇÃO', 'DREAMWORKS'),
    (205, 'CORALINE', 'ANIMAÇÃO', 'LAIKA STUDIO');
    
-- Exibir todos os dados da tabela.
SELECT * FROM filme;

-- Exibir apenas os títulos e os diretores dos filmes.
SELECT titulo, diretor FROM filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
SELECT * FROM filme WHERE genero LIKE 'ANIMAÇÃO';

-- Exibir apenas os dados dos filmes de um determinado diretor.
SELECT * FROM filme WHERE diretor LIKE 'NETFLIX';

-- Exibir os dados da tabela ordenados pelo título do filme.
SELECT * FROM filme ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
SELECT * FROM filme ORDER BY diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
SELECT * FROM filme WHERE titulo LIKE 'S%';

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
SELECT * FROM filme WHERE diretor LIKE '%O';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM filme WHERE genero LIKE '_U%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM filme WHERE titulo LIKE '%E_';

-- Elimine a tabela.
DROP TABLE filme;

-- 4 ---------------------------
USE sprint1;

CREATE TABLE professor(
	idProfessor INT PRIMARY KEY,
	nome VARCHAR(50),
	especialidade VARCHAR(40),
	dtNasc DATE);

INSERT INTO professor VALUES
	(301, 'Jorge', 'Matemática', '1981-04-13'),
    (302, 'Paula', 'Inglês', '1987-01-19'),
    (303, 'Mirella', 'Inglês', '1998-02-10'),
    (304, 'Alex', 'Educação Fisica', '1985-12-23'),
    (305, 'Carlos', 'Computação', '1991-03-16'),
    (306, 'André', 'Artes', '2000-06-28'),
    (307, 'Rose', 'Quimica', '1974-02-04'),
    (308, 'Roberto', 'Ciências', '1979-07-29');
    
-- Exibir todos os dados da tabela.
SELECT * FROM professor;

-- Exibir apenas as especialidades dos professores.
SELECT especialidade FROM professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT * FROM professor WHERE especialidade LIKE 'Inglês';

-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM professor ORDER BY nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT * FROM professor ORDER BY dtNasc DESC;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
SELECT * FROM professor WHERE nome LIKE 'A%';

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
SELECT * FROM professor WHERE nome LIKE '%A';

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM professor WHERE nome LIKE '_O%';

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM professor WHERE nome LIKE '%L_';

-- Elimine a tabela.
DROP TABLE professor;

-- 5 --------------------------
USE sprint1;

CREATE TABLE curso (
	idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(50));
    
    INSERT INTO curso VALUES
	(401, 'Inglês', 'ING', 'MIRELLA'),
    (402, 'Matemática', 'MAT', 'JORGE'),
    (403, 'Artes', 'ART', 'ANDRÉ'),
    (404, 'Computação', 'COM', 'CARLOS'),
    (405, 'Quimica', 'QUI', 'ROSE'),
    (406, 'Educação Fisica', 'EDF', 'ALEX');
    
-- Exibir todos os dados da tabela.
SELECT * FROM curso;

-- Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM curso WHERE sigla LIKE 'ING';

-- Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM curso ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM curso ORDER BY coordenador DESC;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM curso WHERE nome LIKE 'I%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM curso WHERE  nome LIKE '%A';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM curso  WHERE  nome LIKE '_O%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM curso WHERE nome LIKE '%E_';

-- Elimine a tabela.
DROP TABLE curso;
    
-- 6 ------------------
-- id INT PRIMARY KEY AUTO_INCREMENT (colocar valor NULL)
-- AUTO_INCREMENT = 100 (incrementação apartir de um numero especifico)
USE sprint1;

CREATE TABLE revista (
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
	);

-- INSERT INTO revista VALUES
	-- (1, 'Veja',''),
    -- (NULL, 'Isto é,',''),
    -- (NULL, 'Epoca',''),
    -- (NULL, 'Quatro Rodas,','');
INSERT INTO revista (idRevista, nome) VALUES -- insere apenas colunas especificas
	(1, 'Veja'),
    (NULL, 'Isto é'),
    (NULL, 'Epoca'),
    (NULL, 'Quatro Rodas');
    
-- Exibir todos os dados da tabela.
SELECT * FROM revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
UPDATE revista SET categoria = 'Moda' WHERE idRevista = 1;
UPDATE revista SET categoria = 'Cinema' WHERE idRevista = 2;
UPDATE revista SET categoria = 'Jogos' WHERE idRevista = 3; -- IN (3,4);
UPDATE revista SET categoria = 'Noticias' WHERE idRevista = 4;-- OR idRevista = x
SELECT * FROM revista;

-- Insira mais 3 registros completos.
INSERT INTO revista VALUES
	(NULL, 'Claudia', 'Cosméticos'),
    (NULL, 'Globo', 'Esporte'),
    (NULL, 'Ciência hoje', 'Tecnologia');

-- Exibir novamente os dados da tabela.
SELECT * FROM revista;

-- Exibir a descrição da estrutura da tabela.
DESCRIBE revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
ALTER TABLE revista MODIFY COLUMN categoria VARCHAR(40);
DESCRIBE revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE revista ADD COLUMN periodicidade VARCHAR(15);

-- Exibir os dados da tabela.
SELECT * FROM revista;

-- Excluir a coluna periodicidade da tabela.
ALTER TABLE revista DROP COLUMN periodicidade;

-- EXCLUIR BANCO DE DADOS -------
DROP DATABASE sprint1;

-- decimais são colocados numero de algarimos(totais) , numero de algarismos depois da virgula
-- DECIMAL(7,4) 123,4567
-- DECIMAL(2,1) 1,2

-- limpar tabela
-- TRUNCATE TABLE revista; -- limpa o registro de primary key em autokeyincrement

-- diferente <> / !=