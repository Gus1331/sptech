-- criar usuário jogador
-- jogador senha: copadobrasil
-- treinador senha: #gf20233

CREATE USER 'jogador'@'localhost' 
	IDENTIFIED BY 'copadobrasil';
    
-- permissões do usuário
-- permitir todos os comandos
GRANT ALL PRIVILEGES ON bd1adsa.* 
	TO 'jogador'@'localhost';
    
FLUSH PRIVILEGES;

-- retirar as permissões
REVOKE ALL PRIVILEGES ON bd1adsa.* 
	FROM 'jogador'@'localhost'; -- erro pela versão mas funciona

-- permiir apenas o select
-- SELECT, UPDATE DELETE, INSERT
GRANT SELECT ON bd1adsa.*
	TO 'jogador'@'localhost';