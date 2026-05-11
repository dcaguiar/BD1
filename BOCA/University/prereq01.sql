SELECT DISTINCT p.prereq_id
FROM prereq p
JOIN course c
    ON p.course_id = c.course_id
WHERE c.title = 'SINAIS E SISTEMAS';
