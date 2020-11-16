/* Exercícios de Relacionamento entre Tabelas */
/* emp
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| EMPNO   | int(11)      | NO   | PRI | NULL    | auto_increment |
| ENOME   | varchar(40)  | NO   |     | NULL    |                |
| ESAL    | decimal(6,2) | NO   |     | NULL    |                |
| EDATADM | date         | YES  |     | NULL    |                |
| EFUNCAO | char(12)     | NO   |     | NULL    |                |
| DEPTNO  | int(11)      | YES  | MUL | NULL    |                |
+---------+--------------+------+-----+---------+----------------+ */
/* fones_emp
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| EMPNO | int(11)  | NO   | PRI | NULL    |       |
| EFONE | char(12) | NO   | PRI | NULL    |       |
+-------+----------+------+-----+---------+-------+ */
/* depto
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| DEPTNO | int(11)     | NO   | PRI | NULL    | auto_increment |
| DNOME  | varchar(20) | NO   |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+ */
use empresa;

/* Ex 1 */
create view v1 as select empno, enome, esal, date_format(edatadm, '%d/%m/%y') as edatadm, timestampdiff(year, edatadm, now()) as tempoCasa, e.deptno, d.dnome from emp e left join depto d on e.deptno = d.deptno;

select * from v1;

/* Ex 2 */
create view v2 as select enome, count(efone) as qtdTelefone from emp e left join fones_emp f on e.empno = f.empno group by e.empno;

select * from v2;

/* Ex 3 */
create view v3 as select *, round(esal * 1.1, 2) as salarioReajuste from emp;

select * from v3;

show tables;
