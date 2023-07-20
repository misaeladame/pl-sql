/*
PRACTICA 1

  * Debemos hacer un bloque PL/SQL anónimo, donde declaramos una variable NUMBER y la ponemos algún valor.
  • Debe indicar si el número es PAR o IMPAR. Es decir debemos usar IF..... ELSE para hacer el ejercicio
  • Como pista, recuerda que hay una función en SQL denominada MOD, que permite averiguar el resto de una división.
  • Por ejemplo MOD(10,4) nos devuelve el resto de dividir 10 por 4.

*/
SET SERVEROUTPUT ON;

DECLARE
  x NUMBER := 10;
BEGIN
  IF MOD(x,2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE('El número ' || x || ' es PAR');
  ELSE
    DBMS_OUTPUT.PUT_LINE('El número ' || x || ' es IMPAR');
  END IF;
END;
/

/*
PRÁCTICA 2
  • Crear una variable CHAR(1) denominada TIPO_PRODUCTO.
  • Poner un valor entre "A" Y "E"
  • Visualizar el siguiente resultado según el tipo de producto
    o 'A' --> Electronica
    o 'B' --> Informática
    o 'C' --> Ropa
    o 'D' --> Música
    o 'E' --> Libros
    o Cualquier otro valor debe visualizar "El código es incorrecto
*/

DECLARE
  TIPO_PRODUCTO CHAR(1);
BEGIN
  TIPO_PRODUCTO := UPPER('A');
  IF TIPO_PRODUCTO = 'A' THEN
    DBMS_OUTPUT.PUT_LINE('Electronica');
  ELSIF TIPO_PRODUCTO = 'B' THEN
    DBMS_OUTPUT.PUT_LINE('Informática');
  ELSIF TIPO_PRODUCTO = 'C' THEN
    DBMS_OUTPUT.PUT_LINE('Ropa');
  ELSIF TIPO_PRODUCTO = 'D' THEN
    DBMS_OUTPUT.PUT_LINE('Música');
  ELSIF TIPO_PRODUCTO = 'E' THEN
    DBMS_OUTPUT.PUT_LINE('Libros');
  ELSE
    DBMS_OUTPUT.PUT_LINE('El código es incorrecto');
  END IF;
END;