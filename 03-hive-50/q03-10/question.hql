-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
!hdfs dfs -rm -r -f /input;
!hdfs dfs -rm -r -f /output;
!hdfs dfs -mkdir /input;
!hdfs dfs -copyFromLocal data.tsv  /input/data.tsv;

DROP TABLE IF EXISTS data;

CREATE TABLE data (key STRING,
                   fecha DATE,
                   valor INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE data;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE

SELECT valor FROM data GROUP BY valor ORDER BY valor LIMIT 5;

!hdfs dfs -copyToLocal /output  output;