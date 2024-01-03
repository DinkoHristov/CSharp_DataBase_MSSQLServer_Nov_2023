SELECT c.Lastname, CEILING(AVG(b.Rating)) AS AverageRating, p.Name AS PublisherName
	FROM Creators AS c
	JOIN CreatorsBoardgames AS cbg ON cbg.CreatorId = c.Id
	JOIN Boardgames AS b ON cbg.BoardgameId = b.Id
	JOIN Publishers AS p ON p.Id = b.PublisherId
	GROUP BY c.Lastname, p.Name
	HAVING p.Name = 'Stonemaier Games'
	ORDER BY AVG(b.Rating) DESC