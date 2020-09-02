
1.	Crie uma visão que possua: Código do medico,código do paciente e a data da consulta acrescentada em 30 dias (retorno).

CREATE OR REPLACE VIEW dataRetorno
AS SELECT c.codmedico, c.codpaciente, (c.dataconsulta + 30) 
AS dataRetorno
FROM consulta c
WITH CHECK option;
/* ___________________________________________________________________________________________________________*/

2.	Crie uma visão que possua: nome do medico,código da consulta e  dataconsulta.

CREATE OR REPLACE VIEW dataConsulta
AS SELECT m.nommedico, c.codconsulta, c.dataconsulta 
FROM consulta c, medico m
WHERE m.codmedico = c.codmedico
WITH CHECK option;

/* ___________________________________________________________________________________________________________*/

3.	Crie uma visão que exiba o código do medico e o valor total de suas consultas

CREATE OR REPLACE VIEW valorTotConsultas
AS SELECT codmedico, sum(valconsulta) 
AS valorTotal
FROM consulta
GROUP BY codmedico;;
/* ___________________________________________________________________________________________________________*/

4.	Crie uma visão que exiba o código do medico, o nome do medico  e o valor médio de suas consultas

CREATE OR REPLACE VIEW media_val_consultas
AS SELECT c.codmedico, m.nommedico AS nome_medico, avg(c.valconsulta) AS valor_medio_consultas
FROM consulta c, medico m
WHERE m.codmedico = c.codmedico;
/* ___________________________________________________________________________________________________________*/

5.	Lista o nome de todas as visões que tem a string “SOR’ no nome

SELECT view_name FROM user_views
WHERE view_name LIKE '%SOR%';
