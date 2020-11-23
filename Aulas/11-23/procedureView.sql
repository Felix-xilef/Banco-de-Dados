delimiter %

create procedure cursomedia (in c varchar(15), m numeric(5,2), out x integer)
begin
    select * from alunos_view where curso = c and media >= m;
    set x = (select count(*) from alunos_view where curso = c and media >= m);
end%

delimiter ;