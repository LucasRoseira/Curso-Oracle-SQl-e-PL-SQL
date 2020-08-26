create table funcionarios (
	ID int not null,
	NOME varchar(50) not null,
	SALARIO decimal(10,2),
	SETOR varchar(30),
	PRIMARY KEY(ID);
);

create sequence ID_FUNC 
START WITH 1
	INCREMENT BY 1
	NOCACHE;


	insert into funcionarios (iD, nome, salario)
	 values (ID_FUNC.NEXT_VAL, 'Pedro', 1000, '');
	insert into funcionarios (iD, nome, salario)
	 values (ID_FUNC.NEXT_VAL, 'Cleiton', 1080, '');
	insert into funcionarios (iD, nome, salario)
	values (ID_FUNC.NEXT_VAL, 'Joao', 1000, '');
	insert into funcionarios (iD, nome, salario)
	values (ID_FUNC.NEXT_VAL, 'Alexandre', 3000, '');
	insert into funcionarios (iD, nome, salario)
	values (ID_FUNC.NEXT_VAL, 'Jose', 2000, '');


--DML UPDATE

UPDATE funcionarios SET salario = 1500
WHERE id = 1;

UPDATE funcionarios SET salario = salario* 1.5
WHERE id = 2;

UPDATE funcionarios SET salario = salario* 1.5, setor = 'TI'

--DML DELETE
DELETE from funcionarios 
where ID = 1;

-- Parte 1 CONCEDE-GRANT
-- Cria um login "ALUNO' e dar permissÃµes no banco e objetos
SELECT USER FROM DUAL;
-- Concedendo Acesso DE ATUALIZACAO PARA ALUNO.
GRANT UPDATE  ON ALUNO.FUNCIONARIOS TO ALUNO;

-- Concedendo Acesso DE ATUALIZACAO PARA ALUNO COM WITH ADMIN OPTION
-- usuário ALUNO pode estender seus privilégios de sistema para outros usuários.
GRANT create session,create table,create view TO ALUNO WITH ADMIN OPTION;

-- Concedendo Acesso DE UPDATE,SELECT PARA ALUNO NA TABELA SENSO
GRANT SELECT,UPDATE  ON ALUNO.SENSO TO ALUNO;

-- Concedendo Acesso DE INSERT,DELETE PARA ALUNO EM TODOS OBJETOS
GRANT INSERT,DELETE  ON ALUNO.SENSO TO ALUNO;

-- Concedendo Acesso DE INSERT,DELETE PARA ALUNO EM TODOS OBJETOS
GRANT CREATE PROCEDURE,CREATE VIEW TO ALUNO;

-- DICA PARA GERAR GRANTS PARA MUITOS OBJETOS;
select 'GRANT ALL ON ' || object_name || ' TO ALUNO;' AS RETORNO
   FROM user_objects;
   
select 'GRANT UPDATE ON  ' || object_name || ' TO ALUNO;' AS RETORNO
   FROM user_objects
   WHERE OBJECT_TYPE='TABLE';

SELECT * FROM user_objects;
   
--EXEMPLO
GRANT UPDATE ON HELP TO ALUNO;
   
--SELECT * FROM user_objects

-- Concedendo Acesso DE DELETE PARA ALUNO.
GRANT DELETE  ON ALUNO.FUNCIONARIOS TO ALUNO;


-- Concedendo Acesso DE DELETE PARA ALUNO EM TODOS OBJETOS
GRANT DELETE  ON ALUNO.SENSO TO ALUNO;


-- Concedendo Acesso DE INSERT PARA ALUNO.
GRANT INSERT  ON ALUNO.FUNCIONARIOS TO ALUNO;


-- Concedendo Acesso DE SELECT  PARA ALUNO.
GRANT SELECT  ON ALUNO.FUNCIONARIOS TO ALUNO;


-- Concedendo Acesso DE SELECT e INSERT PARA ALUNO.
GRANT SELECT, INSERT ON ALUNO.FUNCIONARIOS TO ALUNO;


-- Concedendo  com limitaÃ§Ã£o de campos
GRANT INSERT (NOME,SETOR) ON ALUNO.FUNCIONARIOS TO ALUNO;

GRANT UPDATE (NOME,SETOR) ON ALUNO.FUNCIONARIOS TO ALUNO;



-- Concedendo Acesso PARA EXCUTAR PROC proc_quadrado PARA ALUNO.
GRANT EXECUTE ON ALUNO.proc_quadrado TO ALUNO;


-- CONCENDENDO TODOS ACESSOS A TODOS OBJETOS
GRANT ALL  ON ALUNO.FUNCIONARIOS TO ALUNO;


--
-- VERIFICANDO PREVILEGIOS
-- VERIFICAR PELO SYSTEM

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE LIKE 'ALUNO';

SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE LIKE 'ALUNO';


SELECT * FROM USER_TAB_PRIVS WHERE GRANTEE LIKE 'ALUNO';

