/*
1. PRÁCTICA 1
• Crear un bloque PL/SQL que devuelva al salario máximo del departamento 100 y lo deje en una variable denominada salario_maximo y la visualice

*/
SET SERVEROUTPUT ON;

DECLARE
  SALARIO_MAXIMO EMPLOYEES.SALARY%TYPE;
BEGIN
  SELECT
    MAX(SALARY) INTO SALARIO_MAXIMO
  FROM
    EMPLOYEES
  WHERE
    DEPARTMENT_ID = 100;

  DBMS_OUTPUT.PUT_LINE(SALARIO_MAXIMO);
END;
/

/*
2. PRÁCTICA2
• Visualizar el tipo de trabajo del empleado número 100
*/

DECLARE
  TIPO_TRABAJO EMPLOYEES.JOB_ID%TYPE;
BEGIN
  SELECT
    JOB_ID INTO TIPO_TRABAJO
  FROM
    EMPLOYEES
  WHERE
    EMPLOYEE_ID = 100;

  DBMS_OUTPUT.PUT_LINE(TIPO_TRABAJO);
END;
/

/*
3. PRÁCTICA 3
• Crear una variable de tipo DEPARTMENT_ID y ponerla algún valor, por ejemplo 10.
• Visualizar el nombre de ese departamento y el número de empleados que tiene, poniendo. Crear dos variables para albergar los valores.
*/

DECLARE
  TIPO_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_ID%TYPE := 10;
  NOMBRE_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_NAME%TYPE;
  NUMERO_EMPLEADOS NUMBER;
BEGIN
  -- Nombre de Departamentos
  SELECT
    DEPARTMENT_NAME INTO NOMBRE_DEPARTAMENTO
  FROM
    DEPARTMENTS
  WHERE
    DEPARTMENT_ID = TIPO_DEPARTAMENTO;

  -- Número de empleados del departamento
  SELECT
    COUNT(DEPARTMENT_ID) INTO NUMERO_EMPLEADOS
  FROM
    EMPLOYEES
  WHERE
    DEPARTMENT_ID = TIPO_DEPARTAMENTO;

  DBMS_OUTPUT.PUT_LINE('El departamento ' || NOMBRE_DEPARTAMENTO || ' tiene ' || NUMERO_EMPLEADOS || ' empleado(s).');
END;
/
  
/*
4. PRÁCTICA 4
• Mediante dos consultas recuperar el salario máximo y el salario mínimo de la empresa e indicar su diferencia
*/
   
DECLARE
  SALARIO_MAXIMO EMPLOYEES.SALARY%TYPE;
  SALARIO_MINIMO EMPLOYEES.SALARY%TYPE;
  DIFERENCIA_SALARIO EMPLOYEES.SALARY%TYPE;
BEGIN
  SELECT
    MAX(SALARY) INTO SALARIO_MAXIMO
  FROM
    EMPLOYEES;

  SELECT
    MIN(SALARY) INTO SALARIO_MINIMO
  FROM
    EMPLOYEES;

  DIFERENCIA_SALARIO := SALARIO_MAXIMO - SALARIO_MINIMO;

  DBMS_OUTPUT.PUT_LINE('La diferencia entre Salario Máximo y mínimo de la empresa es de ' || DIFERENCIA_SALARIO);
END;
/