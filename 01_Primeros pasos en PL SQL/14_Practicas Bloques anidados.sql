/*
1. Indicar que valores visualiza X en los 3 casos de
DBMS_OUTPUT.PUT_LINE(x) en este ejemplo:

SET SERVEROUTPUT ON

DECLARE
  X NUMBER:=10;
BEGIN
  DBMS_OUTPUT.PUT_LINE(X);
  DECLARE
    X NUMBER:=20;
  BEGIN
    DBMS_OUTPUT.PUT_LINE(X);
  END;
  DBMS_OUTPUT.PUT_LINE(X);
END;
*/

/*
  Respuesta: 
  Caso 1: X visualiza el valor de 10
  Caso 2: X visualiza el valor de 20
  Caso 3: X visualiza el valor de 10
*/

/*
2. ¿Es este bloque correcto? Si no es así ¿por qué falla?

BEGIN
  DBMS_OUTPUT.PUT_LINE(X);
  DECLARE
    X NUMBER:=20;
  BEGIN
    DBMS_OUTPUT.PUT_LINE(X);
  END;
  DBMS_OUTPUT.PUT_LINE(X);
END;
*/

/*
Respuesta: Es incorrecto el bloque anterior porque solo la X está declarada en el bloque hijo, por lo tanto, no es posible usar esa variable fuera de ese bloque hijo (No es variable global).
*/

/*
3. ¿Es este bloque correcto? Si es así ¿qué valores visualiza X?

SET SERVEROUTPUT ON

DECLARE
  X NUMBER:=10;
BEGIN
  DBMS_OUTPUT.PUT_LINE(X);
  BEGIN
    DBMS_OUTPUT.PUT_LINE(X);
  END;
  DBMS_OUTPUT.PUT_LINE(X);
END;
*/

/*
Respuesta: Si es correcto, y en todos los casos la variable X visualiza el valor de 10
*/