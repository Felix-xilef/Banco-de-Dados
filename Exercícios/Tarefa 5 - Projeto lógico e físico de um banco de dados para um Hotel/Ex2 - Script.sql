create database HotelDB;

use HotelDB;

create table Hospede (
    cpf char(11) primary key,
    rg char(10) unique not null,
    nome varchar(50) not null,
    dataNasc data,
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
    valorDiaria decimal(5.2) not null check(valor >= 0),
    primary key(numeroQuarto, dataEntrada),
    foreign key(numeroQuarto) references Quarto(numero),
    foreign key(cpfHospede) references Hospede(cpf)
);

create table Solicitacao (
    
);

create table Consumo (

);