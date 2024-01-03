CREATE OR ALTER PROCEDURE usp_SearchByCategory(@category VARCHAR(50))
AS
	SELECT b.Name, b.YearPublished, b.Rating, c.Name AS CategoryName, p.Name AS PublisherName, CONCAT(pr.PlayersMin, ' ', 'people') AS MinPlayers, CONCAT(pr.PlayersMax, ' ', 'people') AS MaxPlayers 
	FROM Boardgames AS b
	JOIN Categories AS c ON c.Id = b.CategoryId
	JOIN Publishers AS p ON p.Id = b.PublisherId
	JOIN PlayersRanges AS pr ON pr.Id = b.PlayersRangeId
	WHERE c.Name = @category
	ORDER BY PublisherName ASC,
	b.YearPublished DESC