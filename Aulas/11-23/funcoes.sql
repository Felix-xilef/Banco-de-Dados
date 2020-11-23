DELIMITER $
CREATE FUNCTION FATORIAL (N integer) RETURNS integer
BEGIN
    DECLARE FATOR, I integer;
    SET FATOR=1;
    SET I=1;
    IF (N<=1) THEN
        RETURN FATOR;
    ELSE
        WHILE(I<=N) DO
            SET FATOR=FATOR*I;
            SET I=I+1;
        END WHILE;
    END IF;
    RETURN FATOR;
END$
DELIMITER ;