CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" VARCHAR(30)   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "from_date" VARCHAR(30)   NOT NULL,
    "to_date" VARCHAR(30)   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" VARCHAR(30)   NOT NULL,
    "to_date" VARCHAR(30)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" VARCHAR(30)   NOT NULL,
    "to_date" VARCHAR(30)   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    "from_date" VARCHAR(30)   NOT NULL,
    "to_date" VARCHAR(30)   NOT NULL
);

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

SELECT * FROM "Departments";
SELECT * FROM "Dept_emp";
SELECT * FROM "Dept_manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM "Salaries" AS s
INNER JOIN "Employees" AS e ON
e.emp_no = s.emp_no;

SELECT * FROM "Employees"
WHERE hire_date LIKE '1986%';

SELECT "Departments".dept_no, "Departments".dept_name, "Dept_manager".emp_no, "Employees".last_name, "Employees".first_name, "Dept_manager".from_date, "Dept_manager".to_date
FROM "Departments"
JOIN "Dept_manager"
ON "Departments".dept_no = "Dept_manager".dept_no
JOIN "Employees"
ON "Dept_manager".emp_no = "Employees".emp_no;

-- 4. 
SELECT "Dept_emp".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Dept_emp"
JOIN "Employees"
ON "Dept_emp".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Dept_emp".dept_no = "Departments".dept_no;

-- 5. 
SELECT first_name, last_name
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. 
SELECT "Dept_emp".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Dept_emp"
JOIN "Employees"
ON "Dept_emp".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Dept_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales';

-- 7. 
SELECT "Dept_emp".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Dept_emp"
JOIN "Employees"
ON "Dept_emp".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Dept_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales' 
OR "Departments".dept_name = 'Development';

-- 8. 
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM "Employees"
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;