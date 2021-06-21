-- A1 Ü2
-- iSQL*Plus-Befehle greifen auf die Datenbank zu
-- Wahr

-- A1 Ü3
-- Die folgende SELECT-Anweisung wird erfolgreich ausgeführt:
SELECT last_name, job_id, salary AS Sal
FROM employees;
-- Wahr

-- A1 Ü4
-- Die folgende SELECT-Anweisung wird erfolgreich ausgeführt:
SELECT *
FROM job_grades;
-- Falsch
-- Tabelle oder View nicht vorhanden aber grunsätzlich schon

-- A1 Ü5
-- 5. Die folgende Anweisung enthält vier Kodierungsfehler. Können Sie alle vier Fehler finden?
SELECT employee_id, last_name
sal x 12 ANNUAL SALARY
FROM employees;
-- SELECT employee_id, last_name, salary*12 AS ANNUAL_SALARY FROM employees;

-- A1 Ü6
-- Ausprobiert

-- A1 Ü7
-- Zunächst müssen Sie Struktur und Inhalt der Tabelle DEPARTMENTS bestimmen
-- DESCRIBE Departments;

-- A1 Ü8
-- Sie müssen auch die Struktur der Tabelle EMPLOYEES bestimmen.
-- DESCRIBE Employees;

-- A1 Ü9
-- Die Personalabteilung wünscht eine Abfrage, um für jeden Angestellten den Nachnamen, die Job-Kennung, das Einstellungsdatum und die Angestelltennummer anzuzeigen, wobei die Angestelltennummer als erster Wert angezeigt werden soll. Geben Sie den Alias STARTDATE für die Spalte HIRE_DATE an.
Speichern Sie die SQL-Anweisung in der Datei lab_01_07.sql, damit Sie diese Datei an die Personalabteilung weiterleiten können.
Testen Sie die Abfrage in der Datei lab_01_07.sql, um sicherzustellen, dass sie korrekt ausgeführt wird.
-- SELECT employee_id, last_name, job_id, hire_date AS startdate FROM employees;

-- A1 Ü10
-- Die Personalabteilung benötigt eine Abfrage, um alle eindeutigen Job-Kennungen aus der Tabelle EMPLOYEES anzuzeigen.
-- SELECT DISTINCT JOB_ID FROM employees;

-- A1 Ü11
-- Die Personalabteilung wünscht aussagekräftigere Spaltenüberschriften für die auf Angestellte bezogenen Berichte. Kopieren Sie die Anweisung aus lab_01_07.sql in das Textfeld in iSQL*Plus. Geben Sie den Spalten die Überschriften Emp #, Employee, Job und Hire Date. Führen Sie die Abfrage erneut aus.
-- SELECT employee_id AS "Emp #", last_name AS "Employee", job_id AS "Job", TO_CHAR(hire_date,'DD-MON-RR') AS "Hire Date" FROM employees;

-- A1 Ü12
-- Die Personalabteilung hat einen Bericht über alle Angestellte und deren Job-Kennungen angefordert. Verketten Sie den Nachnamen mit der Job-Kennung (durch Komma und Leerzeichen getrennt), und nennen Sie die Spalte Employee and Title.
-- SELECT last_name || ', ' || SUBSTR(job_id,1,6) AS "Employee and Title" FROM employees;

-- A1 Ü13
-- Um sich mit der Tabelle EMPLOYEES vertraut zu machen, erstellen Sie eine Abfrage, die alle Daten aus dieser Tabelle anzeigt. Trennen Sie die Spaltenausgabe durch Kommata. Benennen Sie die Spalte THE_OUTPUT.
-- SELECT EMPLOYEE_ID||',' || FIRST_NAME||','|| LAST_NAME||','||EMAIL||','|| PHONE_NUMBER||','||HIRE_DATE||','||JOB_ID||','|| SALARY||','|| COMMISSION_PCT||','||MANAGER_ID||','||DEPARTMENT_ID as "THE_OUTPUT" FROM employees;

-- A2 Ü1
SELECT last_name, salary FROM employees WHERE salary > 12000;

-- A2 Ü2
SELECT last_name, department_id FROM employees WHERE department_id = 176;

-- A2 Ü3
SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000;

-- A2 Ü4
ALTER SESSION SET NLS_LANGUAGE = 'English';
SELECT last_name, job_id, TO_CHAR(hire_date,'DD-MON-YY') FROM employees
WHERE last_name IN ('Matos','Taylor')
ORDER BY hire_date;

-- A2 Ü5
SELECT last_name, department_id
FROM employees
WHERE department_id IN (20,50)
ORDER BY last_name ASC;

-- A2 Ü6
SELECT last_name, salary AS "Monthly Salary"
FROM employees
WHERE department_id IN (20,50) and salary BETWEEN 5000 AND 12000
ORDER BY last_name ASC;

-- A2 Ü7
SELECT last_name, salary, hire_date AS "Monthly Salary"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)=1994 AND last_name IN('Higgins','Gietz')
ORDER BY last_name ASC;

-- A2 Ü8
SELECT last_name, JOB_ID FROM employees WHERE manager_id IS NULL;

-- A2 Ü9
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct IS NOT NULL;

-- A2 Ü10
SELECT last_name, salary, commission_pct
FROM employees
WHERE salary>&val;

-- A2 Ü11
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE manager_id=&managerEingabeID AND employee_id IN(104,107);

-- A2 Ü12
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE manager_id=&managerEingabeID AND employee_id IN(104,107)
SORT BY &sortval ASC;

--A3

-- A3 Ü1
SELECT sysdate AS SYSDATUM FROM DUAL;
-- so nicht:
SELECT sysdate AS DATE FROM DUAL;
-- so gehts:
SELECT sysdate AS "DATE" FROM DUAL;

-- A3 Ü2
SELECT employee_id, last_name, salary, ROUND(salary*1.155,0) AS "New Salary" FROM EMPLOYEES;

-- A3 Ü4
DEFINE new_salary = ROUND(salary*1.155) FROM employees;
SELECT employee_id, last_name, salary, &new_salary AS "New Salary", &new_salary-salary AS "Increase" FROM EMPLOYEES;

-- A3 Ü5
SELECT last_name, LENGTH(last_name) AS "Length" FROM employees WHERE SUBSTR(last_name,0,1) IN ('J','A','M') ORDER BY last_name;

-- or

SELECT INITCAP(last_anme) AS "NAME", LENGTH(last_name) AS "Length"
FROM employees
WHERE last_name LIKE 'J%'
OR last_name LIKE 'M%'
OR ast_name LIKE 'A%'
ORDER BY last_name;

-- b

SELECT INITCAP(last_name) AS "Name", LENGTH(last_name) AS "Length"
FROM employees
WHERE last_name LIKE '&start_letter%'
ORDER BY last_name;

-- A3 Ü6
-- SELECT last_name, LENGTH(last_name) AS "Length" FROM employees WHERE SUBSTR(last_name,0,1) IN (&firstLastNameLetter) ORDER BY last_name;

SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS MONTHS_WORKED FROM employees ORDER BY MONTHS_BETWEEN(SYSDATE, hire_date);

-- A3 Ü7
SELECT LAST_NAME || ' earns ' || to_char(SALARY, 'fmL99G999D99MI') || ' monthly but wants ' || to_char(3*SALARY, 'fmL99G999D99MI') AS "Dream Salaries" from employees;
-- mit g und d internationaler

-- A3 Ü8
SELECT last_name, LPAD(salary,15,'$') as SALARY FROM employees;

-- A3 Ü9
ALTER SESSION SET nls_language = 'english';
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date,6),'MONDAY'),'fmDay,"the " Ddspth " of" Month, YYYY') AS REVIEW FROM employees;

-- A3 Ü10
SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS "DAY"
FROM employees ORDER BY TO_CHAR(hire_date, 'd')

SELECT last_name, hire_date, TO_CHAR(hire_date,'DAY') AS DAY
FROM employees
ORDER BY TO_CHAR(hire_date-1, 'd')

-- A3 Ü11
SELECT LAST_NAME, CASE WHEN commission_pct IS NULL THEN 'No Commission' ELSE TO_CHAR(commission_pct) END FROM employees;

SELECT last_name, NVL(TO_CHAR(commission_pct), 'No Commission') AS COMM FROM employees;

-- A3 Ü12

SELECT RPAD(last_name, salary/1000, '*') AS "Employees and their salaries" FROM employees ORDER BY salary DESC;

SELECT rpad(last_name, 8) ||' '|| RPAD ('*', salary/1000+1, '*') AS 'employees_and...'

--A3 Ü13

SELECT job_id,
DECODE(job_id, 'IT_PROG', 'C', 'ST_MAN', 'B', 'SA_REP', 'D', 'ST_CLERK', 'E', 'AD_PRES','A','0')
FROM employees;


--A3 Ü14

SELECT job_id, CASE job_id
WHEN 'AD_PRES' THEN 'A'
WHEN 'IT_PROG' THEN 'C'
WHEN 'ST_CLERK' THEN 'E'
WHEN 'SA_REP' THEN 'D'
WHEN 'ST_MAN' THEN 'B'
ELSE '0'
END "REVISED_SALARY"
FROM employees;



--A3 Ü15

SELECT * FROM wildcard;

SELECT *
FROM wildcard
WHERE test LIKE '%\%%' ESCAPE '\';

--A3 Ü16

SELECT last_name, salary, rpad('|', (salary/500)+1, '*') AS "sal_chart" FROM employees;

--A3 Ü17

SELECT last_name, salary, rpad('|', salary/1000, '_ ')||'*' AS "sal_chart" FROM employees ORDER BY salary ASC;

--A3 Ü18

SELECT last_name, salary, commission_pct * 1000, rpad('|', salary/1000, '*') || trim(rpad(' ', salary * commission_pct/500, '#')) AS pay_chart FROM employees WHERE commission_pct IS NOT NULL;

--A3 Ü19

SELECT rownum FROM employees WHERE rownum < 21;

--A4

--A4 Ü1

Wahr

--A4 Ü2

Falsch

--A4 Ü3

Wahr

--A4 Ü4

SELECT MAX(salary) AS "Maximum", MIN(salary) AS "Minimum", SUM(salary) AS "Sum", AVG(salary) AS "Avg" FROM employees;

--A4 Ü5

SELECT job_id, MAX(salary) AS "Maximum", MIN(salary) AS "Minimum", SUM(salary) AS "Sum", AVG(salary) AS "Avg" FROM employees GROUP BY job_id ORDER BY job_id;

--A4 Ü6 a

select job_id, count(job_id) from employees group by job_id;

-- b
-- & für variable
-- c

--A4 Ü7

SELECT manager_id, COUNT(manager_id) AS "Number of Managers" FROM employees GROUP BY manager_id;

--A4 Ü8

SELECT MAX(salary) - MIN(salary) AS DIFFERENCE FROM employees;

--A4 Ü9

SELECT manager_id, MIN(salary) FROM employees GROUP BY manager_id HAVING SUM(salary) <= 6000 ORDER BY SUM(salary) ASC;

--A4 Ü10

SELECT
COUNT(*) AS "Total",
SUM(DECODE(TO_CHAR(hire_date, 'yyyy'),'1995',1,0)) AS "1995",
SUM(DECODE(TO_CHAR(hire_date, 'yyyy'),'1996',1,0)) AS "1996",
SUM(DECODE(TO_CHAR(hire_date, 'yyyy'),'1997',1,0)) AS "1997",
SUM(DECODE(TO_CHAR(hire_date, 'yyyy'),'1998',1,0)) AS "1998"
FROM employees
GROUP BY job_id
ORDER BY job_id;

--A4 Ü11

SELECT
job_id AS "Job",
SUM(DECODE(department_id, 20, salary, NULL)) AS "Dept 20",
SUM(DECODE(department_id, 50, salary, NULL)) AS "Dept 50",
SUM(DECODE(department_id, 80, salary, NULL)) AS "Dept 80",
SUM(DECODE(department_id, 90, salary, NULL)) AS "Dept 90",
SUM(salary) AS "Total"
FROM employees
GROUP BY job_id
ORDER BY job_id;

--A5 Ü1
SELECt ocatioN_id, street_address, city, state_province, country_name FROM locations NATURAL JOIN countries;

--A5 Ü2

SELECT last_name, department_id, department_name
FROM employees JOIN departments
USING(department_id);

--A5 Ü3
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
WHERE LOWER(l.city) = 'toronto';

--A5 Ü4
SELECT w.last_name AS "Employee", w.employee_id AS "EMP#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees w JOIN employees;

--A5 Ü5
SELECT w.last_name AS "Employee", w.employee_id AS "EMP#", m.last_name AS "Manager", m.employee_id AS "Mgr#" FROM employee w
LEFT OUTER JOIN employees m ON (w.manager_id = m.employee_id);

--A5 Ü6



--A5 Ü7


--A5 Ü8


--A5 Ü9


--A5 Ü10


--A6 Ü1

DEFINE input_last_name = &input;
# UNDEFINE input_last_name;

SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE last_name=&input_last_name) AND NOT last_name = &input_last_name;
# &&input_last_name

--A6 Ü2

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--A6 Ü3

SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
SELECT department_id FROM employees WHERE last_name LIKE '%u%' GROUP BY department_id
);

--A6 Ü4
--a

SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 1800);

--b

DEFINE user_location = &user_location;

SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = &user_location);

--A6 Ü5

SELECT last_name, salary
FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees WHERE last_name = 'King');

--A6 Ü6

SELECT department_id, last_name, job_id
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Executive');

--A6 Ü7


--A7 Ü1

SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees
WHERE job_id = 'ST_CLERK';

--A7 Ü2

SELECT UNIQUE country_id
FROM locations
WHERE location_id IN (SELECT location_id
FROM locations
MINUS
SELECT location_id
FROM departments);

--A7 Ü3


--A7 Ü4
--A7 Ü5
--A7 Ü6
--A7 Ü7
--A7 Ü2
--A7 Ü2

# Lektion A6
## 1
UNDEFINE last_name;
SELECT last_name, hire_date FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE last_name = &&last_name) AND NOT last_name = &&last_name;

## 2
SELECT employee_id, last_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

## 3
SELECT employee_id, last_name FROM employees WHERE department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%');

## 4
### a)
SELECT last_name, department_id, job_id FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE department_id = employees.department_id AND location_id = 1700);

### b)
SELECT last_name, department_id, job_id FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE department_id = employees.department_id AND location_id = &location_id);

## 5
SELECT last_name, salary FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE last_name = 'King');

## 6
SELECT department_id, last_name, job_id FROM employees WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Executive');

## 7
SELECT employee_id, last_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees) AND department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%');


# Lektion A7
## 1
SELECT department_id FROM departments
MINUS
SELECT department_id FROM departments WHERE (SELECT COUNT(employee_id) FROM employees WHERE employees.department_id = departments.department_id AND job_id = 'ST_CLERK') > 0;

## 2
SELECT country_id, country_name FROM countries
MINUS
SELECT country_id, c.country_name FROM departments JOIN locations l USING (location_id) JOIN countries c USING (country_id);

## 3
COLUMN sort NOPRINT;
SELECT job_id, department_id, DECODE(department_id, 10, 1, 50, 2, 20, 3, 0) AS sort FROM employees
MINUS
SELECT job_id, department_id, 0 AS sort FROM employees WHERE department_id IS NULL OR department_id NOT IN (10,20,50)
ORDER BY sort;

## 4
SELECT employee_id, job_id FROM employees;
INTERSECT
SELECT employee_id, job_id FROM job_history;

## 5
SELECT last_name, department_id, department_name FROM employees
LEFT OUTER JOIN departments USING (department_id)
UNION
SELECT '', department_id, department_name FROM departments;

# Lektion 8
## 3
INSERT INTO MY_EMPLOYEE VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

## 4
INSERT INTO MY_EMPLOYEE (id, last_name, first_name, userid, salary) VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

## 5
SELECT * FROM MY_EMPLOYEE;

## 6
DEFINE employee_id = &employee_id;
DEFINE first_name = &first_name;
DEFINE last_name = &last_name;
INSERT INTO MY_EMPLOYEE VALUES (&&employee_id, '&&last_name', '&&first_name', LOWER(SUBSTR('&&first_name',1,1) || SUBSTR('&&last_name',1,7)), &salary);
UNDEFINE employee_id;
UNDEFINE first_name;
UNDEFINE last_name;

## 9
COMMIT;

## 10
UPDATE MY_EMPLOYEE SET last_name = 'Drexler' WHERE id = 3;

## 11
UPDATE employees SET salary = 1000 WHERE salary < 900



--A8 Ü1
-- -

--A8 Ü2
describe my_employee;


--A8 Ü3

INSERT INTO my_employee
VALUES (1,'Patel','Ralph','rpatel',895);

--A8 Ü4


INSERT INTO my_employee(id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs','Betty','bdancs',860);

--A8 Ü5

SELECT * from my_employee;


--A8 Ü6

DEFINE id_var = &id_var;
DEFINE last_name_var = &last_name_var;
DEFINE first_name_var = &first_name_var;
DEFINE salary_var = &salary_var;

INSERT INTO my_employee(id, last_name, first_name, userid, salary)
VALUES (&id_var,'&last_name_var','&first_name_var', LOWER(SUBSTR('&first_name_var',1,1)||SUBSTR('&last_name_var',1,7)),&salary_var);

UNDEFINE last_name_var;
UNDEFINE first_name_var;
UNDEFINE id_var;
UNDEFINE salary_var;

--A8 Ü7
-- -

--A8 Ü8
select * from my_employee;

--A8 Ü9
commit;

--A8 Ü10
UPDATE my_employee
SET last_name='Drexler'
WHERE id=3;

--A8 Ü11
UPDATE my_employee
SET salary=1000
WHERE salary<900;

--A8 Ü12
select * from my_employee;

--A8 Ü13
delete from my_employee
WHERE id=2;

--A8 Ü14
select * from my_employee;

--A8 Ü15
commit;

--A8 Ü16
-- -

--A8 Ü17
select * from my_employee;

--A8 Ü18
savepoint my_employee_sp;

--A8 Ü19
delete from my_employee;

--A8 Ü20
select * from my_employee;

--A8 Ü21
rollback;

--A8 Ü22
commit;




# Lektion 9
## 1
CREATE TABLE DEPT (
  ID NUMBER(7),
  NAME VARCHAR2(25),
  
  CONSTRAINT DEPT_PK PRIMARY KEY (ID)
);

## 2
INSERT INTO DEPT (
    SELECT department_id, department_name FROM departments
);

## 3
CREATE TABLE EMP (
    ID NUMBER(7),
    LAST_NAME VARCHAR2(25),
    FIRST_NAME VARCHAR2(25),
    DEPT_ID NUMBER(7),
    
    CONSTRAINT DEPT_ID_FK FOREIGN KEY (DEPT_ID) REFERENCES DEPT(ID)
);

## 4
CREATE TABLE EMPLOYEES2 AS
SELECT employee_id AS id, first_name, last_name, salary, department_id AS dept_id FROM employees;

## 5
DROP TABLE EMP;
DROP TABLE EMPLOYEES2;

## 6
CREATE TABLE EMPLOYEES2 (
    ID NUMBER(6),
    FIRST_NAME VARCHAR2(25),
    LAST_NAME VARCHAR2(25),
    SALARY NUMBER(6),
    DEPT_ID NUMBER(4),

    CONSTRAINT EMPLOYEES2_PK PRIMARY KEY (ID)
);

## 7
DROP TABLE EMPLOYEES2;



# Lektion 10

## 1
CREATE VIEW EMPLOYEES_VU AS SELECT employee_id, last_name AS employee, department_id FROM employees;

## 2
SELECT * FROM EMPLOYEES_VU;

## 3
SELECT employee, department_id FROM EMPLOYEES_VU;

## 4
CREATE VIEW empvu50 AS SELECT employee_id AS empno, last_name AS employee, department_id AS deptno FROM employees WHERE department_id = 50 WITH CHECK OPTION CONSTRAINT empvu50;

## 5
DESC empvu50;

## 6
UPDATE empvu50 SET deptno = 80 WHERE employee='Matos';
FEHLER in Zeile 1:
ORA-01402: Verletzung der WHERE-Klausel einer View WITH CHECK OPTION

## 7
CREATE SEQUENCE dept_pk INCREMENT BY 10 START WITH 200

10.08

INSERT INTO dept
VALUES (dept_id_seq, 'Education');

INSERT INTO dept
VALUES (dept_id_seq, 'Administration');

10.09

CREATE INDEX dept_deptname_index
ON dept (name);

10.10

CREATE SYNONYM emp
FOR employees;
11.01

SELECT column_name, data_type, data_length, data_precision AS precision, data_scale AS scale, nullable
FROM user_tab_columns
WHERE LOWER(table_name) = 'departments';

11.02

SELECT col.column_name, constraint_name, con.constraint_type AS con, con.search_condition, con.status
FROM user_constraints con
JOIN user_cons_columns col USING (constraint_name)
WHERE LOWER(col.table_name) = '&table';

11.03

COMMENT ON TABLE departments
IS 'Company department information including name, code and location.';

SELECT comments
FROM user_tab_comments
WHERE LOWER(table_name) = 'departments';

11.04

SELECT synonym_name, table_owner, table_name, db_link
FROM user_synonyms;

11.05

SET LONG 100000

SELECT view_name, text
FROM user_views;

11.06

SELECT sequence_name, max_value, increment_by, last_number
FROM user_sequences;
