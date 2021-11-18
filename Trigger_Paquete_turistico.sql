--TRIGGER: impida que venda a un cliente un tercer paquete  con dos malas referencias (malas visitas) 
--“no se le puede vender un paquete a este cliente
create or replace function tg_vender() returns trigger
as 
$tg_vender$
declare 
malas_r  int;
maximo int=2;
begin
select max(malas_visitas)into malas_r from sastifaccion where malas_visitas=new.malas_visitas;
if (malas_r>maximo ) then
raise EXCEPTION 'ESTE CLIENTE HA EXEDIDO LAS 2 MALAS REFERENCIAS';
else 
raise notice 'PAQUETE VENDIDO CON EXITO';
return new;
end if;
end;
$tg_vender$
language 'plpgsql';
create trigger tg_vender after insert
on sastifaccion for each row
execute procedure tg_vender();
