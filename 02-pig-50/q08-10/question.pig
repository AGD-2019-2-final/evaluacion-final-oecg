-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        bolsa:bag{(a:CHARARRAY)},
        mapa:map[]);
DUMP data;

data_1 = foreach data generate FLATTEN($1),FLATTEN($2);
data_2= foreach data_1 generate $0,$1;

merge = GROUP data_2 BY ($0,$1);

data_count = FOREACH merge GENERATE group , COUNT(data_2) AS conteo;
data_order = order data_count BY $0,$1;

store data_order into 'output' using PigStorage('\t');