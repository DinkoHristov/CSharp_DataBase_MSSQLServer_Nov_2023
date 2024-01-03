CREATE OR ALTER FUNCTION udf_CreatorWithBoardgames(@name VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @numberOfCreatedGames INT = (SELECT COUNT(cb.BoardgameId)
		FROM Creators AS c
		JOIN CreatorsBoardgames AS cb ON cb.CreatorId = c.Id
		WHERE c.FirstName = @name
	);

	RETURN @numberOfCreatedGames
END;