SELECT k.DepartmentID, k.TotalSalary
	FROM ( SELECT DepartmentID, SUM(Salary) AS [TotalSalary]
			FROM Employees
			GROUP BY DepartmentID
) AS k
ORDER BY k.DepartmentID ASC
