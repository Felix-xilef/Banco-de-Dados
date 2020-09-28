/* Exemplo de Banco de Dados */
CREATE DATABASE aula1; /* Cria um novo banco de dados de nome aula1 */
USE aula1; /* conecta com o banco aula1 */

CREATE TABLE t1(
    matricula int PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE t2(
    sigla CHAR(2) PRIMARY KEY,
    estado VARCHAR(25) not NULL
);

show tables; /* Mostra as tabelas do banco */

describe t1; /* Mostra a estrutura da tabela */
DESC t2; /* idem */