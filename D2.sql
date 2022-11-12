
CREATE DATABASE desafio2_patricio_ramirez_g21;

--Conexión a a base de datos
\c desafio2_patricio_ramirez_g21;

--Creación de Base ded Datos
CREATE TABLE IF NOT EXISTS inscritos(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

--Verificación de tablas
\d

--1. ¿Cuántos registros hay?
SELECT COUNT (*) FROM inscritos;
--16--

--2. ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) FROM inscritos;
--774--

--3. ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);
--44 2021-01-01 Blog-- 
--56 2021-01-01 Página--

--4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY fecha ASC;
--22-01-01 100, 
--22-01-02 120, 
--22-01-03 103, 
--22-01-04 93, 
--22-01-05 88, 
--22-01-06 30, 
--22-01-07 58, 
--22-01-08 182

--5. ¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) FROM inscritos GROUP BY fuente;
--Página 441,
--Blog 333

--6.  ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha ORDER BY total DESC LIMIT 1;
--2021-08-01 182

--7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT * FROM inscritos WHERE fuente = 'Blog' ORDER BY cantidad DESC LIMIT 1;
--83 2021-08-01 Blog

--8. ¿Cuántas personas en promedio se inscriben en un día?
SELECT ROUND(AVG(total),2) FROM (SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha) AS subquery;
--96.75

--9.¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50 ORDER BY total ASC; 
--2021-07-01 58, 
--2021-05-01 88,
--2021-04-01 93,
--2021-01-01 100,
--2021-03-01 103,
--2021-02-01 120,     
--2021-08-01 182,

--10. ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT ROUND(AVG(total),2) FROM (SELECT SUM(cantidad) AS total FROM inscritos WHERE fecha >= '01-03-2021' GROUP BY fecha) AS personas;
--92.33



