SELECT *
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'hr3'

select * from projects..hr3

ALTER TABLE hr3
ALTER COLUMN birthdate DATE;

ALTER TABLE hr3
ALTER COLUMN hire_date DATE;

ALTER TABLE hr3 ADD age INT;

UPDATE hr3
SET age = DATEDIFF(YEAR, birthdate, GETDATE());
SET age = time





