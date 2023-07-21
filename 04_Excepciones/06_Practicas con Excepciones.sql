-- Práctica con EXCEPCIONES

/*
1- Crear una SELECT (no un cursor explícito) que devuelva el nombre de un  empleado pasándole el EMPLOYEE_ID en el WHERE, 
  • Comprobar en primer lugar que funciona pasando un empleado existente
  • Pasar un empleado inexistente y comprobar que genera un error
  • Crear una zona de EXCEPTION controlando el NO_DATA_FOUND para que pinte un mensaje como “Empleado inexistente”
*/

SET SERVEROUTPUT ON;


DECLARE
  NOMBRE_EMPLEADO EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  SELECT FIRST_NAME INTO NOMBRE_EMPLEADO
  FROM EMPLOYEES
  WHERE 1=1
  --AND EMPLOYEE_ID = 101; --Empleado existente
  AND EMPLOYEE_ID = 1; --Empleado inexistente

  DBMS_OUTPUT.PUT_LINE('El empleado es ' || NOMBRE_EMPLEADO);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Empleado inexistente'); 
END;
/

/*
2- Modificar la SELECT para que devuelva más de un empleado, por ejemplo poniendo EMPLOYEE_ID> 100. Debe generar un error. Controlar la excepción para que genere un mensaje como “Demasiados empleados en la consulta”
*/

DECLARE
  NOMBRE_EMPLEADO EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  SELECT FIRST_NAME INTO NOMBRE_EMPLEADO
  FROM EMPLOYEES
  WHERE 1=1
  AND EMPLOYEE_ID > 100;

  DBMS_OUTPUT.PUT_LINE('El empleado es ' || NOMBRE_EMPLEADO);
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Demasiados empleados en la consulta'); 
END;
/

/*
3- Modificar la consulta para que devuelva un error de división por CERO, 
por ejemplo, vamos a devolver el salario en vez del nombre y lo dividimos 
por 0. En este caso, en vez de controlar la excepción directamente, 
creamos una sección WHEN OTHERS y pintamos el error con SQLCODE 
y SQLERRM
*/

DECLARE
  SALARIO EMPLOYEES.SALARY%TYPE;
BEGIN
  SELECT SALARY INTO SALARIO
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 100;

  SALARIO := SALARIO / 0;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

/*
4- El error -00001 es clave primaria duplicada. 
  a. Aunque ya existe una predefinida (DUP_VAL_ON_INDEX) vamos 
  a crear una excepción no -predefinida que haga lo mismo. 
  b. Vamos a usar la tabla REGIONS para hacerlo más fácil 
  c. Usamos PRAGMA EXCEPTION_INIT y creamos una excepción 
  denominada “duplicado”. 
  d. Cuando se genere ese error debemos pintar “Clave duplicada, 
  intente otra”. 
*/

DECLARE
  DUPLICADO EXCEPTION;
  PRAGMA EXCEPTION_INIT(DUPLICADO, -00001);
BEGIN
  INSERT INTO REGIONS (REGION_ID, REGION_NAME)
  VALUES (1, 'Oceania');
  COMMIT;
EXCEPTION
  WHEN DUPLICADO THEN
    DBMS_OUTPUT.PUT_LINE('Clave duplicada, intente otra');
END;
/