/*
1. Visualizar iniciales de un nombre
  * Crea un bloque PL/SQL con tres variables VARCHAR2;
    * Nombre
    * apellido1
    * apellido2
  * Debes visualizar las iniciales separadas por puntos.
  * Además siempre en mayúscula
  * Por ejemplo, alberto pérez García debería aprecer --> A.P.G
*/

SET SERVEROUTPUT ON;

DECLARE
  NOMBRE    VARCHAR2(30);
  APELLIDO1 VARCHAR2(30);
  APELLIDO2 VARCHAR2(30);
BEGIN
  NOMBRE := 'misael';
  APELLIDO1 := 'adame';
  APELLIDO2 := 'sandoval';
  NOMBRE := UPPER(NOMBRE);
  APELLIDO1 := UPPER(APELLIDO1);
  APELLIDO2 := UPPER(APELLIDO2);
  DBMS_OUTPUT.PUT_LINE(SUBSTR(NOMBRE, 1, 1) || '.' || SUBSTR(APELLIDO1, 1, 1) || '.' || SUBSTR(APELLIDO2, 1, 1));
END;
/

/*
2. Averiguar el nombre del día que naciste, por ejemplo "Martes"
*/

DECLARE
  FECHA_NACIMIENTO DATE;
BEGIN
  FECHA_NACIMIENTO := '03-feb-00';
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(FECHA_NACIMIENTO, 'DAY'));
END;