/* Seleciona todas (*) as colunas da tabela CUSTOMER */
SELECT * FROM CUSTOMER;

/* Seleciona apenas as colunas CUSTOMER_ID e NAME */
SELECT CUSTOMER_ID, NAME FROM CUSTOMER;

SELECT * FROM PRODUCT;

/* "Suponhamos que quiséssemos gerar uma coluna caluculada
chamada TAXED_PRICE em que o preço fosse 7% mais alto que
em PRICE." ... */

SELECT
    PRODUCT_ID,
    DESCRIPTION,
    PRICE,
    PRICE * 1.07 AS TAXED_PRICE /* Selecione "PRICE * 107%" e chame isso de TAXED_PRICE */
FROM PRODUCT;

SELECT
    PRODUCT_ID,
    DESCRIPTION,
    PRICE,
    round(PRICE * 1.07, 2) AS TAXED_PRICE /* round(X, Y) arredonda X para Y casas decimais */
FROM PRODUCT;

SELECT
    NAME,
    CITY || ', ' || STATE AS LOCATION /* Concatenação de textos */
FROM CUSTOMER;

SELECT
    NAME,
    STREET_ADDRESS || ' - ' || CITY || ', ' || STATE || ' (' || ZIP || ')' AS SHIP_ADDRESS
FROM CUSTOMER;

