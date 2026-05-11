WITH root AS (
  SELECT "N"
  FROM "BST" b
  WHERE b."P" IS NULL
),
leaves AS (
  SELECT b1."N"
  FROM "BST" b1
  WHERE b1."N" NOT IN (
      SELECT b2."P"
      FROM "BST" b2
      WHERE b2."P" IS NOT NULL
  )
),
out_t AS(
  SELECT b."N",
    CASE
       WHEN b."N" IN (SELECT "N" FROM root)
         THEN 'Root'

       WHEN b."N" IN (SELECT "N" FROM leaves)
         THEN 'Leaf'

       ELSE 'Inner'
       END AS "T"

  FROM "BST" b
)

SELECT *
FROM out_t
ORDER BY "N" ASC