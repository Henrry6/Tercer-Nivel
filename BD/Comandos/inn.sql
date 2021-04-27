create index i_Transaccion_numero_cuenta on "Movimiento"."Transaccion"(numero_cuenta);
create index i_dt_monto on "Movimiento"."Detalle_transaccion"(monto);
create index i_persona_nombre on "Personal"."Persona"(nombre);
create index i_transaccion_numero_cuenta_estado on "Movimiento"."Transaccion"(numero_cuenta, estado);
create index i_catalogo_nombre on "Utilidad"."Catalogo"(nombre);
create index i_banco_nombre on "Banco"."Banco"(nombre);