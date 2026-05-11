WITH T1 AS (
  SELECT hacker_id, challenge_id, COUNT(submission_id) AS num
  FROM "Submissions"
  GROUP BY hacker_id, challenge_id
),
T2 AS (
  SELECT hacker_id, challenge_id, score
  FROM T1
  NATURAL JOIN "Submissions" s 
  WHERE num = 1
),
T3 AS(
  SELECT COUNT(*)
  FROM "Challenges"
),
T4 AS (
  SELECT hacker_id, COUNT(challenge_id) 
  FROM T2
  GROUP BY hacker_id
),

T5 AS(
  SELECT hacker_id
  FROM T4 
  JOIN T3 ON T4.count = T3.count
),
T6 AS (
  SELECT *
  FROM T5
  NATURAL JOIN "Submissions" s
),
T7 AS (
  SELECT challenge_id, score
  FROM "Challenges" c
  NATURAL JOIN "Difficulty" d
),
T8 AS (
  SELECT *
  FROM T6
  NATURAL JOIN T7
),
T9 AS (
  SELECT hacker_id, COUNT(challenge_id)
  FROM T8
  GROUP BY hacker_id
),
T10 AS (
  SELECT name
  FROM T9 
  NATURAL JOIN T3
  NATURAL JOIN "Hackers"
)
SELECT *
FROM T10