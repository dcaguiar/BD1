SELECT 
    s.sec_id AS "Secao",
    COALESCE(i.name, '-') AS "Professor"
FROM section s
LEFT JOIN teaches t
    ON s.course_id = t.course_id
   AND s.sec_id = t.sec_id
   AND s.semester = t.semester
   AND s.year = t.year
LEFT JOIN instructor i
    ON t."ID" = i."ID"
WHERE s.semester = 'Spring'
  AND s.year = 2010;