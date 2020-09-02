-- AULA DO DIA 17-08-2020 - Laboratório Lista1 (revisão)

Dicionário de dados do Oracle

Tabela User_tables =>  dados sobre as tabelas criadas

select * from User_tables

Tabela user_tab_columns => dados sobre as colunas de cada tabela criada

select * from user_tab_columns
where table_name = 'TB_CLIENTE';

Tabela user_constraints =>  restrições de cada coluna de cada tabela

Restrições que podem ser definidas ao se criar uma tabela?
PRIMARY KEY
FOREIGN KEY
CHECK 
UNIQUE
NOT NULL
DEFAULT

SELECT * FROM USER_CONSTRAINTS
ORDER BY TABLE_NAME


-- lISTA 1 CRIANDO AS TABELAS

create table Autor
(CodAutor 		number(5) primary key, 
 Nomeautor	 	varchar2(20),
 datanascimento date,
 CidadeNasc  	varchar2(20),
 sexo 			char(1) );
 
 create table Assunto
(CodAssunto		    number(5) primary key,
 descricao  		varchar2(40),
 descontopromocao	 number(4,2));

create table Livros 
(CodigoLivro 	number(5) primary key,
 Titulo			varchar2(30),
 Editora		varchar2(20),
 Cidade		    varchar2(30), 
 DataEdicao		date, 
 Versao		    number(3),
 CodAssunto		number(5),
 Preco		            number(5,2),
 DataCadastro	date,
 lancamento     	Char(1) );

create table AutorLivro
( codigoLivro  number(5) not NULL,
  codAutor 	number(5) not NULL); 

== CRIAR AS CHAVES QUE FALTAM

ALTER TABLE AUTORLIVRO ADD CONSTRAINT PK_AUTORLIVRO_CODLIVRO_CODAUTOR PRIMARY KEY(CODIGOLIVRO,CODAUTOR);

ALTER TABLE AUTORLIVRO ADD CONSTRAINT FK_AUTORLIVRO_CODIGOLIVRO FOREIGN KEY (CODIGOLIVRO) REFERENCES LIVRO;

ALTER TABLE AUTORLIVRO ADD CONSTRAINT FK_AUTORLIVRO_CODAUTOR FOREIGN KEY (CODAUTOR) REFERENCES AUTOR;

-- CRIANDO FK  PARA ASSUNTO

ALTER TABLE LIVROS ADD CONSTRAINT FK_LIVRO_CODASSUNTO FOREIGN KEY (CODASSUNTO) REFERENCES ASSUNTO;


3-	Adicionar uma nova coluna de nome Nacionalidade na tabela Autor.  

ALTER TABLE AUTOR ADD NACIONALIDADE VARCHAR2(25);

4-	Alterar a coluna Titulo da tabela Livros de 30 para 40 posições.

ALTER TABLE LIVROS MODIFY titulo varchar2(40);

5-	 Incluir uma restrição de domínio para a coluna descontopromocao da tabela assunto de 
     forma a aceitar apenas 'S' ou  'N';.

ALTER TABLE ASSUNTO ADD  check  (descontoPromocao in ('S','N' ) );


6-	Alterar  o campo editora da tabela livros mudando para ‘Editora LTC’  para o livro de código 3.
 UPDATE LIVROS
 SET editora = 'EDITORA LTC'
 WHERE CodigoLivro = 3;
 
DML - Insert/update/delete/select
DDL - Create/alter/drop/grant 

7-	Excluir os livros com codassunto igual a 10 e anoedição menor que 1980;

DELETE LIVROS
WHERE CodAssunto = 10 AND TO_CHAR(dataEdicao, 'YYYY')= '1980';

DELETE LIVROS
WHERE CodAssunto = 10 AND dataedicao between '01/01/1980' and '31/12/1980';
