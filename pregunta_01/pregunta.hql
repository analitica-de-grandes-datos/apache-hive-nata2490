/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS letter_count;
--CREATE TABLE datos (line STRING);
CREATE TABLE datos (col1 STRING, col2 STRING, col3 INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';
--LOCATION '/workspace/pregunta_01/output;

LOAD DATA LOCAL INPATH '/workspace/pregunta_01/data.tsv'
OVERWRITE INTO TABLE datos;
SELECT * FROM datos LIMIT 10;

--https://stackoverflow.com/questions/9994970/counting-in-hadoop-hive
--CREATE TABLE letter_count AS
--SELECT col1, count(*) AS count FROM datos;
--(SELECT explode(split(col1, '\\s')) AS letter FROM datos) w
--GROUP BY letter
--ORDER BY letetr;
--SELECT * FROM letter_count LIMIT 10;
SELECT col1, COUNT(*) FROM datos GROUP BY col1;
