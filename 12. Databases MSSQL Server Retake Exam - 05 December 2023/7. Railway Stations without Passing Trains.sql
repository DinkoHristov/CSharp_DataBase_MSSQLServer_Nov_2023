SELECT tw.Name AS Town, rs.Name AS RailwayStation
	FROM RailwayStations AS rs
	LEFT JOIN TrainsRailwayStations AS trs ON rs.Id = trs.RailwayStationId
	LEFT JOIN Trains AS t ON trs.TrainId = t.Id
	LEFT JOIN Towns AS tw ON rs.TownId = tw.Id
	WHERE t.Id IS NULL
	ORDER BY tw.Name ASC,
	rs.Name ASC