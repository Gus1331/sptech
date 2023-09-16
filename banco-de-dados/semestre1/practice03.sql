-- 1 ------------------------------------------------------------------
CREATE DATABASE sprint2;

USE sprint2;

CREATE TABLE atleta (
	idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    qtdMedalha INT);
    
INSERT INTO atleta VALUES
	(1000, 'ULISSES', 18),
    (NULL, 'JOAN', 25),
    (NULL, 'LILYAM', 13),
    (NULL, 'WANDA', 30),
    (NULL, 'KONAN', 22),
    (NULL, 'RAIZO', 24);
    
CREATE TABLE pais (
	idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    capital VARCHAR(40));
    
INSERT INTO pais VALUES 
	(2000, 'CANADA', 'OTTWA'),
    (NULL, 'BRASIL', 'BRASILIA'),
    (NULL, 'ESTADOS UNIDOS', 'WASHINGTON'),
    (NULL, 'FRANÇA', 'PARIS');
    
ALTER TABLE atleta ADD COLUMN pais INT;

ALTER TABLE atleta MODIFY COLUMN pais INT, ADD CONSTRAINT fkPais FOREIGN KEY (pais) REFERENCES pais(idPais);

UPDATE atleta SET pais = 2000 WHERE idAtleta = 1000;
UPDATE atleta SET pais = 2000 WHERE idAtleta = 1001;
UPDATE atleta SET pais = 2001 WHERE idAtleta = 1002;
UPDATE atleta SET pais = 2002 WHERE idAtleta = 1003;
UPDATE atleta SET pais = 2003 WHERE idAtleta = 1004;
UPDATE atleta SET pais = 2002 WHERE idAtleta = 1005;
UPDATE atleta SET pais = 2004 WHERE idAtleta = 1006;

SELECT * FROM atleta JOIN pais ON pais = idPais;
SELECT atleta.nome, pais.nome FROM atleta JOIN pais ON pais = idPais;
-- 2 ---------------------------------------------------------

USE sprint2;

CREATE TABLE musica(
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
    ) AUTO_INCREMENT = 4000;
    
INSERT INTO musica VALUES
	(NULL, 'Scared of love', 'Juice WRD','Trap'),
    (NULL, 'Hellraiser', 'Ozzy Osbourne & Mötörhead', 'rock'),
    (NULL, 'Blinks sake', 'Unkown', 'Clássica'),
    (NULL, '16 lines', 'Lil peep', 'Trap'),
    (NULL, 'Life is beatiful', 'Lil peep', 'Trap');
    
CREATE TABLE album (
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(40),
	tipo VARCHAR (7) CONSTRAINT checkTipo CHECK (tipo IN('digital','fisico')),
	dtLançamento DATE
	) AUTO_INCREMENT = 7000;

INSERT INTO album VALUES 
    (NULL, 'Unkown/None/Single', 'digital', '2000-01-01'),
	(NULL, 'Come over when youre sober pt2', 'digital', '2018-11-23'),
    (NULL, 'goodbye & good riddance', 'fisico', '2018-05-25');

-- a)
SELECT * FROM musica;
SELECT * FROM album;

-- b)
ALTER TABLE musica 
	ADD COLUMN album INT, 
	ADD CONSTRAINT fkAlbum 
		FOREIGN KEY (album) 
        REFERENCES album(idAlbum);

-- c)
UPDATE musica SET album = 7000 WHERE idMusica IN (4001, 4002, 4003);
UPDATE musica SET album = 7001 WHERE idMusica IN (4003, 4004);
UPDATE musica SET album = 7002 WHERE idMusica = 4000;

-- d)
SELECT * FROM musica JOIN album ON album = idAlbum;

-- e)
SELECT m.titulo AS 'NOME', 
	a.nome AS 'ÁLBUM' 
    FROM musica AS m 
    JOIN album AS a 
    ON album = idAlbum;
    
-- f)
SELECT m.titulo AS 'NOME',
	a.nome AS 'ÁLBUM' 
	FROM musica AS m 
	JOIN album AS a 
	ON album = idAlbum 
	WHERE album = 7001;


