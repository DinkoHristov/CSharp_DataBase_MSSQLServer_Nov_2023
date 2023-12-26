CREATE TABLE Deleted_Employees
(
	EmployeeId INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	MiddleName NVARCHAR(50) NOT NULL,
	JobTitle NVARCHAR(50) NOT NULL,
	DepartmentId INT REFERENCES Departments(DepartmentID),
	Salary MONEY NOT NULL
)

CREATE OR ALTER TRIGGER tr_DeletedEmployees
ON Employees AFTER DELETE
AS
	INSERT INTO Deleted_Employees
	SELECT FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary
		FROM deleted
	

SELECT * FROM Employees WHERE EmployeeID = 1

SELECT * FROM Deleted_Employees