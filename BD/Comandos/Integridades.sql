<--Integridades-->
//IDENTIDAD: ejemplos
CONSTRAINT pk_est PRIMARY KEY (cedula)

CONSTRAINT fk_gen FOREIGN KEY (genero)
    REFERENCES personas.persona (nombre1)

CONSTRAINT uk_tlfo unique (telefono),

CONSTRAINT ch_prome CHECK (promedio_academico >=0)
CONSTRAINT ch_fecha CHECK (fecha <= current_date)

nombre character varying(200) NOT NULL,
