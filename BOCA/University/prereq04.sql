SELECT p1.course_id
FROM prereq p1
JOIN prereq p2
ON p1.prereq_id = p2.course_id
JOIN course c 
ON p2.prereq_id = c.course_id
WHERE c.title = 'CÁLCULO III'