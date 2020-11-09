CREATE  DATABASE BDEMPRESA;
USE BDEMPRESA;
CREATE TABLE  TABEMPREGADO (
    NumeroEmp  int NOT NULL  primary key ,
    NomeEmp  varchar (30)  NOT NULL ,
    FuncaoEmp  varchar (20) NULL ,
    DepNume  int  NOT NULL ,
    AdmEmp date NOT NULL ,
    SalarioEmp  decimal (10,2)  NULL ,
    ComissaoEmp decimal(10, 2) NULL
 );
insert into tabempregado values
(100,'Matheus Fernandes','balconista',10,'2000-01-01',2000,null),
(110,'Roberto Cardoso','vendedor',10,'2001-01-01',3000,0.05),
(120,'Pedro Henrique Cardoso','estoquista',10,'2001-11-01',1500,null),
(130,'Mariana Menezes','designer',20,'2010-03-01',2500,null),
(140,'Ricardo Pereira','balconista',10,'2005-08-10',1600,null),
(150,'Deise Paternack','vendedor',20,'2008-05-01',3000,0.05),
(160,'Catarina Lima','gerente',10,'2000-01-01',6000,0.1),
(170,'Julio Rodrigues','estoquista',20,'2000-01-01',1500,null),
(180,'Fernando Soares','auxiliar',10,'2018-03-01',1100,null),
(190,'Edson da Silva','programador',10,'2000-01-01',3000,null),
(200,'Matheus Fernandes','programador',30,'2000-01-01',3000,null),
(210,'Ivo Muller','vendedor',20,'2002-01-20',4000,null);

