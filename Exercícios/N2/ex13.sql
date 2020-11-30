
create view v_aluga as select cli.nome as Cliente, cli.cnh as CNH, ca.placa as PlacaVeiculo, ca.modelo as Modelo, ca.cor as CorVeiculo, al.data as DataLocacao, al.km as KmNaLocacao from Aluga al left join Cliente cli on al.idCliente = cli.idCliente left join Carro ca on al.idCarro = ca.idCarro;
