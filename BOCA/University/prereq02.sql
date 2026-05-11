SELECT DISTINCT p.course_id
FROM prereq p
JOIN course c
ON p.prereq_id = c.course_id
WHERE c.title = 'CÁLCULO III'