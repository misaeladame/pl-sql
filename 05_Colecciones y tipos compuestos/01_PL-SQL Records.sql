SET SERVEROUTPUT ON;
DECLARE
  TYPE empleado IS RECORD (
    nombre varchar2(100),
    salario number,
    fecha employees.hire_date%type,
    datos employees%rowtype
  );

  emple1 empleado;
  emple2 empleado;
BEGIN
  SELECT * INTO EMPLE1.DATOS
  FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;

  emple1.nombre := emple1.datos.first_name || ' ' || emple1.datos.last_name;
  emple1.salario := emple1.datos.salary*0.80;
  emple1.fecha := emple1.datos.hire_date;

  DBMS_OUTPUT.PUT_LINE(emple1.nombre);
  DBMS_OUTPUT.PUT_LINE(EMPLE1.salario);
  DBMS_OUTPUT.PUT_LINE(EMPLE1.fecha);
  DBMS_OUTPUT.PUT_LINE(EMPLE1.datos.first_name);
  emple2 := emple1;
  DBMS_OUTPUT.PUT_LINE(EMPLE2.NOMBRE);
END;