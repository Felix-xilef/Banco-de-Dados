/* 1 */
create procedure if not exists p_nasc(in a year)
    select * from aluno where year(datanasc) = a;

/* 2 */
create procedure if not exists p_idadesexo(in i integer, s char(1))
    select * from aluno where timestampdiff(year, datanasc, now()) = i and sexo = s;