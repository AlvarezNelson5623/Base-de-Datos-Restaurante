use la_costa_en_tu_casa;

select * from ciudad where id_ciudad=3;

select * from departamento where nombre like "A%";

select * from empleado_laboral order by nombres ASC;

update plato set nombre = "Tomates" where id_plato = 5;

select  MIN(salario_mensual) from tipo_empleado; 

select AVG(valor_ganancia) from venta;

select * from venta where fecha  between "2022-06-10" and "2022-07-30";

select plato_has_venta.id_Plato, plato.nombre as nombrePlato, id_venta, plato_has_venta.cantidad 
from plato_has_venta inner join plato on plato.id_plato=plato_has_venta.id_plato;

-- ----------------------------------------------

SET GLOBAL log_bin_trust_function_creators = 1; 

delimiter //
create function numero_de_ventas()
	returns varchar(100)
begin
	declare num int unsigned;
    declare output varchar(100);
    set num = (select count(*) from venta);
    set output= (select concat("Numero de ventas: ", num));
    
    return output;
end
//

select numero_de_ventas();

delimiter //
create procedure listarEmpleados(in ordenarPor varchar(10))
Begin
if ordenarPor = "ASC" then
	select * from empleado_laboral order by nombres ASC;
elseif ordenarPor = "DESC" then
	select * from empleado_laboral order by nombres DESC;
end if;
end
//

Call listarEmpleados("DESC");
