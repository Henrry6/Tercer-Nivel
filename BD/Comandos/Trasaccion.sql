--INICIO DE TRANSACCION

begin --todo begin hay que cerrarlo con un rollback o  commit

--si todo esta bien ejecuta lo que esta a partir del commit
commit
--debitar 
update cuenta set saldo=saldo-500 where nro_cuenta='111'
--acreditar
update cuenta set saldo=saldo+500 where nro_cuenta='111'

--si sale mal se ejecuta rollback
rollback
update cuenta set saldo=saldo+500 where nro_cuenta='111'

update 1
update 2

