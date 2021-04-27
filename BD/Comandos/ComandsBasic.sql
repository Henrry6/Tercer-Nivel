/*Crear tabla  la llave primary Key*/
CREATE TABLE personas.cliente ( id integer, nombre character varying(20),
						edad integer, ciudad character varying(50), telefono numeric,
						primary key (id)) 

/*Modificar columnas(agregar, eliminar)*/
ALTER TABLE personas.cliente ADD COLUMN correo character varying(30)
ALTER TABLE personas.cliente DROP COLUMN correo

/*Modificar tipo de dato de una columna*/
--opcion 1
ALTER TABLE personas.cliente ALTER COLUMN correo TYPE character varying(30)
-- opcion 2: transforma los datos al nuevo tipo de dato dado
ALTER TABLE personas.cliente ALTER COLUMN telefono TYPE integer USING CAST(correo AS numeric)

--Insertar valores
insert into personas.cliente values ( 1, 'Henrry', 22, 'Quito', 'henrry@gmail.com', 09993456)
--Conusltar todos los campos y valores de una tabla
select * from factura
SELECT count(*) FROM tabla_name;

/*Insert forma corta*/
insert into clientes values ('1727132345','Henrry Alvarado', 'Quito');

/*Insert forma larga*/
insert into clientes (ced_cliente, nom_cliente, dir_cliente) 
values ('1727132431','David Alvarado', 'San Carlos');

/*Insert masiva*/
--los numeros entre parentesis muestran la cantidad de insercioens.
insert into clientes values ('cedula' || generate_series(1,10),'Name' || generate_series(1,10), 'Dress'||generate_series(1,10));
insert into clientes values ('172145334' || generate_series(1,5),'Name' || generate_series(1,5), 'Dress'||generate_series(1,5));

/*Update*/
update clientes set nom_cliente='Adrian Perez' where ced_cliente='cedula3';
--actualiza todos los valores de una columna
update clientes set estado_cliente='nombre2';

/*Eliminacion fisica*/
delete from clientes where ced_cliente='cedula10';


/*Eliminacion logica*/
update clientes set estado_cliente=0 where ced_cliente='cedula1'
select * from clientes;


--Añadir una relacion o llave foreing key
--añadimos primero el campo
alter table factura add ced_cliente varchar (10);
--definimos a ese campo como la foreing key y la referencia de donde viene
alter table factura add foreign key (ced_cliente)
references clientes (ced_cliente);