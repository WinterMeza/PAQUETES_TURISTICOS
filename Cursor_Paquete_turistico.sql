--CURSOR: por cada agente  se muestre el año, agente, número de paquetes vendidos,
-- cuantos se vendieron en efectivo y en crédito y en otras formas de pago.
do $$
declare 
paquete record;
cur_paq cursor for 
select extract (year from fecha_pago)año,nombre_a,sum(cantidad_pt)
As total_paquetes ,sum(cantidad_p_e) as C_Efectivo, 
sum(cantidad_c) as C_Credito ,sum(cantidad_op) as C_Ofp
from contratacion 
inner join pago on pago.id_contratacion= contratacion.id_contratacion
inner join tipo_pago on pago.id_tipo_p = tipo_pago.id_tipo_p
inner join cliente on contratacion.id_cliente=cliente.id_cliente
inner join paquete_turistico on paquete_turistico.id_cliente=cliente.id_cliente
inner join agente on contratacion.id_agente=agente.id_agente 
group by extract (year from contratacion.fecha_pago) ,
nombre_a order by extract (year from contratacion.fecha_pago) desc ;
begin
open cur_paq ;
fetch cur_paq into paquete ;
while (found)loop raise notice '
AÑO: % |NOMBRE_AGENTE: %|CANTIDAD_PAQUETES_VENDIDOS: %|CANTIDAD_EFECTIVO: %|CANTIDAD_CREDITO: %|CANTIDAD_OFP: %',
paquete.año,
paquete.nombre_a,paquete.total_paquetes ,paquete.C_Efectivo, paquete.C_Credito,paquete.C_Ofp;
fetch cur_paq into paquete ;
end loop;
end $$
language plpgsql;