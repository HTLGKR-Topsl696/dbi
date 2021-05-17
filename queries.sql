# Lektion A6
## 1
UNDEFINE last_name;
SELECT last_name, hire_date FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE last_name = &&last_name) AND NOT last_name = &&last_name;

## 2
SELECT employee_id, last_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
