-- tipos de atributos
	-- atributo simples - por ex: genero
	-- atributo composto - deve ser dividido em subpartes
		-- exemplo: endereço (cep, numero, bairro)
	-- atributo monovalorado - apenas um valor
    -- atributo multivalorado - muitos valores
		-- exemplo telefone celular e fixo
	-- atributo identificador - chave primária
    -- atributo derivado - idade
    
-- tipos de entidades
	-- entidade forte - chave primaria simples
    -- entidade fraca - chave primaria composta

-- tipos de relacionamentos
	-- relacionamento forte - entre duas entidades fortes
    -- relacionamento fraco - pelo menos uma entidade fraca
    -- relaciomento recursivo - 1 tabela se relaciona com ela
    
-- criar banco de dados
CREATE DATABASE convenio;
USE convenio;

CREATE TABLE funcionario
	(idFunc INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45), -- + sobrenome = atributo composto
    sobrenome VARCHAR(45),
    emailP VARCHAR(45), -- + emailS = atributo multivalorado
    fkSuper INT, CONSTRAINT fkSupervisor FOREIGN KEY
		(fkSuper) REFERENCES funcionario(idFunc));

INSERT INTO funcionario (nome, emailP) VALUES
	('Garoto','garoto@choc.com');
    
INSERT INTO funcionario (nome, emailP, fkSuper) VALUES
	('Lindt', 'lindt@choc.com', 1),
    ('Cacau Show', 'cacaushow@choc.com', 1),
    ('tomblerone', 'tomblerone@choc.com', 2);
    
SELECT * from funcionario;

-- exibir os funcionarios e seus respectivos supervisores

SELECT f.nome AS NomeFunc,
	s.nome AS NomeSuper
    FROM funcionario AS f
    JOIN funcionario AS s
    ON f.fkSuper = s.idFunc;
    
/*
SELECT f.nome, funcionario.nome
	FROM funcionario AS f
    JOIN funcionario
    ON funcionario.fkSuper = f.idFunc;
*/

CREATE TABLE dependente (
	idDep INT,
    fkFunc INT,
    PRIMARY KEY (idDep, fkFunc),
    nome VARCHAR(45),
    parentesco VARCHAR(45),
    dtNasc DATE, -- idade é um atributo derivado da dtNasc
    CONSTRAINT fkFuncDep FOREIGN KEY (fkFunc)
		REFERENCES funcionario(idFunc));
        
INSERT INTO dependente VALUES
	(1,1,'Lacta', 'irmão', '2000-10-10'),
    (2,1,'Chokito', 'primo', '2000-10-11'),
    (1,2,'Lolo', 'pai', '1950-10-12'),
    (1,3,'Prestigio', 'mãe', '1958-10-12');
    
SELECT * FROM dependente;

SELECT f.nome AS Funcionario,
	s.nome AS Supervisor,
	d.nome AS Dependente
	FROM funcionario AS f
	JOIN funcionario AS s
	ON f.fkSuper = s.idFunc
	JOIN dependente AS d
	ON f.idFunc = d.fkFunc;
    
    
SELECT * FROM funcionario LEFT JOIN dependente
    ON idFunc = fkFunc;
    
SELECT * FROM dependente RIGHT JOIN funcionario
    ON idFunc = fkFunc;
    
SELECT * FROM dependente RIGHT JOIN funcionario
    ON idFunc = fkFunc
    WHERE fkFunc IS NULL;
    
SELECT nome,  TIMESTAMPDIFF(YEAR, dtNasc, NOW()) AS idade
	FROM dependente;
    
SELECT nome,  TIMESTAMPDIFF(DAY, dtNasc, NOW()) AS idade
	FROM dependente;

SELECT nome,  TIMESTAMPDIFF(WEEK, dtNasc, NOW()) AS idade
	FROM dependente;
    
SELECT nome,  TIMESTAMPDIFF(MONTH, dtNasc, NOW()) AS idade
	FROM dependente;
    
DROP DATABASE convenio;