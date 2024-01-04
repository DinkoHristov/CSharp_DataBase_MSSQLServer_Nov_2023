CREATE OR ALTER FUNCTION udf_TownsWithTrains(@name VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @departureCount INT = (SELECT COUNT(tr.DepartureTownId)
		FROM Towns AS t
		LEFT JOIN Trains AS tr ON t.Id = tr.DepartureTownId
		WHERE t.Name = @name
	);

	DECLARE @arrivalCount INT = (SELECT COUNT(tr.ArrivalTownId)
		FROM Towns AS t
		LEFT JOIN Trains AS tr ON t.Id = tr.ArrivalTownId
		WHERE t.Name = @name
	);

	RETURN @departureCount + @arrivalCount
END;