SELECT TOP(3) Books.Title, Books.YearPublished, Genres.Name
FROM Libraries
JOIN LibrariesBooks ON Libraries.Id = LibrariesBooks.LibraryId
JOIN Books ON LibrariesBooks.BookId = Books.Id
JOIN Genres ON Books.GenreId = Genres.Id
WHERE (Books.YearPublished > 2000 AND Books.Title LIKE '%a%') OR
	  (Books.YearPublished < 1950 AND Genres.Name LIKE '%Fantasy%')
ORDER BY Books.Title ASC, Books.YearPublished DESC