-- Exercicio 11

CREATE DATABASE Exercicio11;
USE Exercicio11;

CREATE TABLE Departamento(
	idDepto INT PRIMARY KEY,
    nomeDepto VARCHAR(45),
    fkGerente INT,
    dataInicioGer DATE);
    
CREATE TABLE Funcionario(
	idFunc INT PRIMARY KEY,
    nomeFunc VARCHAR(30),
    salario DECIMAL(8,2),
    sexo CHAR(1),
    fkSupervisor INT,
    dataNasc DATE,
    fkDepto INT,
    CONSTRAINT fkSupervisorFunc FOREIGN KEY (fkSupervisor)
		REFERENCES Funcionario(idFunc),
	CONSTRAINT fkDeptoFunc FOREIGN KEY (fkDepto)
		REFERENCES Departamento(idDepto));
        
CREATE TABLE Projeto (
	idProj INT PRIMARY KEY,
	nomeProj VARCHAR(45),
    localProj VARCHAR(45),
    fkDepto INT,
    CONSTRAINT fkDeptoProj FOREIGN KEY (fkDepto)
		REFERENCES Departamento(idDepto));
        
CREATE TABLE FuncProj (
	fkFunc INT,
    fkProj INT,
    horas DECIMAL(3,1),
    PRIMARY KEY(fkFunc, fkProj),
	CONSTRAINT fkFuncFuncProj FOREIGN KEY (fkFunc)
		REFERENCES Funcionario(idFunc),
	CONSTRAINT fkProjFuncProj FOREIGN KEY (fkProj)
		REFERENCES Projeto(idProj));

INSERT INTO Departamento VALUES
	(105, 'Pesquisa',2 , '2008-05-22'),
    (104, 'Administração', 7, '2015-01-01'),
	(101, 'Matriz', 8, '2001-06-19');
    
INSERT INTO Funcionario VALUES
    (8, 'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

INSERT INTO Funcionario VALUES
	(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
	(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105);

INSERT INTO Funcionario VALUES
	(1, 'Joao Silva', 3500, 'm', 2, '1985-01-09', 105),
    (7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104);
    
INSERT INTO Funcionario VALUES
    (3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
	(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
	(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105);

INSERT INTO Projeto VALUES
	(1, 'Produto X', 'Santo André', 105),
    (2, 'Produto Y', 'Itu', 105),
    (3, 'Produto Z', 'São Paulo', 105),
    (10, 'Informatização', 'Mauá', 104),
    (20, 'Reorganização', 'São Paulo', 101),
    (30, 'Benefícios', 'Mauá', 104);
    
INSERT INTO FuncProj VALUES
	(1, 1, 32.5),
	(1, 2, 7.5),
	(5, 3, 40.0),
	(6, 1, 20.0),
	(6, 2, 20.0),
	(2, 2, 10.0),
	(2, 3, 10.0),
	(2, 1, 10.0),
	(3, 3, 30.0),
	(3, 1, 10.0),
	(7, 1, 35.0),
	(7, 3, 5.0),
	(4, 3, 20.0),
	(4, 2, 15.0),
	(8, 2, NULL);

--  Exibir os dados de cada tabela separadamente (confira se os dados foram inseridos corretamente).

SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM FuncProj;

-- inserir mais o seguinte funcionário na tabela Funcionario:
-- idFunc: null, nomeFunc: Cecília Ribeiro, salario: 2800, sexo: f, fkSupervisor: null, dataNasc: 1980-04-05, fkDepto: 104
-- Conseguiu inserir? Por que?
INSERT INTO Funcionario VALUE (NULL , 'Cecília Ribeiro' , 2800, 'f', NULL, '1980-04-05', 104);
-- Error Code: 1048. Column 'idFunc' cannot be null
-- ID não pode ser nulo quando não se utiliza AUTO_INCREMENT (solução seria colocar id manualmente)

-- Inserir mais o seguinte funcionário na tabela Funcionario:
-- idFunc: 3, nomeFunc: Alice Sousa, salario: 2800, sexo: f, fkSupervisor: 4, dataNasc: 1980-04-05, fkDepto: 104
-- Conseguiu inserir? Por que?
INSERT INTO Funcionario VALUE (3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
-- Error Code: 1062. Duplicate entry '3' for key 'funcionario.PRIMARY'
-- Já existe um funcionário com a ID 3. primary key monovalorada não pode ser duplicada (solução seria adicionar outro id para este funcionario ou atualizar o funcionario ID 3 com estes dados)

--    Inserir mais o seguinte funcionário na tabela Funcionario:
-- idFunc:9, nomeFunc: Cecília Ribeiro, salario: 2800, sexo: f, fkSupervisor: 4, dataNasc: 1980-04-05, fkDepto: 107
-- Conseguiu inserir? Por que?
INSERT INTO Funcionario VALUE (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`exercicio11`.`funcionario`, CONSTRAINT `fkDeptoFunc` FOREIGN KEY (`fkDepto`) REFERENCES `departamento` (`idDepto`))
-- Não existe idDepto 107, erro ao referenciar ele com outra tabela (solução seria inserir depto 107, ou realocar funcionario de depto)

-- Inserir mais o seguinte funcionário na tabela Funcionario:
-- idFunc:9, nomeFunc: Cecília Ribeiro, salario: 2800, sexo: f, fkSupervisor: 4, dataNasc: 1980-04-05, fkDepto: 104
-- Conseguiu inserir? Por que?
INSERT INTO Funcionario VALUE (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
-- 1 row(s) affected
-- Inserido com sucesso, valores batem com template da tabela e relações exteriores

--

-- Excluir a tupla (registro) da tabela FuncProj, em que fkFunc=3 e fkProj = 10.  Conseguiu excluir? Por que?
DELETE FROM FuncProj WHERE fkFunc = 3 AND fkProj = 10;
-- 0 row(s) affected
-- Não existe registro com fkFunc = 3 e fkProj = 10

-- Excluir a tupla da tabela Funcionario, em que idFunc=4. Conseguiu excluir? Por que?
DELETE FROM funcionario WHERE idfunc = 4;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`exercicio11`.`funcproj`, CONSTRAINT `fkFuncFuncProj` FOREIGN KEY (`fkFunc`) REFERENCES `funcionario` (`idFunc`))
-- Não é possivel deletar pois esta dado referencia outro em outra tabela


-- Excluir a tupla da tabela Funcionário, em que idFunc=2. Conseguiu excluir? Por que?
DELETE FROM funcionario WHERE idfunc = 2;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`exercicio11`.`funcproj`, CONSTRAINT `fkFuncFuncProj` FOREIGN KEY (`fkFunc`) REFERENCES `funcionario` (`idFunc`))
-- Não é possivel deletar pois esta dado referencia outro em outra tabela


-- Alterar o salário do Funcionário com idFunc=3 para 2800. Conseguiu alterar? Por que?
UPDATE funcionario SET salario = 2800 WHERE idFunc = 3;
-- 1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0
-- Alterado com sucesso, valores batem com a sintax e tabela criada


-- Alterar o fkDepto do Funcionário com idFunc=3 para 101. Conseguiu alterar? Por que?
UPDATE funcionario SET fkDepto = 101 WHERE idFunc = 3;
-- 1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0
-- Alterado com sucesso, valores batem com a sintax e tabela criada

-- Alterar o fkDepto do Funcionário com idFunc=3 para 107. Conseguiu alterar? Por que?
UPDATE funcionario SET fkDepto = 107 WHERE idFunc = 3;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`exercicio11`.`funcionario`, CONSTRAINT `fkDeptoFunc` FOREIGN KEY (`fkDepto`) REFERENCES `departamento` (`idDepto`))
 -- Não existe departamento com id 107

-- Exibir a data de nascimento e o salário do funcionário João Silva.
SELECT dataNasc, salario FROM funcionario WHERE nomeFunc = 'João Silva';

-- Exibir uma lista apenas dos salários de todos os funcionários.
SELECT salario FROM funcionario;

-- Exibir uma lista apenas dos salários distintos de todos os funcionários.
SELECT DISTINCT(salario) FROM funcionario;

-- Exibir os dados dos funcionários ordenados pelo nome.
SELECT * FROM funcionario ORDER BY nomeFunc;

-- Exibir os dados dos funcionários ordenados pelo salário, de forma decrescente.
SELECT * FROM funcionario ORDER BY salario DESC;

-- Exibir os dados dos funcionários que tenham salário entre 2000 e 4000.
SELECT * FROM funcionario WHERE salario BETWEEN 2000 AND 4000;

-- Exibir os nomes e os salários dos funcionários cujos nomes começam com a letra ‘J’.
SELECT * FROM funcionario WHERE nomefunc LIKE 'j%';

-- Exibir os nomes e os salários dos funcionários cujos nomes terminam com a letra ‘a’.
select * from funcionario where nomefunc like '%a';

-- Exibir os nomes dos funcionários que tem a letra ‘n’ como terceira letra do nome.
select * from funcionario where nomefunc like '__n%';

-- Exibir os nomes e as datas de nascimento dos funcionários cujos nomes tenham a letra ‘S’ como 5ª letra de trás para frente.
select nomefunc, datanasc from funcionario where nomefunc like '%s____';

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa.
select * from funcionario where fkDepto = 105;

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham salário acima de 3500.
select * from funcionario where fkDepto = 105 and salario > 3500;

-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa e que tenham o nome com inicial ‘J’.
select * from funcionario where fkDepto = 105 and nomefunc like 'j%';

select func.idfunc as idFuncionario,
	func.nomefunc as NomeFuncionario,
	sup.idfunc as idSupervisor,
	sup.nomefunc as nomeSupervisor
	From funcionario as func
	join funcionario as sup
    on func.fkSupervisor = sup.idfunc; 
    
    
select p.idproj, p.fkDepto, f.nomeFunc, f.datanasc
	from projeto as p join departamento as d
	on p.fkDepto = d.idDepto
	join funcionario as f on f.idfunc = d.fkGerente 
	where p.fkDepto in (105, 101);

select idfunc, nomeFunc, fkproj, nomeproj, horas
	from funcionario join funcproj
    on idfunc= fkfunc
    join projeto on
    idproj = fkproj;

select count(salario) from funcionario;
    
select count(distinct(localproj)) from projeto;
    
select avg(salario), sum(salario) from funcionario;
    
select min(salario), max(salario) from funcionario;
    
select d.idDepto, avg(salario), sum(salario) from departamento as d
  right join funcionario as f on idFunc = fkGerente 
    group by idDepto;
    
    
select d.idDepto, min(salario) from departamento as d
  right join funcionario as f on idFunc = fkGerente 
    group by idDepto;
    
insert into funcionario values
    (10, 'José da Silva', 1800, 'm', 3, '2000-10-12', null),
    (11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', null);
    
insert into departamento values
    (110, 'RH', 3, '2018-11-10');