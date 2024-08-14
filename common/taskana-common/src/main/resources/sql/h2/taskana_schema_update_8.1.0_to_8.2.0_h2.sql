-- this script updates the TASKANA database schema from version 8.1.0 to version 8.2.0.
SET SCHEMA %schemaName%;

INSERT INTO TASKANA_SCHEMA_VERSION (ID, VERSION, CREATED)
VALUES (nextval('TASKANA_SCHEMA_VERSION_ID_SEQ'), '7.1.0', CURRENT_TIMESTAMP);

ALTER TABLE TASK
    ADD COLUMN NUMBER_OF_COMMENTS INT DEFAULT 0;

UPDATE TASK t
SET NUMBER_OF_COMMENTS = (
	SELECT COUNT(tc.ID)
	FROM TASK_COMMENT tc
	WHERE tc.TASK_ID = t.ID
)
WHERE EXISTS (
	SELECT 1
	FROM TASK_COMMENT tc
	WHERE tc.TASK_ID = t.ID
);