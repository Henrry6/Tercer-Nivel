CREATE FUNCTION myFuncion (valor int) RETURNS int AS $$
BEGIN
RETURN valor + 1
END;


$$ LANGUAGE plpgsql

select myFuncion(30);

--Respuesta = 31


--segund el lenguaje depende la estructura de una funcion

--RETORNA VARIOS VALORES
RETURNS SETOF CUENTA

--funcion para generar numeros aletorios entre un rango
CREATE OR REPLACE FUNCTION random_between(low INT, high INT)
RETURNS INT AS
$$
BEGIN
RETURN floor (random()*(high-low + 1) + low);
END;

$$ LANGUAGE 'plpgsql';

select random_between(20, 40)

--
CREATE OR REPLACE  FUNCTION public.f_probar(IN v_cedula_usuario character varying)
 RETURNS TABLE (
      cedulita character varying,
	  clavecita  character varying
)
AS $$
BEGIN
	return query select per.cedula cedula , usu.clave clave from "Usuario"."Usuario" as usu
	join "Personal"."Persona"  as per on usu.cedula_persona = per.cedula
	where per.cedula = v_cedula_usuario;

END;
$$ language 'plpgsql';

drop function f_probar

select f_probar('9356789787')

------------------------------------------------------------------
create function crear_cuenta ( in p_numero_cuenta character varying,
							  in p_id_catalogo integer,
							  in p_id_rol_banco_usuario_cajero integer,
							  in p_id_rol_banco_usuario integer,
							  in p_estado boolean,
							  in p_saldo integer,
							  in p_fecha_apertura date)
returns character varying as
$body$
declare
v_mensaje character varying;
begin

  INSERT INTO "Movimiento"."Cuenta"(
	numero_cuenta, id_catalogo, id_rol_banco_usuario_cajero, id_rol_banco_usuario, estado, saldo, fecha_apertura)
	VALUES (p_numero_cuenta, p_id_catalogo, p_id_rol_banco_usuario_cajero, p_id_rol_banco_usuario, p_estado, p_saldo, p_fecha_apertura);
	v_mensaje='Cuenta creada exitosamente';
return v_mensaje;
end;
$body$
	language plpgsql
	
	select crear_cuenta('2200458216',6 , 601, 1110, 'true', 100, '2021-02-15')

-----------------------------------------------------------------
	create function eliminar_cuenta ( in p_numero_cuenta character varying)
returns character varying as
$body$
declare
v_mensaje character varying;
begin

  delete from "Movimiento"."Cuenta"
  where numero_cuenta=p_numero_cuenta;
	v_mensaje='Cuenta eliminada exitosamente';
return v_mensaje;
end;
$body$
	language plpgsql

	select eliminar_cuenta('2200458216')

----------------------------------------------------------------------
	create function actualizar_cuenta ( in p_numero_cuenta character varying,
							  in p_id_catalogo integer,
							  in p_id_rol_banco_usuario_cajero integer,
							  in p_id_rol_banco_usuario integer,
							  in p_estado boolean,
							  in p_saldo integer,
							  in p_fecha_apertura date)
returns character varying as
$body$
declare
v_mensaje character varying;
begin

  UPDATE "Movimiento"."Cuenta"
	SET id_catalogo=p_id_catalogo, id_rol_banco_usuario_cajero=p_id_rol_banco_usuario_cajero,
	id_rol_banco_usuario=p_id_rol_banco_usuario, estado=p_estado, saldo=p_saldo, fecha_apertura=p_fecha_apertura
	WHERE numero_cuenta=p_numero_cuenta;
	v_mensaje='Cuenta actualizada exitosamente';
return v_mensaje;
end;
$body$
	language plpgsql

	select actualizar_cuenta('2200458216',6 , 601, 1110, 'true', 120, '2021-02-15')
	
	----------------------------------------------------------------
	create function obtener_cuenta ( in p_numero_cuenta character varying)
returns character varying as
$body$
declare
v_mensaje character varying;
begin
	switch ()
	
  SELECT numero_cuenta, id_catalogo, id_rol_banco_usuario_cajero, id_rol_banco_usuario, estado, saldo, fecha_apertura
	FROM "Movimiento"."Cuenta"
	WHERE numero_cuenta=p_numero_cuenta;
	v_mensaje='Obteniendo datos de la cuenta';
return v_mensaje;
end;
$body$
	language plpgsql