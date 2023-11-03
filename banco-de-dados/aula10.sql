-- aula 11
-- relacionamento n:n
-- conceito de  tabela associativa

CREATE DATABASE consultaMedica;
USE consultaMedica;

CREATE TABLE paciente(
	idPaciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45));
    
INSERT INTO paciente (nome) VALUES
	('Chuck'),
    ('Jason'),
    ('Freira');
    
CREATE TABLE medico (
	idMedico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    salario DECIMAL (10,2)) AUTO_INCREMENT = 100;
    
INSERT INTO medico (nome, salario)VALUES
	('Michael', 100.99),
    ('Freddy', 500.99),
    ('Ghostface', 1000.99);
    
SELECT * FROM paciente;
SELECT * FROM medico;

-- criar tabela associativa
-- unir as duas tabelas

CREATE TABLE consulta (
	idConsulta INT,
    fkPaciente INT,
    fkMedico INT,
    PRIMARY KEY (idConsulta, fkPaciente, fkMedico),
    dtConsulta DATETIME, 
    CONSTRAINT fkPacienteConsulta FOREIGN KEY (fkPaciente)
		REFERENCES paciente(idPaciente),
	CONSTRAINT fkMedicoConsulta FOREIGN KEY (fkMedico)
		REFERENCES medico(idMedico));
        
INSERT INTO consulta VALUES
	(1,1,100,'2023-10-31 8:00:00'),
    (2,1,100,'2023-11-07 8:00:00'),
    (1,2,101,'2023-10-31 8:00:00'),
    (1,1,101,'2023-10-31 11:00:00');
    
SELECT * FROM consulta;

SELECT paciente.nome AS 'Paciente',
	medico.nome AS 'Médico',
    consulta.dtConsulta AS 'Consulta'
    FROM consulta
    JOIN paciente ON idPaciente = fkPaciente
    JOIN medico ON idMedico = fkMedico;