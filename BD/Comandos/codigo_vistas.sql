--Primero

create view v_transacciones_y_estado as
select per.nombre, cue.numero_cuenta, tra.numero_comprobante, tra.estado from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tra on tra.numero_cuenta=cue.numero_cuenta


--Segundo
create view v_historial_movimientos as
select per.nombre, cue.numero_cuenta, tran.numero_comprobante transaccion, trf.numero_comprobante transferencia  from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta

--Tercero
create view v_monto_transacciones as
select per.nombre, cue.numero_cuenta, tran.numero_comprobante transacciones, tran.monto  from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta


--Cuarto
create view v_monto_transferencias as
select per.nombre, per.cedula, cue.numero_cuenta transacciones, trf.monto   from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta

--Quinto
create view v_cuentas_del_cliente as
select per.nombre Cliente, cue.numero_cuenta, cat.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Utilidad"."Catalogo" as cat on cat.id=cue.id_catalogo 
where per.cedula='3719721923'

--Sexto
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
create view v_transferencias_en_banco as
select per.nombre Cliente, cue.numero_cuenta, trf.numero_cuenta transferencias, ban.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta

--Octavo
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
create view v_fecha_transferencias as
select trf.numero_comprobante, trf.fecha_transferencia from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta


--Decimo
create view v_cuentas_en_banco as 
select per.nombre Cliente, ban.nombre Banco, cat.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Utilidad"."Catalogo" as cat on cat.id=cue.id_catalogo 
where per.cedula='3719721923'