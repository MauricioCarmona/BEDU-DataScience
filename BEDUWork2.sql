USE tienda;
SHOW TABLES;
SELECT * FROM empleado WHERE nombre LIKE 'M%';

# RETO 1
# ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%pasta%';
# ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';
# ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '% - %';
# ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre LIKE '%Designer%';
# ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre LIKE '%Developer%';

# RETO 2
# ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) AS Promedio_salarios FROM puesto;
# (Si lo quisiéramos redondeado):
SELECT round(avg(salario)) AS Promedio_salarios FROM puesto;
# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) FROM articulo WHERE nombre LIKE '%pasta%';
# ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) AS salario_minimo, max(salario) AS salario_maximo FROM puesto;
# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT max(id_puesto) - 5 FROM puesto;
SELECT sum(salario) FROM puesto WHERE id_puesto > 995;

# RETO 3
# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) "total" FROM puesto GROUP BY nombre;
# ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) "total_salario" FROM puesto GROUP BY nombre;
# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(clave) "ventas_realizadas" FROM venta GROUP BY id_empleado;
# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) "total_ventas" FROM venta GROUP BY id_articulo;
