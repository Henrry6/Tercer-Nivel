

ALTER TABLE "Usuario"."Usuario" ADD CONSTRAINT 
ch_clave CHECK (clave >=8)

ALTER TABLE "Utilidad"."Catalogo" ADD CONSTRAINT 
uk_nombre unique (nombre)

ALTER TABLE "Movimiento"."Cuenta" ADD CONSTRAINT 
uk_fecha unique (fecha_apertura)

