//Consider following Relation 
Account(Acc_no, branch_name,balance)
Branch(branch_name,branch_city,assets)
Customer(cust_name,cust_street,cust_city)
Depositor(cust_name,acc_no)
Loan(loan_no,branch_name,amount)
Borrower(cust_name,loan_no)
Create above tables with appropriate constraints like primary key, foreign key, not null etc.


CREATE DATABASE BANK;
USE BANK;

CREATE TABLE ACCOUNT(Acc_no INT(20), Branch_name VARCHAR(20), Balance INT(30));
CREATE TABLE BRANCH(Branch_name VARCHAR(20), Branch_city VARCHAR(20), Balance INT(40));
CREATE TABLE CUSTOMER( Cust_name VARCHAR(30), Cust_city VARCHAR(30), Cust_street VARCHAR(40));
CREATE TABLE DEPOSITOR(Cust_name VARCHAR(30), Acc_no INT(20));
CREATE TABLE LOAN( Loan_no INT(20), Branch_name VARCHAR(20), Amount INT(30));
CREATE TABLE BORROWER(Cust_name VARCHAR(20), Loan_no INT(20));

ALTER TABLE ACCOUNT ADD PRIMARY KEY(Acc_no);
ALTER TABLE BRANCH ADD PRIMARY KEY(Branch_name);
ALTER TABLE CUSTOMER ADD PRIMARY KEY(Cust_name);

ALTER TABLE ACCOUNT ADD FOREIGN KEY(Branch_name) REFERENCES BRANCH(Branch_name);
ALTER TABLE DEPOSITOR ADD FOREIGN KEY(Cust_name) REFERENCES CUSTOMER(Cust_name);
ALTER TABLE DEPOSITOR ADD FOREIGN KEY(Acc_no) REFERENCES ACCOUNT(Acc_no);

ALTER TABLE LOAN ADD PRIMARY KEY(Loan_no);
ALTER TABLE LOAN ADD FOREIGN KEY(Branch_name) REFERENCES BRANCH(Branch_name);

ALTER TABLE BORROWER ADD FOREIGN KEY(Cust_name) REFERENCES CUSTOMER(Cust_name);
ALTER TABLE BORROWER ADD FOREIGN KEY(Loan_no) REFERENCES LOAN(Loan_no);

-------INSERTING VALUES
USE BANK;
INSERT INTO BRANCH VALUES('WADIA', 'PUNE', 500000);
INSERT INTO BRANCH VALUES('PASHAN', 'PUNE', 1000000);
INSERT INTO BRANCH VALUES('VIMAN NAGAR', 'PUNE', 5000000);
INSERT INTO BRANCH VALUES('MALAD WEST', 'MUMBAI', 670000);
INSERT INTO BRANCH VALUES('CHURCHGATE', 'MUMBAI', 900000);
INSERT INTO BRANCH VALUES('ANDHERI', 'MUMBAI', 8500000);
INSERT INTO BRANCH VALUES('PANJIM', 'GOA', 200000);
INSERT INTO BRANCH VALUES('IP ESTATE', 'DELHI', 1500000);
INSERT INTO BRANCH VALUES('NEHRU PALACE', 'DELHI', 600000);
INSERT INTO BRANCH VALUES('KARWAR', 'BANGLORE', 34000000);

//INSERTING TO ACCOUNT

INSERT INTO ACCOUNT VALUES(1123, 'WADIA', 12000);
INSERT INTO ACCOUNT VALUES(1168, 'PASHAN', 35000);
INSERT INTO ACCOUNT VALUES(1195, 'VIMAN NAGAR', 500000);
INSERT INTO ACCOUNT VALUES(1211, 'MALAD WEST', 45000);
INSERT INTO ACCOUNT VALUES(1416, 'CHURCHGATE', 70000);
INSERT INTO ACCOUNT VALUES(1354, 'ANDHERI', 65000);
INSERT INTO ACCOUNT VALUES(1602, 'IP ESTATE', 200000);
INSERT INTO ACCOUNT VALUES(1877, 'NEHRU PALACE', 5000);
INSERT INTO ACCOUNT VALUES(1738, 'PANJIM', 90000);
INSERT INTO ACCOUNT VALUES(1989, 'KARWAR', 15000);


-----INSERTING INTO CUSTOMER
INSERT INTO CUSTOMER VALUES('SANIA', 'PUNE', 'BT KAWADE RD');
INSERT INTO CUSTOMER VALUES('MITALI', 'PUNE', 'SWARGATE');
INSERT INTO CUSTOMER VALUES('RESHMA', 'PUNE', 'FC ROAD');
INSERT INTO CUSTOMER VALUES('SHRUTI', 'MUMBAI', 'MARINE DRIVE');
INSERT INTO CUSTOMER VALUES('KOMAL', 'MUMBAI', 'HILL RD');
INSERT INTO CUSTOMER VALUES('AZHAR', 'MUMBAI', 'COLABA');
INSERT INTO CUSTOMER VALUES('KSHIPRA', 'DELHI', 'SAROJINI');
INSERT INTO CUSTOMER VALUES('ANSHUL', 'DELHI', 'CHANDNI CHOWK');
INSERT INTO CUSTOMER VALUES('NEHA', 'GOA', 'BAGA RD');
INSERT INTO CUSTOMER VALUES('RIDHI', 'BANGLORE', 'AVENUE RD')	;

//INSERTING INTO DEPOSITOR
INSERT INTO DEPOSITOR VALUES('SANIA', 1123);
INSERT INTO DEPOSITOR VALUES('MITALI', 1168);
INSERT INTO DEPOSITOR VALUES('RESHMA', 1195);
INSERT INTO DEPOSITOR VALUES('SHRUTI', 1211);
INSERT INTO DEPOSITOR VALUES('KOMAL', 1416);
INSERT INTO DEPOSITOR VALUES('AZHAR', 1354);
INSERT INTO DEPOSITOR VALUES('KSHIPRA', 1602);
INSERT INTO DEPOSITOR VALUES('ANSHUL', 1877);
INSERT INTO DEPOSITOR VALUES('NEHA', 1738);
INSERT INTO DEPOSITOR VALUES('RIDHI', 1989);

----INSERTING INTO LOAN
INSERT INTO LOAN VALUES(21176, 'WADIA', 150000);
INSERT INTO LOAN VALUES(35421, 'PASHAN', 250000);
INSERT INTO LOAN VALUES(78116, 'VIMAN NAGAR', 20000);
INSERT INTO LOAN VALUES(67234, 'MALAD WEST', 800000);
INSERT INTO LOAN VALUES(54788, 'CHURCHGATE', 450000);
INSERT INTO LOAN VALUES(37419, 'IP ESTATE', 30000);
INSERT INTO LOAN VALUES(64225, 'NEHRU PALACE', 70000);
INSERT INTO LOAN VALUES(56743, 'ANDHERI', 340000);
INSERT INTO LOAN VALUES(96782, 'PANJIM', 270000);
INSERT INTO LOAN VALUES(45249, 'KARWAR', 10000);


---INSERTING INTO BORROWER
INSERT INTO BORROWER VALUES('SANIA', 21176);
INSERT INTO BORROWER VALUES('MITALI', 35421);
INSERT INTO BORROWER VALUES('RESHMA', 78116);
INSERT INTO BORROWER VALUES('SHRUTI', 67234);
INSERT INTO BORROWER VALUES('KOMAL', 54788);
INSERT INTO BORROWER VALUES('AZHAR', 37419);
INSERT INTO BORROWER VALUES('KSHIPRA', 64225);
INSERT INTO BORROWER VALUES('ANSHUL', 56743);
INSERT INTO BORROWER VALUES('NEHA', 96782);
INSERT INTO BORROWER VALUES('RIDHI', 45249);

---IMPLEMENTING QUERIES

----1)Find the names of all branches in loan relation.
mysql> SELECT DISTINCT Branch_name FROM LOAN;
+--------------+
| Branch_name  |
+--------------+
| ANDHERI      |
| CHURCHGATE   |
| IP ESTATE    |
| KARWAR       |
| MALAD WEST   |
| NEHRU PALACE |
| PANJIM       |
| PASHAN       |
| VIMAN NAGAR  |
| WADIA        |
+--------------+

___________________________________________________________________________________________________________________________________________________________

----2)Find all loan numbers for loans made at "Wadia College" Branch with loan amount > 12000.
mysql> SELECT Loan_no FROM LOAN WHERE Branch_name="WADIA" AND Amount>12000;
+---------+
| Loan_no |
+---------+
|   21176 |
+---------+
___________________________________________________________________________________________________________________________________________________________

-----3)Find all customers who have a loan from bank. Find their names,loan_no and loan amount.
mysql> SELECT B.Cust_name , L.Loan_no ,L.Amount FROM LOAN L INNER JOIN BORROWER B ON L.Loan_no=B.Loan_no;
+-----------+---------+--------+
| Cust_name | Loan_no | Amount |
+-----------+---------+--------+
| SANIA     |   21176 | 150000 |
| MITALI    |   35421 | 250000 |
| AZHAR     |   37419 |  30000 |
| RIDHI     |   45249 |  10000 |
| KOMAL     |   54788 | 450000 |
| ANSHUL    |   56743 | 340000 |
| KSHIPRA   |   64225 |  70000 |
| SHRUTI    |   67234 | 800000 |
| RESHMA    |   78116 |  20000 |
| NEHA      |   96782 | 270000 |
+-----------+---------+--------+
___________________________________________________________________________________________________________________________________________________________

-----4)List all customers in alphabetical order who have loan from "Wadia College" branch.
mysql> SELECT B.Cust_name FROM LOAN L INNER JOIN BORROWER B ON L.Loan_no=B.Loan_no ORDER BY B.Cust_name ASC;
+-----------+
| Cust_name |
+-----------+
| ANSHUL    |
| AZHAR     |
| KOMAL     |
| KSHIPRA   |
| MITALI    |
| NEHA      |
| RESHMA    |
| RIDHI     |
| SANIA     |
| SHRUTI    |
+-----------+
___________________________________________________________________________________________________________________________________________________________

----5)Display distinct cities of branch.
mysql> SELECT DISTINCT Branch_city FROM BRANCH;
+-------------+
| Branch_city |
+-------------+
| MUMBAI      |
| DELHI       |
| BANGLORE    |
| GOA         |
| PUNE        |
+-------------+
___________________________________________________________________________________________________________________________________________________________

---6)Find all customers who have both account and loan at bank.
mysql> SELECT DISTINCT C.Cust_name
FROM CUSTOMER C 
INNER JOIN DEPOSITOR D ON C.Cust_name=D.Cust_name 
INNER JOIN BORROWER B ON C.Cust_name=B.Cust_name;
+-----------+
| Cust_name |
+-----------+
| ANSHUL    |
| AZHAR     |
| KOMAL     |
| KSHIPRA   |
| MITALI    |
| NEHA      |
| RESHMA    |
| RIDHI     |
| SANIA     |
| SHRUTI    |
+-----------+
___________________________________________________________________________________________________________________________________________________________

----7)Find all customers who have an account or loan or both at bank
mysql>  SELECT DISTINCT C.Cust_name 
FROM CUSTOMER C 
LEFT JOIN DEPOSITOR D ON C.Cust_name=D.Cust_name 
LEFT JOIN BORROWER B ON C.Cust_name=B.Cust_name 
WHERE D.Cust_name IS NOT NULL OR B.Cust_name IS NOT NULL;
+-----------+
| Cust_name |
+-----------+
| ANSHUL    |
| AZHAR     |
| KOMAL     |
| KSHIPRA   |
| MITALI    |
| NEHA      |
| RESHMA    |
| RIDHI     |
| SANIA     |
| SHRUTI    |
+-----------+
___________________________________________________________________________________________________________________________________________________________

----8) Find all customers who have account but no loan at the bank.
mysql> SELECT DISTINCT C.Cust_name FROM CUSTOMER C LEFT JOIN BORROWER B ON C.Cust_name=B.Cust_name WHERE B.Cust_name IS NULL;
Empty set (0.00 sec)
___________________________________________________________________________________________________________________________________________________________

----9)Find average account balance at "Wadia College" branch.
mysql> SELECT Branch_name, AVG(Balance) FROM ACCOUNT WHERE Branch_name="WADIA";
+-------------+--------------+
| Branch_name | AVG(Balance) |
+-------------+--------------+
| WADIA       |   12000.0000 |
+-------------+--------------+
___________________________________________________________________________________________________________________________________________________________

----10) Find no. of depositors at each branch
mysql> SELECT A.Branch_name, COUNT(DISTINCT D.Cust_name) 
FROM ACCOUNT A 
LEFT JOIN DEPOSITOR D ON A.Acc_no=D.Acc_no 
GROUP BY A.Branch_name;
+--------------+-----------------------------+
| Branch_name  | COUNT(DISTINCT D.Cust_name) |
+--------------+-----------------------------+
| ANDHERI      |                           1 |
| CHURCHGATE   |                           1 |
| IP ESTATE    |                           1 |
| KARWAR       |                           1 |
| MALAD WEST   |                           1 |
| NEHRU PALACE |                           1 |
| PANJIM       |                           1 |
| PASHAN       |                           1 |
| VIMAN NAGAR  |                           1 |
| WADIA        |                           1 |
+--------------+-----------------------------+
___________________________________________________________________________________________________________________________________________________________

----11)Find the branches where average account balance > 15000.

mysql> SELECT Branch_name FROM ACCOUNT GROUP BY Branch_name HAVING AVG(Balance)>15000;
+-------------+
| Branch_name |
+-------------+
| ANDHERI     |
| CHURCHGATE  |
| IP ESTATE   |
| MALAD WEST  |
| PANJIM      |
| PASHAN      |
| VIMAN NAGAR |
+-------------+
___________________________________________________________________________________________________________________________________________________________

----12)Find number of tuples in customer relation.
mysql> SELECT* FROM CUSTOMER;
+-----------+-----------+---------------+
| Cust_name | Cust_city | Cust_street   |
+-----------+-----------+---------------+
| ANSHUL    | DELHI     | CHANDNI CHOWK |
| AZHAR     | MUMBAI    | COLABA        |
| KOMAL     | MUMBAI    | HILL RD       |
| KSHIPRA   | DELHI     | SAROJINI      |
| MITALI    | PUNE      | SWARGATE      |
| NEHA      | GOA       | BAGA RD       |
| RESHMA    | PUNE      | FC ROAD       |
| RIDHI     | BANGLORE  | AVENUE RD     |
| SANIA     | PUNE      | BT KAWADE RD  |
| SHRUTI    | MUMBAI    | MARINE DRIVE  |
+-----------+-----------+---------------+

___________________________________________________________________________________________________________________________________________________________

----13)Calculate total loan amount given by bank.
mysql> SELECT SUM(Amount) FROM LOAN;
+-------------+
| SUM(Amount) |
+-------------+
|     2390000 |
+-------------+
___________________________________________________________________________________________________________________________________________________________

----14)Delete all loans with loan amount between 1300 and 1500.
mysql> DELETE FROM LOAN WHERE Amount BETWEEN 1300 AND 1500;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT* FROM LOAN;
+---------+--------------+--------+
| Loan_no | Branch_name  | Amount |
+---------+--------------+--------+
|   21176 | WADIA        | 150000 |
|   35421 | PASHAN       | 250000 |
|   37419 | IP ESTATE    |  30000 |
|   45249 | KARWAR       |  10000 |
|   54788 | CHURCHGATE   | 450000 |
|   56743 | ANDHERI      | 340000 |
|   64225 | NEHRU PALACE |  70000 |
|   67234 | MALAD WEST   | 800000 |
|   78116 | VIMAN NAGAR  |  20000 |
|   96782 | PANJIM       | 270000 |
+---------+--------------+--------+

___________________________________________________________________________________________________________________________________________________________

-----15)Find the average account balance at each branch
mysql> SELECT Branch_name, AVG(Balance) FROM ACCOUNT GROUP BY Branch_name;
+--------------+--------------+
| Branch_name  | AVG(Balance) |
+--------------+--------------+
| ANDHERI      |   65000.0000 |
| CHURCHGATE   |   70000.0000 |
| IP ESTATE    |  200000.0000 |
| KARWAR       |   15000.0000 |
| MALAD WEST   |   45000.0000 |
| NEHRU PALACE |    5000.0000 |
| PANJIM       |   90000.0000 |
| PASHAN       |   35000.0000 |
| VIMAN NAGAR  |  500000.0000 |
| WADIA        |   12000.0000 |
+--------------+--------------+
___________________________________________________________________________________________________________________________________________________________

-----16)Find name of Customer and city where customer name starts with Letter P.
mysql> SELECT Cust_name, Cust_city FROM CUSTOMER WHERE Cust_name LIKE 'P%';
Empty set (0.00 sec)

mysql> SELECT Cust_name, Cust_city FROM CUSTOMER WHERE Cust_name LIKE 'S%';
+-----------+-----------+
| Cust_name | Cust_city |
+-----------+-----------+
| SANIA     | PUNE      |
| SHRUTI    | MUMBAI    |
+-----------+-----------+

mysql> SELECT Cust_name, Cust_city FROM CUSTOMER WHERE Cust_name LIKE 'A%';
+-----------+-----------+
| Cust_name | Cust_city |
+-----------+-----------+
| ANSHUL    | DELHI     |
| AZHAR     | MUMBAI    |
+-----------+-----------+

mysql> SELECT Cust_name, Cust_city FROM CUSTOMER WHERE Cust_name LIKE 'K%';
+-----------+-----------+
| Cust_name | Cust_city |
+-----------+-----------+
| KOMAL     | MUMBAI    |
| KSHIPRA   | DELHI     |
+-----------+-----------+

mysql> SELECT Cust_name, Cust_city FROM CUSTOMER WHERE Cust_name LIKE 'R%';
+-----------+-----------+
| Cust_name | Cust_city |
+-----------+-----------+
| RESHMA    | PUNE      |
| RIDHI     | BANGLORE  |
+-----------+-----------+

mysql> SELECT Cust_name, Cust_city FROM CUSTOMER WHERE Cust_name LIKE 'M%';
+-----------+-----------+
| Cust_name | Cust_city |
+-----------+-----------+
| MITALI    | PUNE      |
+-----------+-----------+

mysql> SELECT Cust_name, Cust_city FROM CUSTOMER WHERE Cust_name LIKE 'N%';
+-----------+-----------+
| Cust_name | Cust_city |
+-----------+-----------+
| NEHA      | GOA       |
+-----------+-----------+
___________________________________________________________________________________________________________________________________________________________
----VIEWS

---1)Create a View2 to display List all customers in alphabetical order who have loan from Pune_Station branch.
mysql> CREATE VIEW VIEW2 AS SELECT Cust_name 
FROM BORROWER 
INNER JOIN LOAN ON LOAN.Loan_no=BORROWER.Loan_no
WHERE Branch_name="PASHAN" ORDER BY Cust_name ASC;
Query OK, 0 rows affected (0.04 sec)

mysql> DESCRIBE VIEW2;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Cust_name | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

mysql> SELECT* FROM VIEW2;
+-----------+
| Cust_name |
+-----------+
| MITALI    |
+-----------+
___________________________________________________________________________________________________________________________________________________________

---2)Create View3 on branch table by selecting any two columns and perform insert update delete operations.
mysql> CREATE VIEW VIEW3 AS SELECT Branch_name, Branch_city FROM BRANCH;
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO VIEW3 VALUES("DP ROAD", "PUNE");
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO VIEW3 VALUES("BT KAWADE", "PUNE");
Query OK, 1 row affected (0.04 sec)

mysql> DELETE FROM VIEW3 WHERE Branch_name="DP ROAD";
Query OK, 1 row affected (0.01 sec)

mysql> SELECT* FROM VIEW3;
+--------------+-------------+
| Branch_name  | Branch_city |
+--------------+-------------+
| ANDHERI      | MUMBAI      |
| BT KAWADE    | PUNE        |
| CHURCHGATE   | MUMBAI      |
| IP ESTATE    | DELHI       |
| KARWAR       | BANGLORE    |
| MALAD WEST   | MUMBAI      |
| NEHRU PALACE | DELHI       |
| PANJIM       | GOA         |
| PASHAN       | PUNE        |
| VIMAN NAGAR  | PUNE        |
| WADIA        | PUNE        |
+--------------+-------------+
___________________________________________________________________________________________________________________________________________________________

---3) Create View4 on borrower and depositor table by selecting any one column from each table perform insert update delete 
operations.
mysql> CREATE VIEW VIEW4 AS SELECT B.Loan_no , D.Acc_no FROM BORROWER B, DEPOSITOR D;
Query OK, 0 rows affected (0.05 sec)

mysql> DESCRIBE VIEW4;
+---------+------+------+-----+---------+-------+
| Field   | Type | Null | Key | Default | Extra |
+---------+------+------+-----+---------+-------+
| Loan_no | int  | YES  |     | NULL    |       |
| Acc_no  | int  | YES  |     | NULL    |       |
+---------+------+------+-----+---------+-------+
___________________________________________________________________________________________________________________________________________________________

---4)Create Union of left and right joint for all customers who have an account or loan or both at bank
mysql> SELECT C.Cust_name FROM CUSTOMER C LEFT JOIN DEPOSITOR D ON C.Cust_name=D.Cust_name UNION SELECT C.Cust_name FROM CUSTOMER C RIGHT JOIN BORROWER B ON C.Cust_name=B.Cust_name;
+-----------+
| Cust_name |
+-----------+
| ANSHUL    |
| AZHAR     |
| KOMAL     |
| KSHIPRA   |
| MITALI    |
| NEHA      |
| RESHMA    |
| RIDHI     |
| SANIA     |
| SHRUTI    |
+-----------+
___________________________________________________________________________________________________________________________________________________________

---5)Create Simple and Unique index.
mysql> CREATE INDEX AccIdx ON ACCOUNT(Acc_no);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE UNIQUE INDEX UnLoIdx ON LOAN(Loan_no);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0
___________________________________________________________________________________________________________________________________________________________

---6)Display index Information.

mysql> SHOW INDEXES FROM ACCOUNT;
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| account |          0 | PRIMARY     |            1 | Acc_no      | A         |           8 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| account |          1 | Branch_name |            1 | Branch_name | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| account |          1 | AccIdx      |            1 | Acc_no      | A         |           8 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

mysql> SHOW INDEXES FROM LOAN;
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| loan  |          0 | PRIMARY     |            1 | Loan_no     | A         |           8 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| loan  |          0 | UnLoIdx     |            1 | Loan_no     | A         |           8 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| loan  |          1 | Branch_name |            1 | Branch_name | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

