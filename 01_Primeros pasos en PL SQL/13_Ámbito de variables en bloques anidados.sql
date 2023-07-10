SET SERVEROUTPUT ON

DECLARE
  x NUMBER := 20;  --VARIABLE Global
  z NUMBER := 30;
BEGIN
  DBMS_OUTPUT.PUT_LINE('x:=' || x);
  DECLARE
    x NUMBER := 10;  -- Variable Local
    z NUMBER := 100;
    y NUMBER := 200;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('x:=' || x);
    DBMS_OUTPUT.PUT_LINE('z:=' || z);
  END;
  --DBMS_OUTPUT.PUT_LINE('y:=' || y);
END;