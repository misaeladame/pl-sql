/*
Queremos calcular el impuesto de un producto:
  * El impuesto será del 21%. Le debemos poner en una constante.
  * Creamos una variable de tipo number (5, 2) para poner el precio del producto.
  * Creamos otra variable para el resultado. Le decimos que es del mismo tipo (type) que la anterior.
  * Hacemos el cálculo y visualizamos el resultado.
*/

SET SERVEROUTPUT ON;

DECLARE
    impuesto        CONSTANT NUMBER := 0.21;
    precio_producto NUMBER(5, 2);
    resultado       precio_producto%TYPE;
BEGIN
    precio_producto := 100;
    resultado := precio_producto + ( precio_producto * impuesto );
    dbms_output.put_line(resultado);
END;