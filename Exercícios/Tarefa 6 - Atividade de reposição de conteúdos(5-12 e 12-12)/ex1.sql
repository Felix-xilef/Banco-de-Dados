use vendas;

/* Exercício a */
delimiter @
create trigger insertNota_1a after insert on itemnota for each row
begin
    update produto set estoque = estoque - new.quant where produto.codproduto = new.codproduto;
    update notafiscal set valor = valor + (select preco from produto where produto.codproduto = new.codproduto) * quant where notafiscal.numeronota = new.numeronota;
end@
delimiter ;

/* Exercício b */
delimiter @
create trigger delNota_1b before delete on itemnota for each row
begin
    update produto set estoque = estoque + old.quant where produto.codproduto = old.codproduto;
    update notafiscal set valor = valor - (select preco from produto where produto.codproduto = old.codproduto) * quant where notafiscal.numeronota = old.numeronota;
end@
delimiter ;

/* Exercício c */
delimiter @
create trigger updateNota_1c before update on itemnota for each row
begin
    update produto set estoque = estoque + (old.quant - new.quant) where produto.codproduto = old.codproduto;
    update notafiscal set valor = valor - (select preco from produto where produto.codproduto = old.codproduto) * (old.quant - new.quant) where notafiscal.numeronota = old.numeronota;
end@
delimiter ;