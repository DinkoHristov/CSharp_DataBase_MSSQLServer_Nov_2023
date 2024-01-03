SELECT CONCAT(c.FirstName, ' ', c.Lastname) AS FullName, c.Email, MAX(b.Rating)
	FROM Creators AS c
	JOIN CreatorsBoardgames AS cbg ON cbg.CreatorId = c.Id
	JOIN Boardgames AS b ON cbg.BoardgameId = b.Id
	GROUP BY c.FirstName, c.Lastname, c.Email
	HAVING SUBSTRING(c.Email, CHARINDEX('.', c.Email), LEN(c.Email)) = '.com'
	ORDER BY FullName ASC