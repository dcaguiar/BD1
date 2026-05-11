WITH RECURSIVE prerequisitos AS (

    -- Caso base
    SELECT p.prereq_id
    FROM prereq p
    JOIN course c
        ON p.course_id = c.course_id
    WHERE c.title = 'SINAIS E SISTEMAS'

    UNION

    -- Passo recursivo
    SELECT p.prereq_id
    FROM prereq p
    JOIN prerequisitos pr
        ON p.course_id = pr.prereq_id
)

SELECT DISTINCT prereq_id
FROM prerequisitos;