SELECT k.DepartmentID, k.Salary AS [ThirdHighestSalary]
	FROM ( SELECT DepartmentID, Salary,
			DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Ranked
			FROM Employees
			GROUP BY DepartmentID, Salary
) AS k
WHERE k.Ranked = 3