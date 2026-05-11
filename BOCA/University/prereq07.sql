WITH RECURSIVE prereq_all AS (
  SELECT 
    course_id,
    prereq_id
  FROM prereq

  UNION

  SELECT
    prereq_all.course_id,
    prereq.prereq_id
  FROM prereq_all INNER JOIN prereq ON prereq_all.prereq_id = prereq.course_id

), prereq_dist AS (
  SELECT DISTINCT *
  FROM prereq_all
  WHERE course_id <> prereq_id

), prereq_count AS (
  SELECT
    course_id,
    COUNT(prereq_id) AS "Num_Prereq"
   FROM prereq_dist
   GROUP BY course_id

), out_table AS (
  SELECT
  c.course_id AS "Codigo",
  title AS "Disciplina",
  COALESCE("Num_Prereq", 0) AS "Num_Prereq"
FROM course c LEFT OUTER JOIN prereq_count p ON c.course_id = p.course_id
)

SELECT *
FROM out_table
ORDER BY "Num_Prereq" DESC, "Codigo" ASC