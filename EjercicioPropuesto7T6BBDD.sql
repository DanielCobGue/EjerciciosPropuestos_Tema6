--EJERCICIO 7--
CREATE OR REPLACE FUNCTION PARIMPAR(i_NUM IN NUMBER) RETURN VARCHAR2 IS
    v_NUM NUMBER:=i_NUM;
BEGIN
    IF MOD(v_NUM,2) =0 THEN
        RETURN 'TRUE';
    ELSE
        RETURN 'FALSE';
    END IF;
END;

SELECT PARIMPAR(5) FROM DUAL;