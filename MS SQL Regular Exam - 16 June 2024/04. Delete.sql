DELETE LibrariesBooks
FROM LibrariesBooks
JOIN Books ON Books.Id = LibrariesBooks.BookId
JOIN Authors ON Authors.Id = Books.AuthorId
WHERE Authors.Name = 'Alex Michaelides'


DELETE Books
FROM Books
JOIN Authors ON Authors.Id = Books.AuthorId
WHERE Authors.Name = 'Alex Michaelides'

DELETE Authors
WHERE Authors.Name = 'Alex Michaelides'