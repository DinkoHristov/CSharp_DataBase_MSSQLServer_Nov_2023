CREATE OR ALTER FUNCTION ufn_CashInUsersGames(@GameName VARCHAR(MAX))
RETURNS @ReturnedTable TABLE (SumCash MONEY)
AS
BEGIN
	DECLARE @Result MONEY;

	SET @Result = (SELECT SUM(k.Cash) AS SumCash
		FROM (SELECT Cash, GameId, ROW_NUMBER() OVER (ORDER BY Cash DESC) AS RowNumber
				FROM UsersGames AS ug
				JOIN Games AS g ON g.Id = ug.GameId
				WHERE g.[Name] = @GameName
		) AS k
	WHERE k.RowNumber % 2 != 0
	)

	INSERT INTO @ReturnedTable VALUES (@Result)

	RETURN
END