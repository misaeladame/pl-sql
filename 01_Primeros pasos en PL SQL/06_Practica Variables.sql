/* 1-Determinar que bloques PL/SQL son correctos.

 A/
 BEGIN
 END;

 B/
 DECLARE x INTEGER(10);
 END;

 C/
 DECLARE
 BEGIN
 END;

 D/
 DECLARE
 X INTEGER(10);
 BEGIN
 DBMS_OUTPUT.PUT_LINE(x);

 END; 
 
 La opción correcta es la D
 */

 /*
 2.- Crear dos vartiables de tipo numérico y visualizar su suma
 */

DECLARE
  NUM1 NUMBER;
  NUM2 NUMBER;
  SUMA NUMBER;
BEGIN
  NUM1:=20;
  NUM2:=30;
  SUMA:= NUM1 + NUM2;

  DBMS_OUTPUT.PUT_LINE(SUMA);
END;
/

/*
3.- Modificar el ejemplo anterior y ponemos null como valor de una de las variables ¿Qué resultado arroja? Volvemos a ponerla un valor numérico
*/

DECLARE
  NUM1 NUMBER;
  NUM2 NUMBER;
  SUMA NUMBER;
BEGIN
  NUM1:=20;
  --NUM2:=NULL;
  NUM2:=23;
  SUMA:= NUM1 + NUM2;

  DBMS_OUTPUT.PUT_LINE(SUMA);
END;
/

/* Arroja un resultado nulo al colocar una de las variables como null */


/*
4.- Añadir una constante al ejercicio. Sumamos las 2 variables y la constantes. Intentar modificar la constante
¿Es posible?
*/

DECLARE
  NUM1 NUMBER;
  NUM2 NUMBER;
  NUMC CONSTANT NUMBER := 13;
  SUMA NUMBER;
BEGIN
  NUM1:=20;
  NUM2:=23;
  --NUMC := 32;
  SUMA:= NUM1 + NUM2 + NUMC;

  DBMS_OUTPUT.PUT_LINE(SUMA);
END;
/
/* No es posible modificar la constante */


/*
5 - Crear un bloque anónimo que tenga una variable de tipo VARCHAR2 con nuestro nombre,
otra numérica con la edad y una tercera con la fecha de nacimiento.Visualizarlas por separado y luego intentar concatenarlas.¿ es posible ?
*/

DECLARE
  NOMBRE VARCHAR2(100);
  EDAD NUMBER;
  FECHA_NACIMIENTO DATE;
BEGIN
  NOMBRE := 'MISAEL ADAME';
  EDAD := 23;
  FECHA_NACIMIENTO := '03/02/2000';

  DBMS_OUTPUT.PUT_LINE(NOMBRE);
  DBMS_OUTPUT.PUT_LINE(EDAD);
  DBMS_OUTPUT.PUT_LINE(FECHA_NACIMIENTO);

  DBMS_OUTPUT.PUT_LINE(NOMBRE || ' ' || EDAD || ' ' || FECHA_NACIMIENTO);
END;