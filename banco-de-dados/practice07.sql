CREATE DATABASE AlunoProjeto;

USE AlunoProjeto;

CREATE TABLE projeto (
	idProj INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(45));
    
CREATE TABLE aluno (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tel CHAR(15),
    fkProjeto INT,
    fkAluno INT,
    CONSTRAINT fkProj FOREIGN KEY (fkProjeto)
		REFERENCES projeto(idProj),
	CONSTRAINT fkAlun FOREIGN KEY (fkAluno)
		REFERENCES aluno (idAluno));
        
CREATE TABLE acompanhantes (
	idAcomp INT AUTO_INCREMENT,
    fkAluno INT, 
    nome VARCHAR(45),
    relacao VARCHAR(45),
    PRIMARY KEY (idAcomp, fkAluno),
    CONSTRAINT AlunoAcompanhante FOREIGN KEY (fkAluno)
		REFERENCES aluno(idAluno));
        
INSERT INTO projeto VALUES
	(NULL, 'Vida sustentável', 'Um projeto que incentiva o meio ambiente'),
    (NULL, 'Tecnologia hoje', 'Um projeto que investe em soluções IT');

INSERT INTO aluno VALUES 
	(NULL, 'Jonathan', '99 9999-9999', 1, NULL),
    (NULL, 'Barbara', '99 9999-9999', 2, NULL);
    
INSERT INTO aluno VALUES 
	(NULL, 'Nancy', '99 9999-9999', 1, 1),
    (NULL, 'Steve', '99 9999-9999', 1, 1),
	(NULL, 'Mike', '99 9999-9999', 2, 2),
    (NULL, 'Lucas', '99 9999-9999', 2, 2);
    
INSERT INTO acompanhantes VALUES
	(NULL, 5, 'Jane', 'namorada'),
    (NULL, 5, 'William', 'amigo'),
    (NULL, 6, 'Erica', 'irmã');

SELECT * FROM projeto;
SELECT * FROM aluno;
SELECT * FROM acompanhantes;

SELECT * FROM aluno JOIN projeto
	ON fkProjeto = idProj;
    
SELECT * FROM aluno LEFT JOIN acompanhantes
	ON idAluno = acompanhantes.fkAluno;
    
SELECT * FROM aluno AS membro LEFT JOIN aluno AS representante
	ON membro.fkAluno = representante.idAluno;
    
SELECT * FROM aluno JOIN projeto
	ON fkProjeto = idProj
    WHERE projeto.nome = "Tecnologia hoje";
    
SELECT * FROM aluno AS al LEFT JOIN acompanhantes AS ac
	ON al.idAluno = ac.fkAluno
    JOIN projeto AS pr
    ON al.fkProjeto = pr.idProj;
    
SELECT al.nome AS Aluno, re.nome AS Representante, ac.nome AS Acompanhante, pr.nome AS Projeto
	FROM aluno AS al LEFT JOIN aluno AS re
    ON al.fkAluno = re.idAluno
    LEFT JOIN acompanhantes AS ac
	ON al.idAluno = ac.fkAluno
    JOIN projeto AS pr
    ON al.fkProjeto = pr.idProj;
    
DROP DATABASE alunoprojeto;
-- 2 ------------------------------------------------------------------------------------------------------

CREATE DATABASE Campanha;
USE Campanha;

CREATE TABLE organizador (
	orgId INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rua VARCHAR(45),
    bairro VARCHAR(45),
    email VARCHAR(45),
    orgFk INT,
	CONSTRAINT organizadorFK FOREIGN KEY (orgFK)
		REFERENCES organizador(orgId))AUTO_INCREMENT = 30;
        
CREATE TABLE campanha (
	campId INT AUTO_INCREMENT,
	orgFK INT,
    PRIMARY KEY (campId, orgFk),
	categoria VARCHAR(45),
    instituicao1 VARCHAR(45),
    instituicao2 VARCHAR(45),
	CONSTRAINT organizadorCampanhaFk FOREIGN KEY (orgFk)
		REFERENCES organizador(orgId))AUTO_INCREMENT = 500;
        
INSERT INTO organizador(nome, rua, bairro, email) VALUES
	('Fabia', 'Rua guerras sagradas', 'Jardim yen', 'fabia@email.com'),
    ('Holland', 'Rua merry-go-round', 'Jardim thunderstruck', 'holland@email.com');

INSERT INTO organizador(nome, rua, bairro, email, orgFk) VALUES
	('Paul', 'Rua torta de cereja', 'Koolaid', 'paul@email.com', 31),
    ('Carol', 'Rua voodoo', 'Bat country', 'carol@email.com', 31);
    
INSERT INTO campanha (orgFk, categoria, instituicao1, instituicao2) VALUES
	(30, 'alimento', 'instituição A', NULL),
    (31, 'alimento', 'instituição B', NULL),
    (31, 'produto de higiene', 'instituição C', 'instituicao Z'),
    (32, 'máscaras de proteção', 'instituição D', NULL),
    (33, 'alimento', 'instituição E', 'instituicao Y'),
    (33, 'produto de higiene', 'instituição F', NULL);

SELECT * FROM organizador;
SELECT * FROM campanha;
    
SELECT * FROM organizador org JOIN campanha cam
	ON cam.orgFk = org.orgId
    WHERE org.nome = 'Carol';

SELECT * FROM organizador orgNovato LEFT JOIN organizador orgOrientador
	ON orgNovato.orgFk = orgOrientador.orgId;

SELECT * FROM organizador orgNovato LEFT JOIN organizador orgOrientador
	ON orgNovato.orgFk = orgOrientador.orgId
    WHERE orgOrientador.nome = 'Holland';
    
SELECT * FROM organizador orgNovato JOIN campanha cam
	ON cam.orgFk = orgNovato.orgId
	LEFT JOIN organizador orgOrientador
	ON orgNovato.orgFk = orgOrientador.orgId;

-- i) versão 2
SELECT orgNovato.nome 'Organizador', cam.categoria 'Categoria', 
	cam.instituicao1 'Instituição 1', cam.instituicao2'Instituição 2', orgOrientador.nome 'Orientador'
	FROM organizador orgNovato JOIN campanha cam
	ON cam.orgFk = orgNovato.orgId
	LEFT JOIN organizador orgOrientador
	ON orgNovato.orgFk = orgOrientador.orgId;
    
SELECT * FROM organizador orgNovato JOIN campanha cam
	ON cam.orgFk = orgNovato.orgId
	LEFT JOIN organizador orgOrientador
	ON orgNovato.orgFk = orgOrientador.orgId
    WHERE orgNovato.nome = 'Paul';

DROP DATABASE Campanha;