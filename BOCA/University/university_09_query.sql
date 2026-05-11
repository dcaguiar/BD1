SELECT DISTINCT i.name
FROM instructor i
WHERE i.salary > SOME(
    SELECT j.salary
    FROM instructor j
    WHERE j.dept_name = 'Comp. Sci.'
)