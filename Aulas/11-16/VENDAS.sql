CREATE DATABASE VENDAS;

USE VENDAS;

CREATE TABLE PRODUTO(
   CODPRODUTO INT PRIMARY KEY,
   NOMEPRODUTO VARCHAR(20) NOT NULL,
   PRECO DECIMAL(8,2) DEFAULT 10
   );
   
CREATE TABLE NOTAFISCAL(
   NUMERONOTA NUMERIC(10) PRIMARY KEY,
   DATA DATE,
   VALOR DECIMAL(10,2) DEFAULT 0
   );
   
CREATE TABLE ITEMNOTA(
  NUMERONOTA NUMERIC(10),
  CODPRODUTO INT,
  QUANT INT NOT NULL CHECK (QUANT>0),
  PRIMARY KEY(NUMERONOTA,CODPRODUTO),
  FOREIGN KEY(NUMERONOTA) REFERENCES NOTAFISCAL(NUMERONOTA),
  FOREIGN KEY(CODPRODUTO) REFERENCES PRODUTO(CODPRODUTO)
  );

/* ***** */

/* Reunir dados de item nota com notafiscal e produto */
select it.numnota, nf.data, it.codproduto, p.nomeproduto, p.preco, it.quant, p.preco*it.quant as subtotal from itemnota it, notafiscal nf, produto p where it.numnota = nf.numnota and it.codproduto = p.codproduto;

/* Calcular o valor de cada notafiscal */
select numnota, data, sum(subtotal) as total from v_tudo group by numnota;

create v_tudox as select it.numnota as 'nf', nf.data, it.codproduto as codigo, p.nomeproduto as produto, p.preco, it.quant, p.preco*it.quant as subtotal from itemnota it, notafiscal nf, produto p where it.numnota = nf.numnota and it.codproduto = p.codproduto;

select sum(subtotal) from v_tudox where produto = 'bis';