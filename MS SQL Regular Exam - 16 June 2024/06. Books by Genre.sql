SELECT Books.Id, Books.Title, Books.ISBN, Genres.Name
FROM Books
JOIN Genres ON Genres.Id = Books.GenreId
WHERE Genres.Name IN('Biography', 'Historical Fiction')
ORDER BY Genres.Name ASC, Books.Title ASC