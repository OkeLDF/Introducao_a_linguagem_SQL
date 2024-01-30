/*
   Índices melhoram o desempenho de SELECT, mas retarda as instruções
   INSERT, UPDATE e DELETE, pois precisam ser atualizados a cada alteração
   dos dados
*/

CREATE INDEX price_index ON PRODUCT(price);

/* Índices exclusivos impedem que dois ou mais registros tenham o mesmo valor na coluna indexada */
CREATE UNIQUE INDEX name_index ON CUSTOMER(name); /* Não haverá duas empresas com mesmo nome */

/* Deletar índices */
DROP INDEX price_index;

/*
   Índices são úteis com tabelas enormes com problemas de desempenho na instrução SELECT.
   Quando usados em tabelas pequenas ou tabelas com atualizações volumosas e frequentes,
   deve ser evitado.
*/