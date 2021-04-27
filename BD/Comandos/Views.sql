create view v_transacciones as

--Primero
select p.nombre, cue.numero_cuenta, tra.numero_comprobante, tra.estado from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transaccion" as tra on tra.numero_cuenta=cue.numero_cuenta
where p.cedula='3719721923'

create view v_transacciones_y_estado as
select per.nombre, cue.numero_cuenta, tra.numero_comprobante, tra.estado from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tra on tra.numero_cuenta=cue.numero_cuenta


--Segundo
select per.nombre, cue.numero_cuenta, tran.numero_comprobante, trf.numero_comprobante  from public."Persona" as per
join public."Usuario" as u on per.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
join public."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta

create view v_historial_movimientos as
select per.nombre, cue.numero_cuenta, tran.numero_comprobante transaccion, trf.numero_comprobante transferencia  from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta

--Tercero
select p.nombre, cue.numero_cuenta, tra.numero_comprobante, tra.monto from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transaccion" as tra on tra.numero_cuenta=cue.numero_cuenta
where p.cedula='3719721923'


create view v_monto_transacciones as
select per.nombre, cue.numero_cuenta, tran.numero_comprobante transacciones, tran.monto  from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta


--Cuarto
select p.nombre, p.cedula, cue.numero_cuenta, trf.monto from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta
where p.cedula='9356789787'

create view v_monto_transferencias as
select per.nombre, per.cedula, cue.numero_cuenta transacciones, trf.monto   from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta

--Quinto
select p.nombre, cue.numero_cuenta, cue.id_catalogo, cat.nombre from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Catalogo" as cat on cat.id=cue.id_catalogo 
where p.cedula='3719721923'

create view v_cuentas_del_cliente as
select per.nombre Cliente, cue.numero_cuenta, cat.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Utilidad"."Catalogo" as cat on cat.id=cue.id_catalogo 
where per.cedula='3719721923'

--Sexto
select p.nombre, tran.numero_comprobante, tran.monto, ban.nombre from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Banco" as ban on ban.id=bu.id_banco
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
where p.cedula='3719721923'

create view v_transacciones_en_banco as
select per.nombre Cliente, cue.numero_cuenta, tran.numero_cuenta transacciones, ban.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
where per.cedula='3719721923'

--Séptimo
select p.nombre, cue.numero_cuenta, trf.numero_comprobante, ban.nombre from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Banco" as ban on ban.id=bu.id_banco
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta
where p.cedula='9356789787'

create view v_transferencias_en_banco as
select per.nombre Cliente, cue.numero_cuenta, trf.numero_cuenta transferencias, ban.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta

--Octavo
select tra.numero_comprobante, tra.fecha_transaccion from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transaccion" as tra on tra.numero_cuenta=cue.numero_cuenta
where p.cedula='3719721923'

create view v_fecha_transacciones as
select  tran.numero_comprobante, tran.fecha_transaccion from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
where per.cedula='3719721923'

--Noveno
select p.nombre,trf.numero_comprobante, trf.fecha_transferencia from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta
where p.cedula='9356789787'

create view v_fecha_transferencias as
select trf.numero_comprobante, trf.fecha_transferencia from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta


--Decimo
select p.nombre, cue.numero_cuenta, cat.nombre, ban.nombre from public."Persona" as p
join public."Usuario" as u on p.cedula=u.cedula_persona
join public."Banco_Usuario" as bu on bu.id_usuario=u.id
join public."Banco" as ban on ban.id=bu.id_banco
join public."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join public."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join public."Catalogo" as cat on cat.id=cue.id_catalogo 
where p.cedula='9356789787'

create view v_cuentas_en_banco as 
select per.nombre Cliente, ban.nombre Banco, cat.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Utilidad"."Catalogo" as cat on cat.id=cue.id_catalogo 
where per.cedula='3719721923'

select * from  public."Persona"
select * from  public."Catalogo"











-- EJEMPLO CON PERSONA NUEVA DE LA PRESENTACIÓN

INSERT INTO public."Persona"(
	cedula, apellidos, nombre, direccion, fecha_nacimiento, ciudad, id_catalogo, estado)
	VALUES ('1727113156', 'Darwin Adrian', 'Puente Inchiglema', 'Av Flavio Alfaro', '1998-01-07','Quito' ,1, 'true');

INSERT INTO public."Usuario"(
	id, cedula_persona, id_banco_sucursal, correo_electronico, clave, estado)
	VALUES (1110, '1727113156', 1, 'darwin34y@gmail.com', '8765', 'true');
	
INSERT INTO public."Banco_Usuario"(
	id, id_banco, id_usuario, estado)
	VALUES (1110, 1, 1110, 'true');

INSERT INTO public."Rol_Banco_Usuario"(
	id, id_banco_usuario, id_rol, estado)
	VALUES (1110, 1110, 1, 'true');
	
INSERT INTO public."Cuenta"(
	numero_cuenta, id_catalogo, id_rol_banco_usuario_cajero, id_rol_banco_usuario, estado, saldo, fecha_apertura)
	VALUES ('2200458215',6 , 601, 1110, 'true', 100, '2021-02-09');	

INSERT INTO public."Transaccion"(
	numero_comprobante, id_rol_banco_usuario_cajero, numero_cuenta, id_catalogo, id_sucursal, estado, monto, fecha_transaccion, hora_transaccion)
	VALUES (666333, 601, '2200458215', 9, 1, 'true', 160, '2021-02-09', '21:02pm');
	
--Primero ingresar el detalle que pertenece a una transacción por cheque (10 cheque)
INSERT INTO public."Detalle_transaccion"(
	id, id_transaccion, id_catalogo, estado, monto)
	VALUES (666333, 666333, 10, 'true', 110);
--Segundo ingresar el detalle que pertenece a una transacción por efectivo (11 efectivo)

INSERT INTO public."Detalle_transaccion"(
	id, id_transaccion, id_catalogo, estado, monto)
	VALUES (65400, 666333, 11, 'true', 50);

UPDATE public."Cuenta" as cue
	SET saldo=260
	WHERE cue.numero_cuenta = '2200458215'


SELECT numero_cuenta, id_catalogo, id_rol_banco_usuario_cajero, id_rol_banco_usuario, estado, saldo, fecha_apertura
	FROM public."Cuenta"
	where public."Cuenta".numero_cuenta = '2200458215'










  INSERT INTO public."Transferencia"(
	numero_comprobante, id_sucursal, id_rol_banco_usuario, id_rol_banco_usuario_cajero, numero_cuenta, estado, monto, fecha_transferencia, hora_transferencia, descripcion)
	VALUES (123791, 1, 601, 601, '4689927097', 'true', 530, '2021-02-08', '22:02pm', 'Pago Luz');
