-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
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

SELECT key, fecha, valor FROM data ORDER BY key, valor, fecha;

!hdfs dfs -copyToLocal /output  output;