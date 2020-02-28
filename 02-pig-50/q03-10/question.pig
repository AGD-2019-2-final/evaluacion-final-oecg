-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY,
        cantidad:INT);
DUMP data;

data_order = ORDER data BY cantidad;
DUMP data_order;

data_order_2 = FOREACH  data_order GENERATE cantidad ; 
DUMP data_order_2;

data_order_3 = LIMIT data_order_2 5;
DUMP data_order_3;

STORE data_order_3 INTO 'output' using PigStorage('\t');