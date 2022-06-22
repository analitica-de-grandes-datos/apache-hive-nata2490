/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS letters;
DROP TABLE IF EXISTS letters_sorted;

CREATE TABLE letters (col1 STRING, col2 STRING, col3 INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE letters;

CREATE TABLE letters_sorted AS SELECT * FROM letters ORDER BY col1, col3 ASC;

INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM letters_sorted;


