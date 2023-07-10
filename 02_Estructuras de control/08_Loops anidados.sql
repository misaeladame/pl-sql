DECLARE
  s PLS_INTEGER := 0;
  i PLS_INTEGER := 0;
  j PLS_INTEGER;
BEGIN
  <<parent>>
  LOOP
    --Print Parent
    i := i + 1;
    j := 100;
    DBMS_OUTPUT.PUT_LINE('Parent:' || i);
    <<child>>
    LOOP
      --Print child
      EXIT parent WHEN (i > 3);
      DBMS_OUTPUT.PUT_LINE('Child:' || j);
      j := j + 1;
      EXIT child WHEN (j > 105);
    END LOOP child;
  END LOOP parent;
  DBMS_OUTPUT.PUT_LINE('FINISH¡¡¡');
END;
/