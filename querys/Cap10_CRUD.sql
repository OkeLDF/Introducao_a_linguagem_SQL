/* Inserção de dados numa tabela: */
INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME)
VALUES
    ('Otávio', 'Folador'),
    ('Luís', 'Folador');

INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL, VIP)
VALUES
    ('Satrustegue', 'Feliciano', 987654321, 'sasa.fefe@terra.com.br', 1),
    ('Orelhana', 'Costa', 912345678, 'ocosta@gmail.com', 0);

SELECT * FROM ATTENDEE;

/*
   Também poderia ser usada uma instrução SELECT para preencher uma tabela:
   
    INSERT INTO   TABELA_X   (COL_1, COL_2, COL_3)
         SELECT               COL_A, COL_B, COL_C
           FROM   TABELA_Y
*/

/* Não podemos colocar uma FOREIGN KEY inválida. nesse caso, não existe um ATTENDEE_ID igual a 5 */
INSERT INTO COMPANY (NAME, DEsCRIPTION, PRIMARY_CONTACT_ATTENDEE_ID)
VALUES (
    'Usda Silosystem Alsack Norcom Cs1 Axfor',
    'Agritech Agro Industrial Ltda.',
    /*aqui >>>*/ 5 /*<<< está o erro*/
);

/* Mas isso vai dar certo. A empresa Usda bla bla bla vai estar associada o Satrustegue Feliciano (Id: 3) */
INSERT INTO COMPANY (NAME, DEsCRIPTION, PRIMARY_CONTACT_ATTENDEE_ID)
VALUES ('Usda Silosystem Alsack Norcom Cs1 Axfor', 'Agritech Agro Industrial Ltda.', 3);

/*
   Deletar registros:
   
    DELETE FROM TABELA_X;
    
   Isso deleta tudo da tabela. Algumas plataformas preferem, para essa
   finalidade, o uso de:
   
    TRUNCATE TABLE TABELA_X;
*/

/* Deletar registros condicionalmente: */
DELETE FROM ATTENDEE /* Substitua 'DELETE' por 'SELECT *' para ter certeza do que está deletando! */
WHERE
        PHONE IS NULL
    AND EMAIL IS NULL;
    
/* Editar registros: */
UPDATE ATTENDEE SET
    LAST_NAME = UPPER(LAST_NAME),
    PHONE = 42000000000 + PHONE;

SELECT * FROM ATTENDEE;

/* Edição condicional: */
UPDATE ATTENDEE SET
    VIP = 1
    
WHERE ATTENDEE_ID IN (1, 2);

/*
   Outra instrução perigosa, semelhante a DELTE e TRUNCATE, é
   
    DROP TABLE tabela_que_nao_quero_mais
    
   Essa instrução vai deletar a tabela e removê-la do Database permanentemente.
*/