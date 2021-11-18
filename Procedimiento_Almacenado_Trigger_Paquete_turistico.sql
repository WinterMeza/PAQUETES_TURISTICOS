--PROCEDIMIENTO ALMACENADO: por parámetro de entrada el nombre del cliente y salga por año
--cuanto paquetes ha comprado y cuanto represento de ganancia a la empresa.

create or replace function ingreso(meter char)
returns table (fecha date,nombre character varying ,cantidad int,precio money)
as
$$
select fecha_pago ,
	nombre_c ,cantidad_pt ,total_pago 
	from paquete_turistico
	inner join cliente on paquete_turistico.id_cliente=cliente.id_cliente
    inner join contratacion on contratacion.id_cliente=cliente.id_cliente
    inner join pago on pago.id_contratacion=contratacion.id_contratacion
where nombre_c = $1
group by fecha_pago,
	nombre_c ,cantidad_pt ,total_pago;
$$
language SQL;
