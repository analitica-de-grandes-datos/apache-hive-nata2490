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

mkdir -p /workspace/pregunta_01/output/data.tsv
DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS word_counts;
CREATE TABLE datos (line STRING);
CREATE TABLE datos (col1 STRING, col2 STRING, col3 INT);
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';
--LOCATION '/workspace/pregunta_01/output'

LOAD DATA LOCAL INPATH '/workspace/pregunta_01/data.tsv'
OVERWRITE INTO TABLE datos;
SELECT * FROM datos LIMIT 10; --visualizar las 10 primeras lineas

--SELECT explode(split(line, '\\s')) AS letter FROM datos LIMIT 5;

CREATE TABLE word_counts AS
SELECT letter, count(1) AS count FROM
(SELECT explode(split(line, '\\s')) AS letter FROM datos) w
GROUP BY letter
ORDER BY letter;
SELECT * FROM word_counts LIMIT 10; --visualizar las 10 primeras lineas