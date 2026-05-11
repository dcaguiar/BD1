WITH values AS (
  SELECT MIN("LAT_N") AS a, 
         MIN("LONG_W") AS b, 
         MAX("LAT_N") AS c, 
         MAX("LONG_W") AS d
  FROM "STATION"
)
--𝑎𝑏𝑠 (𝑥1 −𝑥2) +𝑎𝑏𝑠 (𝑦1 −𝑦2)
SELECT ROUND(ABS(a - c) + ABS(b - d), 4) AS "DIST_MANHATTAN"
FROM values