SET SERVEROUTPUT ON;

DECLARE
  regn NUMBER;
  regt VARCHAR2(200);
BEGIN
  regn := 101;
  regt := 'ASIA';
  IF regn > 100 THEN
    -- EL CODIGO DEBE ESTAR ENTRE -20000 y -20999
    RAISE_APPLICATION_ERROR(-20001, 'LA ID NO PUEDE SER MAYOR DE 100');
  ELSE
    insert into REGIONS values (regn, regt);
    commit;
  END IF;
END;
/