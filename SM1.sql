--------------------------------------------------------
-- Archivo creado  - lunes-agosto-31-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CIUDADES
--------------------------------------------------------

  CREATE TABLE "TORRES"."CIUDADES" 
   (	"CIUDADID" NUMBER(*,0), 
	"NOMBRECIUDAD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BENEFICIARIOS
--------------------------------------------------------

  CREATE TABLE "TORRES"."BENEFICIARIOS" 
   (	"BENEFICIARIOID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(75 BYTE), 
	"EDAD" NUMBER, 
	"CIUDADID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table AYUDAS
--------------------------------------------------------

  CREATE TABLE "TORRES"."AYUDAS" 
   (	"AYUDAID" NUMBER(*,0), 
	"BENEFICIARIOID" NUMBER(*,0), 
	"MONTO" NUMBER, 
	"MOTIVO" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007619
--------------------------------------------------------

  CREATE UNIQUE INDEX "TORRES"."SYS_C007619" ON "TORRES"."CIUDADES" ("CIUDADID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007622
--------------------------------------------------------

  CREATE UNIQUE INDEX "TORRES"."SYS_C007622" ON "TORRES"."BENEFICIARIOS" ("BENEFICIARIOID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007626
--------------------------------------------------------

  CREATE UNIQUE INDEX "TORRES"."SYS_C007626" ON "TORRES"."AYUDAS" ("AYUDAID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger AYUDAS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TORRES"."AYUDAS_TRG" 
BEFORE INSERT ON AYUDAS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.AYUDAID IS NULL THEN
      SELECT AYUDAS_SEQ.NEXTVAL INTO :NEW.AYUDAID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TORRES"."AYUDAS_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table CIUDADES
--------------------------------------------------------

  ALTER TABLE "TORRES"."CIUDADES" ADD PRIMARY KEY ("CIUDADID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TORRES"."CIUDADES" MODIFY ("NOMBRECIUDAD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BENEFICIARIOS
--------------------------------------------------------

  ALTER TABLE "TORRES"."BENEFICIARIOS" ADD PRIMARY KEY ("BENEFICIARIOID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TORRES"."BENEFICIARIOS" MODIFY ("EDAD" NOT NULL ENABLE);
  ALTER TABLE "TORRES"."BENEFICIARIOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AYUDAS
--------------------------------------------------------

  ALTER TABLE "TORRES"."AYUDAS" ADD PRIMARY KEY ("AYUDAID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TORRES"."AYUDAS" MODIFY ("MOTIVO" NOT NULL ENABLE);
  ALTER TABLE "TORRES"."AYUDAS" MODIFY ("MONTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BENEFICIARIOS
--------------------------------------------------------

  ALTER TABLE "TORRES"."BENEFICIARIOS" ADD FOREIGN KEY ("CIUDADID")
	  REFERENCES "TORRES"."CIUDADES" ("CIUDADID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AYUDAS
--------------------------------------------------------

  ALTER TABLE "TORRES"."AYUDAS" ADD FOREIGN KEY ("BENEFICIARIOID")
	  REFERENCES "TORRES"."BENEFICIARIOS" ("BENEFICIARIOID") ENABLE;
