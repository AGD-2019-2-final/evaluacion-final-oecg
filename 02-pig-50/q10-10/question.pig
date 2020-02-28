-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el last_name y su longitud. Ordene por longitud y 
-- por last_name. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:INT, 
        name:CHARARRAY,
        last_name:CHARARRAY,
        date:CHARARRAY,
        color:CHARARRAY,
        number: int
        );

last_name = foreach data generate last_name;
l_name_count = foreach last_name generate last_name, SIZE(last_name);
l_name_count = ORDER l_name_count by $1 DESC, $0 ASC;
get_up = LIMIT l_name_count 5 ;

store get_up into 'output' USING PigStorage (',');