SELECT c.course_id, c.title
FROM course c 
NATURAL JOIN takes t 
WHERE t."ID" =  '12345'