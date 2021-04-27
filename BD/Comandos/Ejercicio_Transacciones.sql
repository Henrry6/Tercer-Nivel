--PRIMERO
select per.nombre, cue.numero_cuenta, tra.numero_comprobante transaccion, cue.saldo from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tra on tra.numero_cuenta=cue.numero_cuenta

Where 
(cue.numero_cuenta='4689927097')
and (cue.saldo=393) 

where(cue.numero_cuenta='4638630860')
and (cue.saldo=8722) 


--SEGUNDO
INSERT INTO "Movimiento"."Transaccion"(
	numero_comprobante, id_rol_banco_usuario_cajero, numero_cuenta, id_catalogo, id_sucursal, estado, monto, fecha_transaccion, hora_transaccion)
	VALUES (123001, 601, '6292867783', 9, 1, 'true', 10, '2021-02-11', '15:02pm');

INSERT INTO "Movimiento"."Detalle_transaccion"(
	id, id_transaccion, id_catalogo, estado, monto)
	VALUES (123001, 123001, 11, 'true', 10);
	
UPDATE "Movimiento"."Cuenta" as cue
	SET saldo=saldo-10
	WHERE cue.numero_cuenta = '4689927097'

UPDATE "Movimiento"."Cuenta" as cue
	SET saldo=saldo+10
	WHERE cue.numero_cuenta = '4638630860'

SELECT numero_cuenta, saldo
	FROM "Movimiento"."Cuenta"
	where "Movimiento"."Cuenta".numero_cuenta = '4638630860'

--TERCERO
BEGIN

INSERT INTO "Movimiento"."Transaccion"(
	numero_comprobante, id_rol_banco_usuario_cajero, numero_cuenta, id_catalogo, id_sucursal, estado, monto, fecha_transaccion, hora_transaccion)
	VALUES (123002, 601, '6292867783', 9, 1, 'true', 10, '2021-02-11', '15:02pm');

INSERT INTO "Movimiento"."Detalle_transaccion"(
	id, id_transaccion, id_catalogo, estado, monto)
	VALUES (123002, 123002, 11, 'true', 10);
	
UPDATE "Movimiento"."Cuenta" as cue
	SET saldo=saldo-10
	WHERE cue.numero_cuenta = '4689927097'

UPDATE "Movimiento"."Cuenta" as cue
	SET saldo=saldo-10
	WHERE cue.numero_cuenta = '4638630860'
COMMIT

ROLLBACK



--CUARTO
BEGIN
INSERT INTO "Movimiento"."Transaccion"(
	numero_comprobante, id_rol_banco_usuario_cajero, numero_cuenta, id_catalogo, id_sucursal, estado, monto, fecha_transaccion, hora_transaccion)
	VALUES (123003, 601, '6292867783', 9, 1, 'true', 10, '2021-02-11', '15:02pm');

INSERT INTO "Movimiento"."Detalle_transaccion"(
	id, id_transaccion, id_catalogo, estado, monto)
	VALUES (123003, 123003, 11, 'true', 10);
	
UPDATE "Movimiento"."Cuenta" as cue
	SET saldo=saldo-10
	WHERE cue.numero_cuenta = '4689927097'	
---SIN CONEXIONC
--ERROR
UPDATE "Movimiento"."Cuenta" as cue
	SET saldo=saldo+10
	WHERE cue.numero_cuenta = '4638630860'
	
COMMIT
ROLLBACK

UPDATE "Movimiento"."Cuenta" as cue
	SET saldo=saldo+10
	WHERE cue.numero_cuenta = '4638630860'
