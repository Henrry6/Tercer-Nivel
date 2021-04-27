//crear un dominio  y que solo acepte unos datos en especifico
create domain personas.provincias as character varying(20)
CONSTRAINT dom_provincias check (value in('Provincia','Esmeraldas'))

//Eliminar dominio
drop domain personas.provincias

//Crear dominio en forma corta en otro esquema
create domain personas.tipo_fecha date
create domain personas.cedula character varying(20)

//Dominio en el esquema publico
create domain genero character varying(30)
create domain edades integer


//Uso de dominio e integridades
CREATE TABLE personas.estudiante5
(
  cedula personas.cedula NOT NULL,
  nombre character varying(200) NOT NULL,
  telefono character varying(20),
  fecha personas.tipo_fecha,
  promedio_academico numeric,
  peronsa character  varying(30),
  provincia_nacimiento  personas.grupo_provincias,
  CONSTRAINT pk_est PRIMARY KEY (cedula),    
  CONSTRAINT fk_gen FOREIGN KEY (genero)
    REFERENCES personas.persona (nombre1),
  CONSTRAINT uk_tlfo unique (telefono),
  CONSTRAINT ch_prome CHECK (promedio_academico >=0)
  CONSTRAINT ch_fecha CHECK (fecha <= current_date)
)
