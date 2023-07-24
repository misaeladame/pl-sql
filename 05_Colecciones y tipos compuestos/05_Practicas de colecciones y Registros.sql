/*
Práctica de COLECCIONES y RECORDS

  • Creamos un TYPE RECORD que tenga las siguientes columnas

      NAME VARCHAR2(100),
      SAL EMPLOYEES.SALARY%TYPE,
      COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE);

  • Creamos un TYPE TABLE basado en el RECORD anterior
  • Mediante un bucle cargamos en la colección los empleados. El campo NAME 
    debe contener FIRST_NAME y LAST_NAME concatenado.
  • Para cargar las filas y siguiendo un ejemplo parecido que hemos visto en el 
    vídeo usamos el EMPLOYEE_ID que va de 100 a 206
  • A partir de este momento y ya con la colección cargada, hacemos las 
    siguientes operaciones, usando métodos de la colección.
    • Visualizamos toda la colección
    • Visualizamos el primer empleado
    • Visualizamos el último empleado
    • Visualizamos el número de empleados
    • Borramos los empleados que ganan menos de 7000 y visualizamos de 
      nuevo la colección
    • Volvemos a visualizar el número de empleados para ver cuantos se han 
      borrado
*/

SET SERVEROUTPUT ON

DECLARE
  TYPE EMPLEADO IS RECORD (
    NAME VARCHAR2(100),
    SAL EMPLOYEES.SALARY%TYPE,
    COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE
  );

  TYPE EMPLEADOS IS TABLE OF
    EMPLEADO
  INDEX BY PLS_INTEGER;

  EMP EMPLEADOS;
BEGIN
  
  FOR I IN 100..206 LOOP
    SELECT FIRST_NAME || ' ' || LAST_NAME, SALARY, DEPARTMENT_ID INTO EMP(I)
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = I;

  END LOOP;

  
  FOR I IN EMP.FIRST..EMP.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(EMP(I).NAME || ' ' || EMP(I).SAL || ' ' || EMP(I).COD_DEPT);
  END LOOP; 

  DBMS_OUTPUT.PUT_LINE(EMP.FIRST);
  DBMS_OUTPUT.PUT_LINE(EMP.LAST);
  DBMS_OUTPUT.PUT_LINE(EMP.COUNT);

  FOR I In EMP.FIRST..EMP.LAST LOOP
    IF EMP(I).SAL < 7000 THEN
      EMP.DELETE(I);
    END IF;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE(EMP.COUNT);

END;
/