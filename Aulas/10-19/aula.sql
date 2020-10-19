create database if not exists aulaConcessionaria;
use aulaConcessionaria;

create table Marca (
    idMarca int primary key auto_increment,
    NomeMarca varchar(30) not null
);

create table Modelo (
    idModelo int auto_increment,
    idMarca int,
    NomeModelo varchar(30) not null,
    primary key (idModelo, idMarca),
    foreign key (idMarca) references Marca (idMarca)
);

create table Categoria (
    idCategoria int primary key auto_increment,
    DescricaoCategoria varchar(70) not null
);

create table Veiculo (
    placa char(7) primary key,
    cor varchar(10) default 'preto',
    anofabricacao year,
    idCategoria int,
    idModelo int,
    idMarca int,
    foreign key (idCategoria) references Categoria (idCategoria),
    foreign key (idModelo) references Modelo (idModelo),
    foreign key (idMarca) references Modelo (idMarca)
);

create table Proprietario (
    idProprietario int primary key auto_increment,
    NomeProprietario varchar(50) not null,
    EnderecoProprietario varchar(100) not null,
    RG char(10),
    CPF char(11) unique
);

create table Propriedade (
    placa char(7),
    idProprietario int,
    DataCompra date not null,
    primary key (placa, idProprietario),
    foreign key (placa) references Veiculo (placa),
    foreign key (idProprietario) references Proprietario (idProprietario)
);