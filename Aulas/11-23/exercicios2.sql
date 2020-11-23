delimiter &
/* Adicionar */
create trigger t_venda after insert on itemnota
for each row
begin
declare p numeric(6,2);
    update produto set estoque=estoque-new.quant where codproduto=new.codproduto;
    set p=(select preco from produto where codproduto=new.codproduto)*new.quant;
    update notafiscal set valor=valor+p where numnota=new.numeronota;
end&

/* Excluir */
create trigger t_venda2 before delete on itemnota
for each row
begin
    declare p numeric(6,2);
    update produto set estoque=estoque+old.quant where codproduto=old.codproduto;
    set p=(select preco from produto where codproduto=old.codproduto)*old.quant;
    update notafiscal set valor=valor-p where numnota=old.numeronota;
end&

/* Alterar */
create trigger t_venda3 before update on itemnota
for each row
begin
    declare p numeric(6,2);
    if (old.codproduto = new.codproduto) then
        update produto set estoque = estoque + (new.quant - old.quant) where codproduto = old.codproduto;
        set p = (select preco from produto where codproduto = old.codproduto)*(new.quant - old.quant);
    else
        update produto set estoque = estoque + old.quant where codproduto = old.codproduto;
        update produto set estoque = estoque - new.quant where codproduto = new.codproduto;
        set p = ((select preco from produto where codproduto = new.codproduto) * new.quant) - ((select preco from produto where codproduto = old.codproduto) * old.quant);
    end if;
    update notafiscal set valor=valor+p where numnota=new.numeronota;
end&

delimiter ;