SELECT 
    a1.codigo AS codigo_auto1,
    a1.ano AS ano_auto1,
    a2.codigo AS codigo_auto2,
    a2.ano AS ano_auto2
FROM automoveis a1
JOIN automoveis a2
    ON a1.fabricante = a2.fabricante
    AND a1.modelo = a2.modelo
    AND a1.preco_tabela - a2.preco_tabela > 1000