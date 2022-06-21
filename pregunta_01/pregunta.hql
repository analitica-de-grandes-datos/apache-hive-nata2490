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
DROP TABLE IF EXISTS letter_counts;

CREATE TABLE datos (col1 STRING, col2 STRING, col3 INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH "/workspace/pregunta_01/data.tsv" OVERWRITE INTO TABLE datos;

CREATE TABLE letter_counts AS
SELECT col1, count(1)
FROM datos
GROUP BY col1
ORDER BY col1;

INSERT OVERWRITE DIRECTORY '/workspace/pregunta_01/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
--SELECT * FROM letter_counts; --LIMIT 10

--hive -f /workspace/pregunta_01/pregunta.hql --ejecucion del script
--hdfs dfs -cat /workspace/pregunta_01/pregunta.hql --visualizacion del script
--rm -rf *.log
--SELECT count(*) FROM col1 GROUP BY col1
--SELECT COUNT(col1) FROM datos GROUP BY col1;
--SELECT COUNT(DISTINCT col1) FROM datos;
--SELECT col1, COUNT(*) FROM datos GROUP BY col1;