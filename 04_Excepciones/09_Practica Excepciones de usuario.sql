/*
1- Crear una Excepción personalizada denominada CONTROL_REGIONES.
  • Debe dispararse cuando al insertar o modificar una región 
  queramos poner una clave superior a 200. Por ejemplo usando una 
  variable con ese valor.
  • En ese caso debe generar un texto indicando algo así como 
  “Codigo no permitido. Debe ser inferior a 200”
  • Recordemos que las excepciones personalizadas deben 
  dispararse de forma manual con el RAISE
*/
SET SERVEROUTPUT ON;

DECLARE
  CONTROL_REGIONES EXCEPTION;
  REGN NUMBER;
  REGT VARCHAR(100);
BEGIN
  REGN := 201;
  REGT := 'COAHUILA DE ZARAGOZA';
  IF REGN > 200 THEN
    RAISE CONTROL_REGIONES;
  ELSE
    INSERT INTO REGIONS VALUES (REGN, REGT);
    COMMIT;
  END IF;
EXCEPTION
  WHEN CONTROL_REGIONES THEN
    DBMS_OUTPUT.PUT_LINE('Codigo no permitido. Debe ser inferior a 200');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/