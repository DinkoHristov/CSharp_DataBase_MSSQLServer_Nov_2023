CREATE FUNCTION udf_AuthorsWithBooks(@name VARCHAR(100))
RETURNS INT
AS
BEGIN
	DECLARE @Count INT = (SELECT COUNT(Books.Id)
	FROM Authors
	JOIN Books ON Authors.Id = Books.AuthorId
	WHERE Authors.Name = @name)

	RETURN @Count;
END