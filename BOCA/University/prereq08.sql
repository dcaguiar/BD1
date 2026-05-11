WITH RECURSIVE tds_prereq AS(
  --cb
  SELECT p.course_id, p.prereq_id
  FROM prereq p
  
  UNION
  
  --pr
  SELECT p.course_id, tp.prereq_id
  FROM prereq p 
  JOIN tds_prereq tp
  ON tp.course_id = p.prereq_id
),
tds_dis AS (
  SELECT DISTINCT *
  FROM tds_prereq
  WHERE course_id <> prereq_id
),
tds_cont AS (
  SELECT prereq_id, COUNT(course_id) AS "Num_Disc"
  FROM tds_dis
  GROUP BY prereq_id
),
out_t AS (
  SELECT c.course_id AS "Codigo",
         c.title AS "Disciplina",
         COALESCE(tc."Num_Disc", 0) AS "Num_Disc"
  FROM course c 
  LEFT JOIN tds_cont tc
  ON tc.prereq_id = c.course_id
)

SELECT *
FROM out_t
ORDER BY "Num_Disc" DESC, "Codigo" ASC