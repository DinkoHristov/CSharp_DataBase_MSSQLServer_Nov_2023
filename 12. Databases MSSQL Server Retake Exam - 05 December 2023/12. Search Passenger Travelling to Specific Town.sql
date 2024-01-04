CREATE OR ALTER PROCEDURE usp_SearchByTown(@townName VARCHAR(50))
AS
	SELECT p.Name AS PassengerName, t.DateOfDeparture, tr.HourOfDeparture
		FROM Passengers AS p
		JOIN Tickets AS t ON p.Id = t.PassengerId
		JOIN Trains AS tR ON t.TrainId = tr.Id
		JOIN Towns AS [to] ON tr.ArrivalTownId = [to].Id
		WHERE [to].Name = @townName
		ORDER BY t.DateOfDeparture DESC,
		p.Name ASC