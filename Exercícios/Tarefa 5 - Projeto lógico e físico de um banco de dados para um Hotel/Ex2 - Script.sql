/* Exercício a */
create database HotelDB;

use HotelDB;

/* Exercício b */
create table Hospede (
    cpf char(11) primary key,
    rg char(10) unique not null,
    nome varchar(50) not null,
    dataNasc date,
    endereco varchar(70)
);

create table Quarto (
    numero int primary key,
    status varchar(10) default 'livre'
);

create table Servico (
    codServico int primary key auto_increment,
    descricao varchar(70) not null,
    valor numeric(5,2) not null check(valor >= 0)
);

create table ProdutoFrigobar (
    codProduto int primary key auto_increment,
    descricao varchar(70) not null,
    valor numeric(5,2) not null check(valor >= 0)
);

create table Reserva (
    numeroQuarto int,
    dataEntrada date,
    cpfHospede char(11) not null,
    dataSaida date check(timestampdiff(day, dataEntrada, dataSaida) >= 0),
    primary key(numeroQuarto, dataEntrada),
    foreign key(numeroQuarto) references Quarto(numero),
    foreign key(cpfHospede) references Hospede(cpf)
);

create table Hospedagem (
    numeroQuarto int,
    dataEntrada date,
    cpfHospede char(11) not null,
    dataSaida date check(timestampdiff(day, dataEntrada, dataSaida) >= 0),
    valorDiaria numeric(5,2) not null check(valorDiaria >= 0),
    codHospedagem int not null unique auto_increment,
    primary key(numeroQuarto, dataEntrada),
    foreign key(numeroQuarto) references Quarto(numero),
    foreign key(cpfHospede) references Hospede(cpf)
);

create table Solicitacao (
    codHospedagem int,
    dataHora datetime,
    codSolicitacao int not null unique auto_increment,
    nomeSolicitante varchar(50) not null,
    primary key(codHospedagem, dataHora),
    foreign key(codHospedagem) references Hospedagem(codHospedagem)
);

create table Consumo (
    codHospedagem int,
    dataHora datetime,
    codConsumo int not null unique auto_increment,
    nomeSolicitante varchar(50) not null,
    primary key(codHospedagem, dataHora),
    foreign key(codHospedagem) references Hospedagem(codHospedagem)
);

create table SolicitacaoServico (
    codSolicitacao int,
    codServico int,
    quantidade int not null default 1,
    dataRealizacao date,
    primary key(codSolicitacao, codServico),
    foreign key(codSolicitacao) references Solicitacao(codSolicitacao),
    foreign key(codServico) references Servico(codServico)
);

create table ConsumoProduto (
    codConsumo int,
    codProduto int,
    quantidade int not null default 1,
    primary key(codConsumo, codProduto),
    foreign key(codConsumo) references Consumo(codConsumo),
    foreign key(codProduto) references ProdutoFrigobar(codProduto)
);

/* Exercício c */
create view v_hospedagem as select numeroQuarto, dataEntrada, dataSaida, nome as nomeHospede, cpfHospede, valorDiaria, timestampdiff(day, dataEntrada, dataSaida)*valorDiaria as TotalDiariasPrevisto  from Hospedagem left join Hospede on cpfHospede = cpf;

create view v_solicitacoes as select cpfHospede, dataHora, nomeSolicitante, descricao, valor, quantidade, (valor*quantidade) as total from Solicitacao s left join Hospedagem h on s.codHospedagem = h.codHospedagem left join SolicitacaoServico ss on s.codSolicitacao = ss.codSolicitacao left join Servico serv on ss.codServico = serv.codServico;

create view v_consumos as select cpfHospede, dataHora, nomeSolicitante, descricao, valor, quantidade, (valor*quantidade) as total from Consumo c left join Hospedagem h on c.codHospedagem = h.codHospedagem left join ConsumoProduto cp on c.codConsumo = cp.codConsumo left join ProdutoFrigobar pf on cp.codProduto = pf.codProduto;

/* Exercício e */
insert into Hospede values
    ('31415926536', '562951413', 'Pedrinho Inquieto', '1996-10-05', 'Rua das pamonhas, 422, São Paulo, SP'),
    ('56977820014', '446687452', 'Maria Rodrigues', '1984-04-25', 'Rua caleigos, 22, São Paulo, SP'),
    ('44689952143', '555478299', 'Laura Morton', '2000-11-06', 'Av. burgmuller, 101, Santo André, SP')
;

/* Exercício f */
insert into Quarto values
    (1001, 'oculpado'),
    (1002, default),
    (1003, 'oculpado'),
    (1004, default)
;

/* Exercício g */
insert into ProdutoFrigobar values
    (default, 'Refrigerante 300ml', 3.5),
    (default, 'Água garrafa 650ml', 2.5),
    (default, 'Chocolate Nestle 50g', 3)
;

/* Exercício h */
insert into Reserva values
    (1001, '2021-01-06', '31415926536', '2021-01-11'),
    (1004, '2020-12-13', '44689952143', '2020-12-18')
;

/* Exercício i */
insert into Hospedagem values
    (1003, '2020-11-20', '31415926536', '2020-11-25', 95.5, default),
    (1001, '2020-11-23', '56977820014', '2020-11-30', 105.5, default)
;

/* Exercício j */
insert into Servico values
    (default, 'Troca extra de toalha', 5),
    (default, 'Lavagem de roupas 10 peças', 9.9),
    (default, 'Lavagem de roupas 1kg', 15)
;