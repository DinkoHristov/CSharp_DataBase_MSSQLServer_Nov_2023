DECLARE @MysteryGenreId INT;
SELECT @MysteryGenreId = Id
FROM Genres
WHERE Name = 'Mystery';

SELECT l.Name AS Library, c.Email
FROM Libraries l
INNER JOIN Contacts c ON l.ContactId = c.Id
WHERE l.Id NOT IN (
    SELECT lb.LibraryId
    FROM LibrariesBooks lb
    INNER JOIN Books b ON lb.BookId = b.Id
    WHERE b.GenreId = @MysteryGenreId
)
ORDER BY l.Name ASC;