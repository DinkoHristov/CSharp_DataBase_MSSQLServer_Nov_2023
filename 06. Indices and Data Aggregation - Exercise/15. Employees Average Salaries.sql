SELECT *
	INTO [TableOne]
	FROM Employees
	WHERE Salary > 30000

DELETE FROM TableOne
WHERE ManagerID = 42

UPDATE TableOne
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS [AverageSalary]
	FROM TableOne
	GROUP BY DepartmentID