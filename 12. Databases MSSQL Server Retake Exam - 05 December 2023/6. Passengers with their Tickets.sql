SELECT p.Name AS PassengerName, t.Price AS TicketPrice, t.DateOfDeparture, tr.Id AS TrainId
	FROM Tickets AS t
	JOIN Passengers AS p ON t.PassengerId = p.Id
	JOIN Trains AS tr ON tr.Id = t.TrainId
	ORDER BY t.Price DESC,
	p.Name ASC