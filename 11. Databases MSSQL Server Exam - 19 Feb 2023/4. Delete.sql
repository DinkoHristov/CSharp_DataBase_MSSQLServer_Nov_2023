DELETE FROM CreatorsBoardgames
WHERE BoardgameId IN (SELECT b.Id
	FROM Boardgames AS b
	JOIN Publishers AS p ON p.Id = b.PublisherId
	JOIN Addresses AS a ON a.Id = p.AddressId
	WHERE Town LIKE 'L%'
)

DELETE FROM Boardgames
WHERE PublisherId IN (SELECT p.Id
	FROM Publishers AS p
	JOIN Addresses AS a ON a.Id = p.AddressId
	WHERE Town LIKE 'L%'
)

DELETE FROM Publishers
WHERE AddressId IN (SELECT Id
	FROM Addresses
	WHERE Town LIKE 'L%'
)

DELETE FROM Addresses
WHERE Town LIKE 'L%'