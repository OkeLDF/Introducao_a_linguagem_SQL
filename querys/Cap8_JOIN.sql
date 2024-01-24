/*
   As tabelas CUSTOMER e CUSTOMER_ORDER possuem uma coluna em comum: CUSTOMER_ID.
   A tabela CUSTOMER tem essa coluna como coluna de identificação de registros.
   Já a tabela CUSTOMER_ORDER depende da tabela CUSTOMER para receber informações
   a partir dessa coluna. Assim, CUSTOMER é uma tabela-pai, e CUSTOMER_ORDER, uma
   tabela-filha.
*/

/* Como relacionar um cliente ao seu pedido? Se fizermos apenasum SELECT, as duas
   tabelas vão se misturar, mas os dados estarão desencontrados: */
SELECT * FROM CUSTOMER, CUSTOMER_ORDER;

/* Precisamos *alinhar* os dados a partir de uma coluna em comum. É isso que INNER JOIN faz: */
SELECT
    ORDER_ID,
    CUSTOMER.CUSTOMER_ID, /* já que é uma coluna em comum, precisamos definir de qual tabela estamos acessando a coluna */
    ORDER_DATE,
    SHIP_DATE,
    NAME,
    STREET_ADDRESS,
    CITY,
    STATE,
    ZIP,
    PRODUCT_ID,
    ORDER_QTY
FROM CUSTOMER INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID;

/* Note que os clientes de ID 2 e 4, da tabela-pai, foram excluídos da consulta anterior,
   por não terem um correspondente na tabela-filha. Para incluí-los, mesmo que não haja
   correspondência, precisamos de uma correspondência 'externa à esquerda (lado da tabela-pai)',
   que é o LEFT JOIN: */
SELECT
    ORDER_ID, /* para os IDs 2 e 4, será NULL */
    CUSTOMER.CUSTOMER_ID,
    ORDER_DATE, /* para os IDs 2 e 4, será NULL */
    SHIP_DATE,
    NAME,
    STREET_ADDRESS,
    CITY,
    STATE,
    ZIP,
    PRODUCT_ID,
    ORDER_QTY
FROM CUSTOMER LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID;

/* Para selecionar apenas os registros-pai que não têm registros-filhos, podemos usar WHERE */
SELECT
    CUSTOMER.CUSTOMER_ID,
    NAME AS CUSTOMER_NAME,
    STREET_ADDRESS,
    CITY,
    STATE,
    ZIP
FROM CUSTOMER LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
WHERE ORDER_ID IS NULL; /* Lembrando que não se pode usar '=', porque NULL não é um valor, mas sua ausência */

/* CUSTOMER_ORDER é filha de PRODUCT e CUSTOMER. Como fazer uma associação entre as 3 tabelas? */
SELECT
    ORDER_ID,
    CUSTOMER.CUSTOMER_ID,
    NAME AS CUSTOMER_NAME,
    (STREET_ADDRESS || ' - ' || CITY || ', ' || STATE || ' - ' || ZIP) AS LOCATION,
    ORDER_DATE,
    PRODUCT_ID,
    DESCRIPTION,
    ORDER_QTY
    
FROM CUSTOMER

INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID

INNER JOIN PRODUCT
ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID;

/* Dessa forma, podemos fazer operações com colunas de tabelas diferentes: */
SELECT
    ORDER_ID,
    CUSTOMER.CUSTOMER_ID,
    NAME AS CUSTOMER_NAME,
    (STREET_ADDRESS || ' - ' || CITY || ', ' || STATE || ' - ' || ZIP) AS LOCATION,
    ORDER_DATE,
    PRODUCT_ID,
    DESCRIPTION,
    ORDER_QTY,
    ORDER_QTY * PRICE AS REVENUE /* Operação com colunas de tabelas distintas */
    
FROM CUSTOMER

INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID

INNER JOIN PRODUCT
ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID;

/* Ótimo, temos a receita total por pedido (revenue). E se quiséssemos a receita
   total por cliente? Faremos um agrupamento: */
SELECT
    CUSTOMER.CUSTOMER_ID,
    NAME AS CUSTOMER_NAME,
    SUM(ORDER_QTY * PRICE) AS TOTAL_REVENUE
    
FROM CUSTOMER

INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID

INNER JOIN PRODUCT
ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID

GROUP BY 1, 2;

/* E para ver todos os clientes, LEFT JOIN: */
SELECT
    CUSTOMER.CUSTOMER_ID,
    NAME AS CUSTOMER_NAME,
    'U$ ' || COALESCE(SUM(ORDER_QTY * PRICE), 0) AS TOTAL_REVENUE
    
FROM CUSTOMER

LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID

LEFT JOIN PRODUCT
ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID

GROUP BY 1, 2;