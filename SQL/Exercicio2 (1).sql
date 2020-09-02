1-
create or replace view dt_retorno
as select c.codmedico, c.codconsulta, (c.dataconsulta + 30) as data_retorno from consulta c
with check option;

2-
create or replace view inf_consulta
as select m.nommedico, c.codconsulta, c.dataconsulta 
from consulta c, medico m
where m.codmedico = c.codmedico
with check option;

3-
create or replace view val_tot_consultas
as select codmedico, sum(valconsulta) as valor_total
from consulta
group by codmedico;

4-
create or replace view media_val_consultas
as select c.codmedico, m.nommedico as nome_medico, avg(c.valconsulta) as valor_medio_consultas
from consulta c, medico m
where m.codmedico = c.codmedico
group by c.codmedico, m.nommedico;

5-
select view_name from user_views
where view_name like '%SOR%';
