drop table tb_item_pedido
drop table tb_pedido
drop table tb_cliente
drop table tb_produto
drop table tb_vendedor


create table tb_cliente
( codcliente number(5) not null,
  nomecliente varchar2(30) not null,
  endereco varchar2(30),
  cidade varchar2(20),
  cep varchar2(10),
  uf char(2));


create table tb_vendedor
( codvendedor number(5) not null,
  nomevendedor varchar2(30) not null,
  faixa_com    number(4,2),
  salario_fixo number(7,2));


create table tb_produto
( codproduto   number(5) not null,
  descricao varchar(20),
  unid       char(2),
  valor_unit number(6,2));

Create table tB_PEDIDO

( NUMPEDIDO     number(5) NOT NULL,
  PRAZO_ENTREGA DATE,
  CODCLIENTE     number(5),
  CODVENDEDOR   number(5));

CREATE TABLE TB_ITEM_PEDIDO
(NUMPEDIDO   number(5) NOT NULL,
 CODPRODUTO  number(5) NOT NULL,
 QTDE        number(5));


--DEFININDO AS RESTRIÇÕES


ALTER TABLE TB_PEDIDO 
 ADD CONSTRAINT PK_PEDIDO_NUMPEDIDO PRIMARY KEY(NUMPEDIDO);
 
 ALTER TABLE TB_vendedor 
 ADD CONSTRAINT PK_vendedor_codvendedor PRIMARY KEY(codvendedor);
 
  ALTER TABLE TB_cliente 
 ADD CONSTRAINT PK_cliente_codcliente PRIMARY KEY(codcliente);

 ALTER TABLE TB_produto 
 ADD CONSTRAINT PK_produto_codproduto PRIMARY KEY(codproduto);

ALTER TABLE TB_PEDIDO 
 ADD CONSTRAINT FK_PEDIDO_CODCLI FOREIGN KEY(CODCLIENTE) REFERENCES TB_CLIENTE;

ALTER TABLE TB_PEDIDO 
 ADD CONSTRAINT FK_PEDIDO_CODVENDEDOR FOREIGN KEY(CODVENDEDOR) REFERENCES TB_VENDEDOR;

--- ITEM PEDIDO

ALTER TABLE TB_ITEM_PEDIDO ADD CONSTRAint  PK_ITEMPEDIDO_PEDPROD 
 PRIMARY KEY(NUMPEDIDO,CODPRODUTO);


ALTER TABLE TB_ITEM_PEDIDO 
    ADD CONSTRAINT FK_ITEMPEDIDO_NUMPEDIDO FOREIGN KEY(NUMPEDIDO) REFERENCES TB_PEDIDO;

ALTER TABLE TB_ITEM_PEDIDO 
    ADD CONSTRAINT FK_ITEMPEDIDO_CODPRODUTO FOREIGN KEY(CODPRODUTO) REFERENCES TB_PRODUTO;
