/*
1- Crear un bloque que inserte un nuevo departamento en la tabla 
DEPARTMENTS. Para saber el DEPARTMENT_ID que debemos asignar al 
nuevo departamento primero debemos averiguar el valor mayor que hay en la 
tabla DEPARTMENTS y sumarle uno para la nueva clave.

• Location_id debe ser 1000
• Manager_id debe ser 100
• Department_name debe ser “INFORMATICA”
• NOTA: en PL/SQL debemos usar COMMIT y ROLLBACK de la misma 
  forma que lo hacemos en SQL. Por tanto, para validar definitivamente un 
  cambio debemos usar COMMIT
*/

DECLARE
  NUEVO_DEPARTAMENTO_ID DEPARTMENTS.DEPARTMENT_ID%TYPE;
BEGIN
  SELECT
    MAX(DEPARTMENT_ID) INTO NUEVO_DEPARTAMENTO_ID
  FROM
    DEPARTMENTS;

  NUEVO_DEPARTAMENTO_ID := NUEVO_DEPARTAMENTO_ID + 1;
  
  INSERT INTO DEPARTMENTS (DEPARTMENT_ID, LOCATION_ID, MANAGER_ID, DEPARTMENT_NAME)
  VALUES (NUEVO_DEPARTAMENTO_ID, 1000, 100, 'INFORMATICA');
  COMMIT;

END;
/

/*
2- Crear un bloque PL/SQL que modifique la LOCATION_ID del nuevo 
departamento a 1700. En este caso usemos el COMMIT dentro del bloque 
PL/SQL.
*/

DECLARE
  NEW_LOCATION_ID DEPARTMENTS.LOCATION_ID%TYPE := 1700;
  NOMBRE_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_NAME%TYPE := 'INFORMATICA';
BEGIN
  UPDATE DEPARTMENTS 
  SET LOCATION_ID = NEW_LOCATION_ID 
  WHERE DEPARTMENT_NAME = NOMBRE_DEPARTAMENTO;
  COMMIT;
END;
/

/*
3- Por último, hacer otro bloque PL/SQL que elimine ese departamento nuevo.
*/

DECLARE
  NOMBRE_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_NAME%TYPE := 'INFORMATICA';
BEGIN
  DELETE FROM 
    DEPARTMENTS
  WHERE
    DEPARTMENT_NAME = NOMBRE_DEPARTAMENTO;
  COMMIT;
END;
/