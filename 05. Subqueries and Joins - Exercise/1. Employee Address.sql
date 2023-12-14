SELECT TOP(5) EmployeeID, JobTitle, a.AddressID, AddressText 
	FROM Employees AS e
	JOIN Addresses AS a ON e.AddressID = a.AddressID
	ORDER BY a.AddressID ASC