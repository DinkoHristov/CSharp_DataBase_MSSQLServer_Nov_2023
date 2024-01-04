SELECT [to].Name AS TownName, COUNT(p.Id)
	FROM Passengers AS p
	JOIN Tickets AS t ON p.Id = t.PassengerId
	JOIN Trains AS tr ON t.TrainId = tr.Id
	JOIN Towns AS [to] ON tr.ArrivalTownId = [to].Id
	WHERE t.Price > 76.99
	GROUP BY [to].Name
	ORDER BY [to].Name ASC