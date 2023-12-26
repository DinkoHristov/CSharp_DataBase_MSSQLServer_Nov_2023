CREATE OR ALTER PROCEDURE usp_AssignProject (@employeeId INT, @projectId INT)
AS
	DECLARE @ProjectsCount INT = (SELECT COUNT(*)
								FROM EmployeesProjects
							GROUP BY EmployeeID
							HAVING EmployeeID = @employeeId) 
	IF (@ProjectsCount >= 3)
		THROW 50001, 'The employee has too many projects!', 1

	INSERT INTO EmployeesProjects (EmployeeID, ProjectID) VALUES
	(@employeeId, @projectId)
