WITH RECURSIVE prerequisitos AS(
    -- Caso base
    SELECT p.course_id
    FROM prereq p
    JOIN course c 
        ON p.prereq_id = c.course_id
    WHERE c.title = 'CÁLCULO III'
  
    UNION
  
    -- Passo recursivo
    SELECT p.course_id
    FROM prereq p 
    JOIN prerequisitos pr
        ON p.prereq_id = pr.course_id
)
SELECT DISTINCT course_id
FROM prerequisitos