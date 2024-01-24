/* WHERE aplica um filtro aos registros que serão mostrados */
SELECT * FROM STATION_DATA
WHERE year = 2010;

/* O operador de comparação "DIFERENTE DE" pode ser tanto != como <> */
SELECT * FROM STATION_DATA
WHERE year <> 2010;

SELECT * FROM STATION_DATA
WHERE year != 2010;

/* Seleção de intervalos */
SELECT * FROM STATION_DATA
WHERE year BETWEEN 2005 AND 2010;

/* Operadores Booleanos */
SELECT * FROM STATION_DATA
WHERE year >= 2005 AND year <= 2010;

SELECT * FROM STATION_DATA
WHERE
    month = 3
    OR month = 6
    OR month = 9
    OR month = 12;

SELECT * FROM STATION_DATA
WHERE month IN (3, 6, 9 ,12);

SELECT * FROM STATION_DATA
WHERE month NOT IN (3, 6, 9 ,12);


/* WHERE com textos */
SELECT * FROM STATION_DATA
WHERE report_code = '513A63';

/* Operdador LIKE (sting se "assemelha com" ...) */
SELECT * FROM STATION_DATA
WHERE report_code LIKE 'A%'; /* Começa com 'A', e não importa o que vem depois ('%') */

SELECT * FROM STATION_DATA
/* Começa com 'A', depois tem 1 caractere qualquer ('_'), depois te um 'C', e não importa o que vem depois ('%') */
WHERE report_code LIKE 'A_C%';

SELECT * FROM STATION_DATA
/* não importa o que vem antes ('%'), mas termina com '3' */
WHERE report_code LIKE '%3';

/* Verdaderio e Falso: */
SELECT * FROM STATION_DATA
WHERE tornado = 1 AND hail = 1; /* houve tornado E houve granizo */

SELECT * FROM STATION_DATA
WHERE tornado AND hail; /* verdadeiro, implícito */

SELECT * FROM STATION_DATA
WHERE NOT tornado AND hail; /* NÃO houve tornado E houve granizo*/

/* Valores nulos não podem ser comparados com '=', para isso temos o IS */
SELECT * FROM STATION_DATA
WHERE snow_depth IS NULL; /* mostre se for nulo */

SELECT * FROM STATION_DATA
WHERE snow_depth IS NOT NULL; /* mostre se NÃO for nulo */

/* coalesce transforma todos os NULL em algum dado valor */
SELECT coalesce(precipitation, 0.000001) AS PRECIPITATION
FROM STATION_DATA;