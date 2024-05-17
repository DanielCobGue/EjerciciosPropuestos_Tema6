--EJERCICIO 5--
--A)--
CREATE OR REPLACE PROCEDURE p_DNI(i_CODEMPLEADO VARCHAR2) IS
    v_DNI VARCHAR(9);
    CODEMPLEADO VARCHAR(5) := i_CODEMPLEADO;
BEGIN
    SELECT DNI 
    INTO v_DNI
    FROM DATOSPERSONALES
    WHERE CLAVE_EMPLEADO = CODEMPLEADO;
  
    DBMS_OUTPUT.PUT_LINE('El DNI para ese codigo de empleado es: '||v_DNI);
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error');
END;

CALL p_DNI('EMP09');

--B)--
CREATE OR REPLACE FUNCTION f_NUMEMPLEADOS RETURN NUMBER IS
    v_NUM NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_NUM
    FROM DEPARTAMENTO, EMPLEADOS
    WHERE DEPARTAMENTO.ID_DEPARTAMENTO = EMPLEADOS.ID_DEPARTAMENTO
    AND DEPARTAMENTO.NOMBRE = 'Personal';

    RETURN v_NUM;
END;

SELECT f_NUMEMPLEADOS() FROM DUAL;

--C)--
CREATE OR REPLACE FUNCTION f_NUMEMPLEADOSC(i_NOMBREDEPARTAMENTO VARCHAR2) RETURN VARCHAR2 IS
    v_NUM NUMBER;
    v_NOMBREDEPARTAMENTO VARCHAR(20) := i_NOMBREDEPARTAMENTO;
BEGIN
    SELECT COUNT(*)
    INTO v_NUM
    FROM DEPARTAMENTO, EMPLEADOS
    WHERE DEPARTAMENTO.ID_DEPARTAMENTO = EMPLEADOS.ID_DEPARTAMENTO
    AND DEPARTAMENTO.NOMBRE = v_NOMBREDEPARTAMENTO;

    RETURN v_NUM;
END;

SELECT f_NUMEMPLEADOSC('Manufactura') FROM DUAL;