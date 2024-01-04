SELECT TOP(3) t.Id AS TrainId, t.HourOfDeparture, ti.Price AS TicketPrice, [to].Name AS Destination
	FROM Trains AS t
	JOIN Tickets AS ti ON t.Id = ti.TrainId
	JOIN Towns AS [to] ON [to].Id = t.ArrivalTownId
	WHERE t.HourOfDeparture BETWEEN '08:00' AND '08:59'
	AND ti.Price > 50.00
	ORDER BY ti.Price ASC