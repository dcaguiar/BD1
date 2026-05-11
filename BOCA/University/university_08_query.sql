SELECT i."ID", i.name, i.dept_name,
    ROUND(salary / 12.0, 2) AS monthly_salary
FROM instructor i