SELECT c.nome nome_c,
       c.sobrenome sobrenome_c,
       r.nome nome_r,
       atm.fabricante fabricante,
       atm.modelo modelo,
       n.data data,
       n.preco preco
FROM 
  negocios n JOIN consumidores c USING (cpf)
  JOIN revendedoras r USING (cgc)
  JOIN automoveis atm USING (codigo, ano)