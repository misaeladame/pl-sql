DECLARE
  x NUMBER := 20;
BEGIN
  IF
    x = 10
  THEN
    DBMS_OUTPUT.PUT_LINE('X:=10');
  ELSE
    DBMS_OUTPUT.PUT_LINE('X:=OTHER VALUE');
  END IF;
END;
/

-- Ejemplo 2
SET SERVEROUTPUT ON
DECLARE
  sales NUMBER := 25000;
  bonus NUMBER := 0;
BEGIN
  IF sales > 50000 THEN
    bonus := 1500;
  ELSIF sales > 35000 THEN
    bonus := 500;
  ELSIF sales > 20000 THEN
    bonus := 150;
  ELSE
    bonus := 100;
  END IF;

  DBMS_OUTPUT.PUT_LINE (
    'Sales = ' || sales || ', bonus = ' || bonus || '.'
  );
END;