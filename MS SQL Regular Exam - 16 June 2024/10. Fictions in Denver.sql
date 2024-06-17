SELECT Authors.Name, Books.Title, Libraries.Name, Contacts.PostAddress AS 'Library Address'
FROM Books
JOIN Genres ON Books.GenreId = Genres.Id
JOIN LibrariesBooks ON Books.Id = LibrariesBooks.BookId
JOIN Libraries ON LibrariesBooks.LibraryId = Libraries.Id
JOIN Contacts ON Libraries.ContactId = Contacts.Id
JOIN Authors ON Books.AuthorId = Authors.Id
WHERE Genres.Name = 'Fiction' AND Contacts.PostAddress LIKE '%Denver%'
ORDER BY Books.Title ASC