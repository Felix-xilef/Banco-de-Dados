/* Atividade */
/* 1 */
select * from aluno;

/* 2 */
desc aluno;

/* 3 */
alter table aluno add telefone char(9) after nome;

/* 4 */
alter table aluno change nome nomealuno varchar(30) not null;

/* 5 */
alter table aluno add check (nota1>=0 and nota1<=10);
/* alter table aluno add check (nota1 between 0 and 10); */

/* 6 */
alter table aluno modify telefone char(9) not null;

/* 7 */
alter table aluno alter sexo set default 'F';

/* 8 */
insert into aluno (nomealuno, telefone, sexo, datanasc, curso, nota1, nota2) values
    ('Vera', '955597676', 'F', '2000-10-26', 'ADS', 5.7, 10),
    ('Rodrigo', '987862548', 'M', '1997-10-01', 'JOG', 9.75, 7.5),
    ('Mario', '965782121', 'M', '1899-01-30', 'JOG', 8.5, 8)
;
/*
insert into aluno values
    (default, 'Vera', '955597676', 'F', '2000-10-26', 'ADS', 5.7, 10),
    (null, 'Rodrigo', '987862548', 'M', '1997-10-01', 'JOG', 9.75, 7.5),
    (default, 'Mario', '965782121', 'M', '1899-01-30', 'JOG', 8.5, 8)
;
*/

/* 9 */
update aluno set nota2=nota2+0.5 where nota2>0 and nota2<6;

/* 10 */
select * from aluno where sobrenome is null or telefone is null;

/* 11 */
update aluno set sobrenome='Clemente' where nomealuno in ('Tania', 'Carmen');

/* 12 */
select distinct curso from aluno;

/* 13 */
select * from aluno where sexo='F' and curso in ('informatica', 'mecanica');

/* 14 */
select * from aluno where nota1 between 5 and 8;

/* 15 */
select nomealuno, sobrenome, telefone from aluno where sobrenome like 'c%';

/* 16 */
select * from aluno order by curso;

/* 17 */
select matricula, nota1, nota2, (nota1+nota2)/2 as media from aluno order by media desc;

/* 18 */
select nomealuno from aluno where matricula=4;
delete from aluno where matricula=4;

/* 19 */
alter table aluno drop telefone;

/* 20 */
select * from aluno where datanasc like '2000%';