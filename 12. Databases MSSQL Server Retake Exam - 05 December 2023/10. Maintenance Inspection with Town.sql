SELECT t.Id AS TrainId, [to].Name AS DepartureTown, mr.Details
	FROM MaintenanceRecords AS mr
	JOIN Trains AS t ON mr.TrainId = t.Id
	JOIN Towns AS [to] ON t.DepartureTownId = [to].Id
	WHERE mr.Details LIKE '%inspection%'
	ORDER BY t.Id ASC