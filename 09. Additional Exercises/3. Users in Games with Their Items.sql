SELECT u.Username AS Username, g.Name AS Game, COUNT(i.Id) AS ItemsCount, SUM(i.Price) AS Cash
	FROM Games AS g
	JOIN UsersGames AS ug ON ug.GameId = g.Id
	JOIN Users AS u ON u.Id = ug.UserId
	JOIN UserGameItems AS ugt ON ugt.UserGameId = ug.Id
	JOIN Items AS i ON i.Id = ugt.ItemId
	GROUP BY u.Username, g.Name
	HAVING COUNT(i.Id) >= 10
ORDER BY ItemsCount DESC, Cash DESC, u.Username