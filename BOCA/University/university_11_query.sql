SELECT 
    i."ID" AS "Codigo",
    i.name AS "Professor",
    COUNT(DISTINCT t.sec_id) AS "Secoes"
FROM instructor i
LEFT JOIN teaches t
    ON i."ID" = t."ID"
GROUP BY i."ID", i.name;