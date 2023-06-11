use la_costa_en_tu_casa;

delimiter //
create trigger eliminar_venta
Before delete on venta
for each row
begin
	delete from plato_has_venta where plato_has_venta.id_Venta=old.id_Venta;
end
//

delete from venta where id_Venta=2;
select * from venta;
select * from plato_has_venta;

delimiter //
create trigger actualizar_sucursal
after insert on empleado_laboral
for each row
begin
	update sucursal set sucursal.numero_empleados = (sucursal.numero_empleados + 1) where new.id_Sucursal = sucursal.id_Sucursal;
end
//

select * from sucursal; #26 en sucursal 9

insert into empleado_laboral
values (10000100, 'Nestor', 'Jeffrey', '+63 (560) 928-8693', 'Luster', '2004-02-04', 'kschimon9@nps.gov', 2, 9, 1);

#27 en sucursal 9
