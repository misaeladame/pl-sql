/*
1. Modificar la practica anterior para disparar un error con RAISE_APPLICATION 
en vez de con PUT_LINE.
  a. Esto permite que la aplicación pueda capturar y gestionar el error que 
  devuelve el PL/SQ
*/

DECLARE
  REGN             NUMBER;
  REGT             VARCHAR(100);
BEGIN
  REGN := 201;
  REGT := 'COAHUILA DE ZARAGOZA';
  IF REGN > 200 THEN
    RAISE_APPLICATION_ERROR(-20001, 'LA ID NO PUEDE SER MAYOR DE 100');
  ELSE
    INSERT INTO REGIONS VALUES (
      REGN,
      REGT
    );
    COMMIT;
  END IF;
END;
/