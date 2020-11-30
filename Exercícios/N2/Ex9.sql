create database locadora;

use locadora;

create table Cliente (
    idCliente int primary key auto_increment,
    nome varchar(50) not null,
    CPF char(11) not null unique,
    endereco varchar(70),
    fone varchar(13),
    CNH char(11) unique,
    idade int
);

create table Marca (
    idMarca int primary key auto_increment,
    marca varchar(25) not null,
    nacionalidade varchar(25)
);

create table Carro (
    idCarro int primary key auto_increment,
    marca int,
    modelo varchar(25) not null,
    ano year,
    cor varchar(20),
    placa char(7) not null unique,
    nChassi char(17) not null unique,
    foreign key(marca) references Marca(idMarca)
);

create table Aluga (
    idCliente int,
    idCarro int,
    data date not null,
    km int,
    primary key(idCliente, idCarro, data),
    foreign key(idCliente) references Cliente(idCliente),
    foreign key(idCarro) references Carro(idCarro)
);