CREATE DATABASE modelo;
USE modelo;

CREATE TABLE aluno 
	(idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    ra CHAR(8),
    endereco VARCHAR(100),
    sexo CHAR(1),
    cpf CHAR(11),
    dtNascimento DATE,
    fkGrupo INT,
    fkTurma INT,
		CONSTRAINT fkGr FOREIGN KEY (fkGrupo)
			REFERENCES grupo(idGrupo),
		CONSTRAINT fkTr FOREIGN KEY (fkTurma)
			REFERENCES turma(idTurma));
            
CREATE TABLE grupo
	(idGrupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fkTema INT,
		CONSTRAINT fkTe FOREIGN KEY (fkTema)
			REFERENCES tema(idTema));
            
CREATE TABLE tema
	(idTema INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45));
    
CREATE TABLE turma 
	(idTurma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    periodo VARCHAR(45));
    
DESCRIBE aluno;
DESCRIBE turma;
DESCRIBE grupo;
DESCRIBE tema;

INSERT INTO turma VALUES
	(NULL, "1adsa", "Manhã"),
    (NULL, "1adsb", "Manhã"),
	(NULL, "1adsc", "Manhã");
    
INSERT INTO tema VALUES 
	(NULL, "Sensor na industria de vidro"),
    (NULL, "Sensor em bolsas de sangue"),
    (NULL, "Sensor em industria de vacina");
    
INSERT INTO grupo VALUES
	(NULL, "Grupo 1", 1),
    (NULL, "Grupo 2", 2), 
    (NULL, "Grupo 3", 3);

INSERT INTO aluno VALUES 
	(NULL, "Gustavo Oliveira", "01232148", "Rua José Teixeira", "M", "54074022831", "2003-02-10", 1, 1),
    (NULL, "Kauã Ferreira" , "78973652", "Rua Cachoeira", "M", "98647389289", "2004-09-09", 1, 1),
    (NULL, "Gustavo Emerick", "98765432", "Rua Rio", "M", "7987365279", "2003-02-20", 1, 1);

SELECT * FROM aluno;
SELECT * FROM turma;
SELECT * FROM tema;
SELECT * FROM grupo;

SELECT * FROM aluno 
	JOIN turma ON fkTurma = idTurma
	JOIN grupo ON fkGrupo = idGrupo
    JOIN tema ON fkTema = idTema;