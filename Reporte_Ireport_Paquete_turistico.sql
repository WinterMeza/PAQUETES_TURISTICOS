--REPORTE EN IREPORT: Diagrama de barra por año el numero de ventas.
select 
extract (year from fecha_pago) año,
cast(sum(total_pago)as numeric) as total 
from pago 
inner join contratacion on pago.id_contratacion=contratacion.id_contratacion group by extract (year from fecha_pago)
order by extract (year from fecha_pago) desc;


