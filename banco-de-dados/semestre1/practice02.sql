-- 1 ----------------------------------------------------------------------------
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

-- Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE atleta SET qtdMedalha = 2 WHERE idAtleta = 001;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE atleta SET qtdMedalha = 3 WHERE idAtleta IN (002,003);

-- Atualizar o nome do atleta com o id=4;
UPDATE atleta SET nome = 'LUKAS' WHERE idAtleta = 004;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE atleta ADD COLUMN dataNasc date;

-- Atualizar a data de nascimento de todos os atletas;
UPDATE atleta SET dataNasc = '1991-04-13' WHERE idAtleta = 001;
UPDATE atleta SET dataNasc = '1997-01-19' WHERE idAtleta = 002;
UPDATE atleta SET dataNasc = '1998-02-10' WHERE idAtleta = 003;
UPDATE atleta SET dataNasc = '1995-12-23' WHERE idAtleta = 004;
UPDATE atleta SET dataNasc = '2000-06-28' WHERE idAtleta = 005;

-- Excluir o atleta com o id=5;
DELETE FROM atleta WHERE idAtleta = 005;

-- Exibir os atletas onde a modalidade é diferente de natação;
SELECT * FROM atleta WHERE modalidade != 'natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM atleta WHERE qtdMedalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESCRIBE atleta;

-- Limpar os dados da tabela; 
TRUNCATE TABLE atleta;

-- 2 --------------------------------------------------------------------------

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
    (105,'SUMFLOWERR', 'SWAE LEE', 'POP'),
    (106,'MUMBLE RAP', 'BELLY', 'RAP'),
    (107,'CUSTER', 'SLIPKNOT', 'METAL');

 -- Exibir todos os dados da tabela.
 SELECT * FROM musica;
 
-- Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE musica ADD COLUMN curtidas INT;

-- Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE musica SET curtidas = 19878 WHERE idMusica = 101;
UPDATE musica SET curtidas = 13586 WHERE idMusica = 102;
UPDATE musica SET curtidas = 96882 WHERE idMusica = 103;
UPDATE musica SET curtidas = 46643 WHERE idMusica = 104;
UPDATE musica SET curtidas = 28478 WHERE idMusica = 105;
UPDATE musica SET curtidas = 22945 WHERE idMusica = 106;
UPDATE musica SET curtidas = 31374 WHERE idMusica = 107;

-- Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE musica MODIFY artista VARCHAR(80);

-- Atualizar a quantidade de curtidas da música com id=1;
UPDATE musica SET curtidas = 29879 WHERE idMusica = 101;

-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
UPDATE musica SET curtidas = 55757 WHERE idMusica = 102 OR idMusica = 103;

-- Atualizar o nome da música com o id=5;
UPDATE musica SET titulo = 'SUNFLOWER' WHERE idMusica = 105;

-- Excluir a música com o id=4;
DELETE FROM musica WHERE idMusica = 104;

-- Exibir as músicas onde o gênero é diferente de funk;
SELECT * FROM musica WHERE genero <> 'funk';

-- Exibir os dados das músicas que tem curtidas maior ou igual a 20;
SELECT * FROM musica WHERE curtidas >= 20;

-- Descrever os campos da tabela mostrando a atualização do campo artista;
DESCRIBE musica;

-- Limpar os dados da tabela;
TRUNCATE TABLE musica;

-- 3 ----------------------------------------------------------------------------------
	
USE sprint1;

CREATE TABLE filme (
	idFilme INT PRIMARY KEY,
	titulo VARCHAR(50),
	genero VARCHAR(40),
	diretor VARCHAR(40)
);

INSERT INTO filme VALUES 
    (201, 'SPIDERMAN ITSV', 'HEROI', 'SONY PICTURES'),
	(202, 'THE DIRT', 'COMÉDIA', 'NETFLIz'),
    (203, 'RANGO', 'COMÉDIA', 'PARAMOUNT'),    
    (204, 'ORIGEM DOS GUARDIOES', 'ANIMAÇÃO', 'DREAMWORKS'),
    (205, 'CORALINE', 'ANIMAÇÃO', 'LAIKA'),
    (206, 'JOGOS VORAZEz', 'FICÇÃO CIENTIFICA', 'COLOR FORCE'),
    (207, 'METAL LORDS', 'MUSICA', 'NETFLIz');
    
-- Exibir todos os dados da tabela.
SELECT * FROM filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
ALTER TABLE filme ADD COLUMN protagonista VARCHAR(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
UPDATE filme SET protagonista = 'NIKKI SIX' WHERE idFilme = 201;
UPDATE filme SET protagonista = 'MILES MORALES' WHERE idFilme = 202;
UPDATE filme SET protagonista = 'KEVIN SCHLIEB' WHERE idFilme = 203;
UPDATE filme SET protagonista = 'JACK FROST' WHERE idFilme = 204;
UPDATE filme SET protagonista = 'CORALINE' WHERE idFilme = 205;
UPDATE filme SET protagonista = 'KATNISS' WHERE idFilme = 206;
UPDATE filme SET protagonista = 'RANGO' WHERE idFilme = 207;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
ALTER TABLE filme MODIFY diretor VARCHAR(150);

-- Atualizar o diretor do filme com id=5;
UPDATE filme SET diretor = 'LAIKA STUDIO' WHERE  idFilme = 205;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
UPDATE filme SET diretor = 'NETFLIX' WHERE idFilme IN (202,207);

-- Atualizar o título do filme com o id=6;
UPDATE filme SET titulo = 'JOGOS VORAZES' WHERE idFilme = 206;

-- Excluir o filme com o id=3;
DELETE FROM filme WHERE idFilme = 203;

-- Exibir os filmes em que o gênero é diferente de drama;
SELECT * FROM filme WHERE genero != 'DRAMA';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
SELECT * FROM filme WHERE genero = 'SUSPENSE';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
DESCRIBE filme;

-- Limpar os dados da tabela;
TRUNCATE TABLE filme;

-- 4 --------------------------------------------------------------------------
USE sprint1;

CREATE TABLE professor(
	idProfessor INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	especialidade VARCHAR(40),
	dtNasc DATE);
    -- UNIQUE n pode se repetir
    -- DEFAULT 'value vlor padrao'
    -- DATETIME DEFAULT CURRENT_TIMESTAMP insere data do servidor

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

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;
ALTER TABLE professor ADD COLUMN funcao VARCHAR(50), ADD CONSTRAINT professor
	CHECK (funcao = 'ASSISTENTE' OR funcao = 'MONITOR' or funcao = 'TITULAR');
    -- (funcao IN('MONITOR', 'ASSISTENTE', 'TITULAR'))

-- Atualizar os professores inseridos e suas respectivas funções;
UPDATE professor SET funcao = 'ASSISTENTE' WHERE idProfessor = 301;
UPDATE professor SET funcao = 'MONITOR' WHERE idProfessor = 302;
UPDATE professor SET funcao = 'MONITOR' WHERE idProfessor = 303;
UPDATE professor SET funcao = 'TITULAR' WHERE idProfessor = 304;
UPDATE professor SET funcao = 'MONITOR' WHERE idProfessor = 305;
UPDATE professor SET funcao = 'ASSISTENTE' WHERE idProfessor = 306;
UPDATE professor SET funcao = 'TITULAR' WHERE idProfessor = 307;
UPDATE professor SET funcao = 'ASSISTENTE' WHERE idProfessor = 308;


-- Inserir um novo professor;
INSERT INTO professor VALUE
	(309, 'Bianca', 'Francês', '2001-03-02','TITULAR');

-- Excluir o professor onde o idProfessor é igual a 5;
DELETE FROM professor WHERE idProfessor = 305;

-- Exibir apenas os nomes dos professores titulares;
SELECT * FROM professor WHERE funcao = 'TITULAR';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
SELECT especialidade , dtNasc FROM professor;

-- Atualizar a data de nascimento do idProfessor igual a 3;
UPDATE professor SET dtNasc = '1998-11-12' WHERE idProfessor = 303;

-- Limpar a tabela Professor;
TRUNCATE TABLE professor;






-- CONSTRAINT (RESTRIÇÃO/CONFIGURAÇÃO/REGRA)
	-- PRIMARY KEY
    -- FOREIGN KEY
    -- NOT NULL
    -- DEFAULT


-- ALIASES - apelido
-- SELECT funcao AS Função FROM professor;
-- SELECT nome AS professor FROM professor;
-- SELECT nome AS 'lorem ipsum dolor sit' FROM professor;

-- SELECT concat('O email da professora ', nome, ' é ', email) AS frase FROM professor WHERE id= 2;



