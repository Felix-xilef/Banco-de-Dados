use consultorio;

/* Exercício a */
create view v_2a as select count(*), datacons from consulta group by datacons;

/* Exercício b */
create view v_2b as select nomepac, date_format(datanasc, '%d/%m/%Y') as datanasc, timestampdiff(year, datanasc, now()) as idade, nomeconvenio from paciente p, convenio c where p.codconv = c.codconv;

/* Exercício c */
create procedure proc_2c(in nomMed varchar(40))
    select datacons, nomepac, nomeconvenio from  paciente p inner join consulta cs on p.idpaciente = cs.idpaciente inner join convenio cv on p.codconv = cv.codconv where cs.idmedico = (select idmedico from medico where nomemed = nomMed);