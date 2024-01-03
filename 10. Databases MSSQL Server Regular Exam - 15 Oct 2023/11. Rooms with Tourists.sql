CREATE OR ALTER FUNCTION udf_RoomsWithTourists(@name VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @adultsCount INT = (SELECT SUM(b.AdultsCount)
		FROM Tourists AS t
		JOIN Bookings AS b ON t.Id = b.TouristId
		JOIN Rooms AS r ON r.Id = b.RoomId
		WHERE r.Type = @name
	);

	DECLARE @childrensCount INT = (SELECT SUM(b.ChildrenCount)
		FROM Tourists AS t
		JOIN Bookings AS b ON t.Id = b.TouristId
		JOIN Rooms AS r ON r.Id = b.RoomId
		WHERE r.Type = @name
	);

	RETURN @adultsCount + @childrensCount;
END;