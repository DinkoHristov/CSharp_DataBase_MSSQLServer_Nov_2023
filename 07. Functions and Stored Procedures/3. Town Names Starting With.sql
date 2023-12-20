CREATE OR ALTER PROCEDURE usp_GetTownsStartingWith (@TownLetter VARCHAR(MAX))
AS
	SELECT [Name]
		FROM Towns
	WHERE [NAME] LIKE @TownLetter + '%'