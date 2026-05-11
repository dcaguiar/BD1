SELECT p2.prereq_id
FROM prereq p1
JOIN prereq p2
ON p1.prereq_id = p2.course_id
JOIN course c 
ON p1.course_id = c.course_id
WHERE c.title = 'SINAIS E SISTEMAS'