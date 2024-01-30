BEGIN TRANSACTION; /* tudo que acontecer aqui... */
    INSERT INTO CUSTOMER_ORDER(ORDER_DATE, SHIP_DATE, CUSTOMER_ID, PRODUCT_ID, ORDER_QTY)
    VALUES (DATE('now'), DATE('now', '+5 days'), 1, 1, 30);

ROLLBACK; /* ...poderá ser desfeito com ROLLBACK */

BEGIN TRANSACTION; /* tudo que der certo e for definitivo... */
    INSERT INTO CUSTOMER_ORDER(ORDER_DATE, SHIP_DATE, CUSTOMER_ID, PRODUCT_ID, ORDER_QTY)
    VALUES (DATE('now'), DATE('now', '+5 days'), 1, 1, 300);

COMMIT; /* ...pode ser confirmado com COMMIT */