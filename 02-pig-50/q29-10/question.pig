-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
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
data = FOREACH u GENERATE birthday as birthday;

data0 = FOREACH data GENERATE birthday as c1, 
SUBSTRING(birthday,5,7) as c2,
SUBSTRING(birthday,5,7) as c3,
SUBSTRING(birthday,5,7) as c4;

get_up = FOREACH data0 GENERATE c1, c2, REPLACE(c3, '01', 'ene') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '02', 'feb') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '03', 'mar') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '04', 'abr') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '05', 'may') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '06', 'jun') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '07', 'jul') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '08', 'ago') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '09', 'sep') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '10', 'oct') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, c2, REPLACE(c3, '11', 'nov') AS c3, c4;
get_up = FOREACH get_up GENERATE c1, REPLACE(c3, '12', 'dic') AS c3, c2, (int) c4;

STORE get_up INTO './output' using PigStorage(',');