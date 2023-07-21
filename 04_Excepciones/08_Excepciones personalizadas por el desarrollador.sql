SET SERVEROUTPUT ON;

DECLARE
  reg_max EXCEPTION;
  regn NUMBER;
  regt VARCHAR2(200);
BEGIN
  --regn := 99; -- No lanza la excepción
  regn := 101; -- Lanza la excepción
  regt := 'ASIA';
  IF regn > 100 THEN
    RAISE reg_max;
  ELSE
    INSERT INTO REGIONS VALUES (regn, regt);
    COMMIT;
  END IF;
EXCEPTION
  WHEN reg_max THEN
    DBMS_OUTPUT.PUT_LINE('La region no puede ser mayor de 100.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error indefinido');
END;
/