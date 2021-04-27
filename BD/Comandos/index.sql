EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select p.cedula,p.nombres,ca.nombre,eb.nombre 
from persona p
join cuenta c
on p.cedula=c.cliente
join catalogo ca
on ca.id_catalogo=c.tipo_cuenta
join entidad_bancaria eb
on eb.ruc=c.ruc_entidad_bancaria
where p.nombres='yoli'

create index i_persona_nombre on persona(nombres);
vacuum full analyze persona; 

create index i_cuenta_cliente_tipo_cuenta_ruc_entidad_bancaria 
on cuenta (cliente,tipo_cuenta,ruc_entidad_bancaria);

vacuum full analyze cuenta; 


● El cliente podrá ver una o todas las transacciones realizadas y su estado de una cuenta.

EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre, cue.numero_cuenta, tra.numero_comprobante, tra.estado from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tra on tra.numero_cuenta=cue.numero_cuenta
where tra.numero_cuenta='7212063079' 

create index i_transaccion_numero_cuenta_estado on "Movimiento"."Transaccion"(numero_cuenta, estado);

● El cliente puede generar un reporte de todos sus movimientos.

EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre, cue.numero_cuenta, tran.numero_comprobante transaccion, trf.numero_comprobante transferencia  from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta
where per.nombre='ABAL NICOLARI'

create index i_persona_apellidos on "Personal"."Persona"(apellidos);
vacuum full analyze "Personal"."Persona"; 

● El cliente podrá ver el monto de sus transacciones.

EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre, cue.numero_cuenta, tran.numero_comprobante transacciones, tran.monto  from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
where per.nombre='BARCELONA CAMPELO'
where tran.numero_cuenta='9384238507'

create index i_Transaccion_numero_cuenta on "Movimiento"."Transaccion"(numero_cuenta);
create index i_dt_monto on "Movimiento"."Detalle_transaccion"(monto);
create index i_persona_nombre on "Personal"."Persona"(nombre);
vacuum full analyze "Movimiento"."Transaccion";
vacuum full analyze "Personal"."Persona"; 

● El cliente podrá obtener el valor de cada transferencia.
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre, per.cedula, cue.numero_cuenta transacciones, trf.monto   from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta


create index i_Transaccion_numero_cuenta on "Movimiento"."Transaccion"(numero_cuenta);
create index i_dt_monto on "Movimiento"."Detalle_transaccion"(monto);
create index i_persona_nombre on "Personal"."Persona"(nombre);
vacuum full analyze "Movimiento"."Transaccion";
vacuum full analyze "Personal"."Persona"; 

● El cliente podrá ver todas sus cuentas.
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre Cliente, cue.numero_cuenta, cat.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Utilidad"."Catalogo" as cat on cat.id=cue.id_catalogo 
where per.cedula='3719721923'

create index i_Transaccion_numero_cuenta on "Movimiento"."Transaccion"(numero_cuenta);
create index i_catalogo_nombre on "Utilidad"."Catalogo"(nombre);
create index i_persona_nombre on "Personal"."Persona"(nombre);
vacuum full analyze "Movimiento"."Transaccion";
vacuum full analyze "Personal"."Persona"; 
vacuum full analyze "Utilidad"."Catalogo";

● El cliente podrá conocer en qué banco realizó las transacciones.
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre Cliente, cue.numero_cuenta, tran.numero_cuenta transacciones, ban.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
where per.nombre='BOIX VILARO'

create index i_Transaccion_numero_cuenta on "Movimiento"."Transaccion"(numero_cuenta);
create index i_banco_nombre on "Banco"."Banco"(nombre);
create index i_persona_nombre on "Personal"."Persona"(nombre);
vacuum full analyze "Movimiento"."Transaccion";
vacuum full analyze "Personal"."Persona"; 
vacuum full analyze "Banco"."Banco";

● El cliente podrá ver en qué banco realizó las transferencias.
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre Cliente, cue.numero_cuenta, trf.numero_cuenta transferencias, ban.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta
where per.nombre='ABAL NICOLARI'

create index i_transferencia_numero_cuenta on "Movimiento"."Transferencia"(numero_cuenta);
create index i_banco_nombre on "Banco"."Banco"(nombre);
create index i_persona_nombre on "Personal"."Persona"(nombre);
vacuum full analyze "Movimiento"."Transaccion";
vacuum full analyze "Personal"."Persona"; 
vacuum full analyze "Banco"."Banco";

● El cliente podrá conocer la fecha de las transacciones que haya realizado.

EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select  tran.numero_comprobante, tran.fecha_transaccion from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transaccion" as tran on tran.numero_cuenta=cue.numero_cuenta
where per.cedula='3719721923'
create index i_transaccion_numero_cuenta_estado on "Movimiento"."Transaccion"(numero_cuenta);
create index i_persona_nombre on "Personal"."Persona"(nombre);
vacuum full analyze "Movimiento"."Transaccion";
vacuum full analyze "Personal"."Persona"; 

● El cliente podrá ver la fecha de sus transferencias.
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select trf.numero_comprobante, trf.fecha_transferencia from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Movimiento"."Transferencia" as trf on trf.numero_cuenta=cue.numero_cuenta
where per.nombre='ABAL NICOLARI'
create index i_transferencia_numero_cuenta on "Movimiento"."Transferencia"(numero_cuenta);
create index i_persona_nombre on "Personal"."Persona"(nombre);
vacuum full analyze "Movimiento"."Transaccion";
vacuum full analyze "Personal"."Persona"; 

● El cliente puede ver en qué bancos tienen cuentas.
EXPLAIN (ANALYZE, COSTS, VERBOSE, BUFFERS, FORMAT JSON)
select per.nombre Cliente, ban.nombre Banco, cat.nombre from "Personal"."Persona" as per
join "Usuario"."Usuario" as u on per.cedula=u.cedula_persona
join "Usuario"."Banco_Usuario" as bu on bu.id_usuario=u.id
join "Banco"."Banco" as ban on ban.id=bu.id_banco
join "Usuario"."Rol_Banco_Usuario" as rbu on rbu.id_banco_usuario=bu.id
join "Movimiento"."Cuenta" as cue on cue.id_rol_banco_usuario=rbu.id
join "Utilidad"."Catalogo" as cat on cat.id=cue.id_catalogo 
where per.cedula='3719721923'
create index i_banco_nombre on "Banco"."Banco"(nombre);
create index i_catalogo_nombre on "Utilidad"."Catalogo"(nombre);
create index i_persona_nombre on "Personal"."Persona"(nombre);

