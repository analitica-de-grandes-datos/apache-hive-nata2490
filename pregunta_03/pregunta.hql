/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
https://es.stackoverflow.com/questions/134849/query-sql-uso-count-distinct-valores-unicos
CREATE TABLE datos (col1 STRING, col2 STRING, col3 INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "/workspace/output"
OVERWRITE INTO TABLE datos;

SELECT TOP 5 (SELECT MIN(DISTINCT col3) FROM datos ORDER BY col3 ASC/DESC;



