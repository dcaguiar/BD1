WITH values AS (
  SELECT MIN("LAT_N") AS a, 
         MIN("LONG_W") AS b, 
         MAX("LAT_N") AS c, 
         MAX("LONG_W") AS d
  FROM "STATION"
)
--sqrt((𝑥1 −𝑥2)2 + (𝑦1 −𝑦2)2)
SELECT ROUND(SQRT(POWER((a - c),2) + POWER((b - d),2)):: NUMERIC , 4) AS "DIST_EUCLIDES"
FROM values