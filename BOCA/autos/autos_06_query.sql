SELECT nome, sobrenome, cgc
FROM negocios RIGHT OUTER JOIN consumidores
ON negocios.cpf = consumidores.cpf 