WITH st AS (
  SELECT employee_id, salary * months AS total
  FROM "Employee"
),
maxi AS(
  SELECT MAX(total) AS maxi
  FROM st
),
outt AS (
  SELECT CONCAT(total, ' ', COUNT(st.employee_id)) 
  FROM st JOIN maxi on st.total = maxi.maxi
  GROUP BY total
)

SELECT *
FROM outt