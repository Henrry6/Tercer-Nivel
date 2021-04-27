
create user banco_ddl password '12345'
--Usuario puede utilizar lenguaje ddl
--CREATE, ALTER, DROP, TRUNCATE
--Lenguaje de definición de datos (DDL)
grant connect on database "SystemBank" to banco_ddl;
grant all privileges on database "SystemBank" to banco_ddl;
grant all privileges on schema "Banco","Movimiento","Personal","Usuario","Uitilidad","Ventana" to banco_ddl;
revoke select,insert,update,delete on all tables in schema "Banco","Movimiento","Personal","Usuario","Uitilidad","Ventanato" from banco_ddl;



create user banco_dml password '12345'
--Usuario puede utilizar lenguaje dml
--SELECT, INSERT, UPDATE, DELETE
revoke all privileges on database "SystemBank" from banco_dml;
grant connect on database "SystemBank" to banco_dml;
grant usage on schema "Movimiento", "Banco", "Personal", "Usuario", "Utilidad", "Ventana" to banco_dml;
GRANT INSERT, UPDATE, DELETE,SELECT ON ALL TABLES IN SCHEMA "Movimiento", "Banco", "Personal", "Usuario", "Utilidad", "Ventana" 
TO banco_dml;


create user banco_dql password '12345'
--Usuario DQL
--Solo puede usar el select
revoke all privileges on database "SystemBank" from banco_dql;
grant connect on database "SystemBank" to banco_dql;
grant usage on schema "Movimiento", "Banco", "Personal", "Usuario", "Utilidad", "Ventana" to banco_dql;
GRANT SELECT ON ALL TABLES IN SCHEMA "Movimiento", "Banco", "Personal", "Usuario", "Utilidad", "Ventana" TO banco_dql;