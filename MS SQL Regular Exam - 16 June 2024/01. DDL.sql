CREATE TABLE Contacts
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Email NVARCHAR(100),
	PhoneNumber NVARCHAR(20),
	PostAddress NVARCHAR(200),
	Website NVARCHAR(50)
)

CREATE TABLE Authors
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(100) NOT NULL,
	ContactId INT NOT NULL REFERENCES Contacts(Id)
)

CREATE TABLE Libraries
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	ContactId INT NOT NULL REFERENCES Contacts(Id)
)

CREATE TABLE Genres
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(30) NOT NULL
)

CREATE TABLE Books
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Title NVARCHAR(100) NOT NULL,
	YearPublished INT NOT NULL,
	ISBN NVARCHAR(13) UNIQUE NOT NULL,
	AuthorId INT NOT NULL REFERENCES Authors(Id),
	GenreId INT NOT NULL REFERENCES Genres(Id)
)

CREATE TABLE LibrariesBooks
(
	LibraryId INT NOT NULL REFERENCES Libraries(Id),
	BookId INT NOT NULL REFERENCES Books(Id),
	CONSTRAINT PK_LibrariesBooks PRIMARY KEY(LibraryId, BookId)
)