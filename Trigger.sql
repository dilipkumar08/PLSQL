CREATE OR REPLACE TRIGGER TRG
BEFORE INSERT OR DELETE OR UPDATE
ON CUSTOMERS 
FOR EACH ROW 
BEGIN
INSERT INTO LOG VALUES (SEQ_LOGID.NEXTVAL,NEW.CUSTOMER_ID);
END;
/