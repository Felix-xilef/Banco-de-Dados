use escola;

/* 1)	Qual o nome e o curso do aluno com maior média? */
select nomealuno, curso from aluno where ((nota1+nota2)/2)=(select max((nota1+nota2)/2) from aluno);

/* 2)	Quais alunos fazem o mesmo curso que o aluno de matricula 8? */
select * from aluno where curso=(select curso from aluno where matricula=8) and matricula<>8;

/* 3)	Quais alunos tem nota1 maior que qualquer (maior nota1) por curso? */
select * from aluno where nota1 > any (select max(nota1) from aluno group by curso);

/* 4)	Quais alunos tem idade igual à idade do Pedro? */
select * from aluno where timestampdiff(year, datanasc, now())=(select timestampdiff(year, datanasc, now()) from aluno where nomealuno='Pedro');

/* 5)	Quais alunos tem media das notas maior que a media das notas por sexo? */
select *, (nota1+nota2)/2 from aluno where (nota1+nota2)/2 > all (select avg((nota1+nota2)/2) from aluno group by sexo);