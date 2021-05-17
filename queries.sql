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
SELECT country_id FROM countries
