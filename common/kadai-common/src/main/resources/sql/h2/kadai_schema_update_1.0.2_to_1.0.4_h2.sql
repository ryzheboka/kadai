-- this script update the tables KADAI_SCHEMA_VERSION and WORKBASKET.

SET SCHEMA %schemaName%;

INSERT INTO KADAI_SCHEMA_VERSION (VERSION, CREATED) VALUES ('1.0.4', CURRENT_TIMESTAMP);

ALTER TABLE WORKBASKET ADD COLUMN MARKED_FOR_DELETION SMALLINT NOT NULL DEFAULT false;
