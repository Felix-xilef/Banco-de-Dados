create database HotelDB;

use HotelDB;

create table Hospede (
    cpf char(11) primary key,
    rg char(10) unique not null,
    nome varchar(50) not null,
    dataNasc date,
    endereco varchar(70)
);

create table Quarto (
    numero char(4) primary key,
    status varchar(10) default 'livre'
);

create table Servico (
    codServico int primary key auto_increment,
    descricao varchar(70) not null,
    valor decimal(5.2) not null check(valor >= 0)
);

create table ProdutoFrigobar (
    codProduto int primary key auto_increment,
    descricao varchar(70) not null,
    valor decimal(5.2) not null check(valor >= 0)
);

create table Reserva (
    numeroQuarto char(3),
    dataEntrada date,
    cpfHospede char(11) not null,
    dataSaida date check(timestampdiff(day, dataEntrada, dataSaida) >= 0),
    primary key(numeroQuarto, dataEntrada),
    foreign key(numeroQuarto) references Quarto(numero),
    foreign key(cpfHospede) references Hospede(cpf)
);

create table Hospedagem (
    numeroQuarto char(3),
    dataEntrada date,
    cpfHospede char(11) not null,
    dataSaida date check(timestampdiff(day, dataEntrada, dataSaida) >= 0),
    valorDiaria decimal(5.2) not null check(valorDiaria >= 0),
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