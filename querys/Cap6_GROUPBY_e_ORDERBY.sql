/* Conta o número de registros */
SELECT COUNT(*) AS record_count FROM STATION_DATA;

/* Conta o número de registros que apresentaram tornado */
SELECT COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado;

/* Conta o número de registros que apresentaram tornado e agrupa por ano */
SELECT year, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado
GROUP BY year;

/* Conta o número de registros que apresentaram tornado e agrupa por ano e mês */
SELECT year, month, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado
GROUP BY year, month;

/* Conta o número de registros que apresentaram tornado e agrupa por ano e mês */
SELECT year, month, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado
GROUP BY 1, 2; /* 1º selecionado = year, 2º selecionado = month */

/* ORDER BY muda a ordem de precedência dos Grupos */
SELECT year, month, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado
GROUP BY month, year
ORDER BY year, month;

/* DESC = decrescente */
SELECT year, month, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado
GROUP BY month, year
ORDER BY year DESC, month;
/* note que os meses continuam em oredm crescente */

/* COUNT(coluna) retorna a contagem de valores não nulos da coluna */
SELECT
    COUNT(*) AS total_count,
    COUNT(snow_depth) AS recorded_snow_depth_count
FROM STATION_DATA;

/* AVG = average */
SELECT month, AVG(temperature) AS avg_temperature FROM STATION_DATA
WHERE year >= 2000
GROUP BY month;

SELECT
    month,
    round(AVG(temperature), 2) AS avg_temperature
FROM STATION_DATA
WHERE year >= 2000
GROUP BY month;

SELECT
    year,
    SUM(snow_depth) AS sum_snow_depth
FROM STATION_DATA
WHERE year >= 2000
GROUP BY year;

/* precipitação total quando há tornado: */
SELECT
    year,
    SUM(precipitation) AS total_precipitation_with_tornado
FROM STATION_DATA
WHERE tornado
GROUP BY year;

/* Agregados não podem ser filtrados com WHERE */
SELECT
    year,
    SUM(precipitation) AS total_precipitation
FROM STATION_DATA
/* Isso vai dar erro: WHERE só filtra registros, não agregados */
WHERE total_precipitation > 30
GROUP BY year;

/* Para filtrar agregados, há o HAVING */
SELECT
    year,
    round(SUM(precipitation), 2) AS total_precipitation
FROM STATION_DATA
GROUP BY year
HAVING total_precipitation > 30;

/* station_number possui duplicatas. Para obter todos os station_numbers
   distintos, use DISTINCT */
SELECT DISTINCT station_number FROM STATION_DATA;

/* exclusivos de station_nuber e year */
SELECT DISTINCT station_number, year FROM STATION_DATA;