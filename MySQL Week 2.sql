Last login: Thu Feb  3 19:27:05 on console

The default interactive shell is now zsh.
To update your account to use zsh, please run `chsh -s /bin/zsh`.
For more details, please visit https://support.apple.com/kb/HT208050.
Beau-Simons-MBP:~ simon$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use employees
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select titles.title as 'Title', count(titles.title) as 'Number of Employees'
    -> from employees
    -> inner join titles
    -> on employees.emp_no = titles.emp_no
    -> where birth_date > '1965-01-01'
    -> group by title;
+--------------------+---------------------+
| Title              | Number of Employees |
+--------------------+---------------------+
| Senior Staff       |                 612 |
| Staff              |                 703 |
| Technique Leader   |                  95 |
| Senior Engineer    |                 589 |
| Engineer           |                 657 |
| Assistant Engineer |                  97 |
+--------------------+---------------------+
6 rows in set (0.08 sec)

mysql> select title as 'Title', avg(salary) as 'Average Salary'
    -> from salaries
    -> inner join titles
    -> on salaries.emp_no = titles.emp_no
    -> group by (title);
+--------------------+----------------+
| Title              | Average Salary |
+--------------------+----------------+
| Senior Engineer    |     60543.2191 |
| Staff              |     69308.7124 |
| Engineer           |     59508.0751 |
| Senior Staff       |     70470.5013 |
| Assistant Engineer |     59304.9863 |
| Technique Leader   |     59294.3742 |
| Manager            |     66924.2706 |
+--------------------+----------------+
7 rows in set (5.72 sec)

mysql> select dept_name as 'Department Name', sum(salary) as 'Amount Spent'
    -> from salaries
    -> inner join dept_emp
    -> on salaries.emp_no = dept_emp.emp_no
    -> inner join departments
    -> on dept_emp.dept_no = departments.dept_no
    -> where departments.dept_name = 'Marketing'
    -> and (year(salaries.from_date) between '1990' and '1992'
    -> or year(salaries.to_date) between '1990' and '1992')
    -> group by dept_emp.dept_no;
+-----------------+--------------+
| Department Name | Amount Spent |
+-----------------+--------------+
| Marketing       |   2183459752 |
+-----------------+--------------+
1 row in set (0.16 sec)

mysql> 
