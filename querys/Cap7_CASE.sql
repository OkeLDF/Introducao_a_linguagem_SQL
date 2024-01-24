/* 
   CASE inicia um bloco de código que manipula condições (como o 'switch()', em C).
   Cada condição deve ser indicada com WHEN (como o 'case:', em C); e cada valor
   resultante deve ser precedido por THEN (como numa estrutura 'if ... then...').
   ELSE é usado quando nenhuma das condições anteriores foi satisfeita (como o
   'default:', em C)
*/

SELECT report_code, year, month, day, wind_speed,
CASE
    WHEN wind_speed >= 40 THEN 'HIGH'
    WHEN wind_speed >= 30 THEN 'MODERATE'
    ELSE 'LOW'
END AS wind_severity /* Note que isso foi interpretado como uma nova coluna */
FROM STATION_DATA;

/* Podemos usar uma estrutura CASE para agrupar colunas de um outro modo */
SELECT
    year,
    CASE
        WHEN wind_speed >= 40 THEN 'HIGH'
        WHEN wind_speed >= 30 THEN 'MODERATE'
        ELSE 'LOW'
    END AS wind_severity,
    COUNT(*) AS record_count
FROM STATION_DATA
GROUP BY year, wind_severity; /* ou: GROUP BY 1, 2; */

/* Aplicação de mais de um filtro por vez, coisa que não é possível com WHERE */
SELECT
    year,
    month,
    SUM(CASE WHEN tornado THEN precipitation ELSE NULL END)
        AS tornado_precipitation,
    SUM(CASE WHEN NOT tornado THEN precipitation ELSE NULL END)
        AS non_tornado_precipitation
FROM STATION_DATA
GROUP BY 1, 2;

/* Várias condições unidas por operadores lógicos (AND, OR, NOT): */
SELECT
    month,
    ROUND(AVG(CASE WHEN (rain OR hail) AND year >= 2000 THEN temperature ELSE NULL END), 2)
        AS avg_precipitation_temperature,
    ROUND(AVG(CASE WHEN NOT (rain OR hail) AND year >= 2000 THEN temperature ELSE NULL END), 2)
        AS avg_non_precipitation_temperature
FROM STATION_DATA
GROUP BY 1;

/* Veja que estamos repetindo a condição 'year >= 2000'. No caso, essa é uma condição que se aplica
   a *todos* os filtros. Portanto, podemos colocá-la em WHEN */
SELECT
    month,
    ROUND(AVG(CASE WHEN (rain OR hail) THEN temperature ELSE NULL END), 2)
        AS avg_precipitation_temperature,
    ROUND(AVG(CASE WHEN NOT (rain OR hail) THEN temperature ELSE NULL END), 2)
        AS avg_non_precipitation_temperature
FROM STATION_DATA
WHERE year >= 2000
GROUP BY 1;