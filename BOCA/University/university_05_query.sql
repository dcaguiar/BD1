SELECT i.name
  FROM instructor i
  WHERE (i.dept_name = 'Comp. Sci.'
  OR i.dept_name = 'Physics')
  AND i.salary > 88000