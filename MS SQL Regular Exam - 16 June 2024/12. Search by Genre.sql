CREATE PROCEDURE usp_SearchByGenre(@genreName VARCHAR(100))
AS
BEGIN
	SELECT Books.Title, Books.YearPublished, Books.ISBN, Authors.Name, Genres.Name
	FROM Authors
	JOIN Books ON Books.AuthorId = Authors.Id
	JOIN Genres ON Books.GenreId = Genres.Id
	WHERE Genres.Name = @genreName
	ORDER BY Books.Title ASC
END