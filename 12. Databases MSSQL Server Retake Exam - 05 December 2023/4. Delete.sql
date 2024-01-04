DELETE TrainsRailwayStations
WHERE TrainId IN (SELECT t.Id
	FROM Trains AS t
	JOIN Towns AS tw ON tw.Id = t.DepartureTownId
	WHERE tw.Name = 'Berlin'
)

DELETE Tickets
WHERE TrainId IN (SELECT t.Id
	FROM Trains AS t
	JOIN Towns AS tw ON tw.Id = t.DepartureTownId
	WHERE tw.Name = 'Berlin'
)

DELETE MaintenanceRecords
WHERE TrainId IN (SELECT t.Id
	FROM Trains AS t
	JOIN Towns AS tw ON tw.Id = t.DepartureTownId
	WHERE tw.Name = 'Berlin'
)

DELETE t
	FROM Trains AS t
	JOIN Towns AS tw ON tw.Id = t.DepartureTownId
	WHERE tw.Name = 'Berlin' 