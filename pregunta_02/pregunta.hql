/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS datos;
DROP TABLE IF EXISTS ordered_datos;

CREATE TABLE datos (
    c1 STRING,
    c2 DATE, 
    c3 INT
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE datos;

CREATE TABLE ordered_datos AS 
SELECT c1,c2,c3 FROM datos
ORDER BY c1,c3,c2;

INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM ordered_datos;