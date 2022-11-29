

-------------------------------------------------------------------Basic SQL--------------------------------------------------------------------------------


--Creating the Tables
CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
Lastname varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)

-- Inserting the Data in the tables

INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim','Halpert',30,'Male'),
(1002, 'Pam','Beasley',30,'Female'),
(1003, 'Dwight','Schrute',29,'Male'),
(1004, 'Angela','Martin',31,'Female'),
(1005, 'Toby','Flenderson',32,'Male'),
(1006, 'Michael','Scott',35,'Male'),
(1007, 'Meridith','Palmer',32,'Female'),
(1008, 'Stanley','Hudson',38,'Male'),
(1009, 'Kevin','Malone',31,'Male')


INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

--SELECT Statements: TOP, DISTINCT, AS, MAX, MIN, AVG

SELECT * 
FROM EmployeeDemographics


--Return top 5 of table

SELECT TOP 5 *
FROM EmployeeDemographics

--Return Unique Values only from a column
--DISTINCT: Unique Values in a particular column

SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics

--Return the number of the last name of the employee with Alias
SELECT COUNT(Lastname) AS LastNameCount
FROM EmployeeDemographics

--MAX 

SELECT MAX(Salary)
FROM EmployeeSalary

--MIN
SELECT MAX(Salary)
FROM EmployeeSalary

--AVG
SELECT AVG(Salary)
FROM EmployeeSalary

/*
WHERE Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

-- Equal to
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim';

--Not Equal to
SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim';

--Greater than
SELECT *
FROM EmployeeDemographics
WHERE Age > 30 ;

--Greater than and equal to
SELECT *
FROM EmployeeDemographics
WHERE Age >= 30 ;

--AND Statement
SELECT *
FROM EmployeeDemographics
WHERE Age >= 30 AND Gender = 'Male';

--OR Statement(One of tese criteria has to meet in order for it to be correct)
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male';

--LIKE Statement
--Last name Start with S(using te Wildcard"%")
SELECT*
FROM EmployeeDemographics
WHERE Lastname LIKE'S%';

--Last name that has S in it
SELECT*
FROM EmployeeDemographics
WHERE Lastname LIKE'%S%';

--Last name that has S at the beginning and O somewhere in it:
SELECT*
FROM EmployeeDemographics
WHERE Lastname LIKE'S%o%';

--NULL
SELECT*
FROM EmployeeDemographics
WHERE Lastname is NULL

--NOT NULL
SELECT*
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

--IN (allows you to specify a list of values that you'd like to include in the results.)

SELECT*
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

/*
Group by, Order by
*/

--GROUP BY
SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender

--ORDER BY(ASC and DESC)
SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY Gender DESC

SELECT * 
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC
--ORDER BY 4 DESC, 5 DESC



------------------------------------------------------------------------Intermidiate SQL ---------------------------------------------------------------------------------------------------------------------------------

--inner Joins, Full/left/Right Outer Joins

SELECT * FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics

SELECT * FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary


--Inner Join
SELECT * 
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--FULL OUTER JOIN
SELECT * 
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
FULL OUTER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Insert into EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly','Flax', NULL, 'Male'),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

--insert into EmployeeSalary VALUES
--(1010, NULL, 47000),
--(NULL, 'Salesman', 43000)

--LEFT OUTER JOIN
SELECT * 
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
LEFT OUTER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--RIGHT OUTER JOIN
SELECT * 
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
RIGHT OUTER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, Lastname, JobTitle, Salary
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeSalary.EmployeeID, FirstName, Lastname, JobTitle, Salary
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
RIGHT OUTER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, Lastname, JobTitle, Salary
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
RIGHT OUTER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, Lastname, JobTitle, Salary
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
LEFT OUTER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeSalary.EmployeeID, FirstName, Lastname, JobTitle, Salary
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
LEFT OUTER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Identify the Employee that makes most money after Mr.Scott
SELECT EmployeeDemographics.EmployeeID, FirstName,Lastname, Salary 
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName != 'Michael'
ORDER BY Salary DESC

--Calculate the Average Salary of all the Salesman

SELECT JobTitle, AVG(Salary) AS Average_Salary
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle


--Third Table Warehouse Employees:
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

--UNIONS
SELECT * 
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
UNION
SELECT *
FROM [SQL Tutorial_Alex_Freeberg].dbo.WareHouseEmployeeDemographics

--UNION ALL(Union removes the duplicates if it is in the table but UNION ALL shows the duplicates)
SELECT * 
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM [SQL Tutorial_Alex_Freeberg].dbo.WareHouseEmployeeDemographics
ORDER BY 1

-- Case Statements

SELECT FirstName, Lastname, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 29 THEN 'Young'
	ELSE 'Baby'
END
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

--Give Employees a raise based on their Performance review(Salesmen performed the best)

SELECT FirstName,Lastname,Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- HAVING Clause
--Display Job titles having more than 1 persons
SELECT JobTitle, COUNT(JobTitle)
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(Jobtitle) > 1

--Display Average salary more than 45000
SELECT JobTitle, AVG(Salary)
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER By AVG(Salary)

--Updating/Deleting Data
SELECT *
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics

--Update Holly Flax Employee ID:

UPDATE [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND Lastname = 'Flax'

--Update Holly Flax Age and Gender:
UPDATE [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
SET Age =31, Gender = 'Female'
WHERE FirstName = 'Holly' AND Lastname = 'Flax'

--Delete 

DELETE FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics
WHERE EmployeeID = 1005

--ALIASING

--Aliasing Column Name
SELECT FirstName + ' ' + LastName AS FullName
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics

--Aliasing Table Name

SELECT Demo.EmployeeID, Sal.Salary
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics AS Demo
INNER JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

-- Aliasing Three Tables Using Joins

SELECT Demo.EmployeeID, Demo.FirstName, Demo.Lastname
FROM [SQL Tutorial_Alex_Freeberg].dbo.EmployeeDemographics AS Demo
LEFT JOIN [SQL Tutorial_Alex_Freeberg].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQL Tutorial_Alex_Freeberg].dbo.WareHouseEmployeeDemographics AS Ware
	ON Demo.Age = Ware.EmployeeID

--Partition By
