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
DROP TABLE IF EXISTS letters;
DROP TABLE IF EXISTS letters_counts;

CREATE TABLE letters (col1 STRING, col2 STRING, col3 INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE letters;

CREATE TABLE letters_counts
AS
    SELECT letter, count(1) AS count
    FROM
        (SELECT col1 AS letter FROM letters) w
GROUP BY
    letter
ORDER BY
    letter;

INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM letters_counts;
