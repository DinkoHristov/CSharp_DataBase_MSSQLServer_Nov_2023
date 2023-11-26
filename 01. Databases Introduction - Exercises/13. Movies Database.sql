CREATE TABLE Directors
(
	Id INT PRIMARY KEY,
	DirectorName VARCHAR(30) NOT NULL,
	Notes VARCHAR(255)
)

CREATE TABLE Genres
(
	Id INT PRIMARY KEY,
	GenreName VARCHAR(50) NOT NULL,
	Notes VARCHAR(255)
)

CREATE TABLE Categories
(
	Id INT PRIMARY KEY,
	CategoryName VARCHAR(50) NOT NULL,
	Notes VARCHAR(255)
)

CREATE TABLE Movies
(
	Id INT PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	CopyrightYear INT NOT NULL,
	Length INT NOT NULL,
	Rating INT NOT NULL,
	Notes VARCHAR(255)
)

ALTER TABLE Movies
ADD DirectorId INT

ALTER TABLE Movies
ADD FOREIGN KEY (DirectorId) REFERENCES Directors(Id)

ALTER TABLE Movies
ADD GenreId INT

ALTER TABLE Movies
ADD FOREIGN KEY (GenreId) REFERENCES Genres(Id)

ALTER TABLE Movies
ADD CategoryId INT

ALTER TABLE Movies
ADD FOREIGN KEY (CategoryId) REFERENCES Categories(Id)

INSERT INTO Directors (Id, DirectorName, Notes) VALUES
(1, 'director', 'note1'),
(2, 'director1', 'note2'),
(3, 'director2', 'note3'),
(4, 'director3', 'note4'),
(5, 'director4', 'note5')

INSERT INTO Genres (Id, GenreName, Notes) VALUES
(1, 'genre1', 'note1'),
(2, 'genre2', 'note2'),
(3, 'genre3', 'note3'),
(4, 'genre4', 'note4'),
(5, 'genre5', 'note5')

INSERT INTO Categories (Id, CategoryName, Notes) VALUES
(1, 'category1', 'note1'),
(2, 'category2', 'note2'),
(3, 'category3', 'note3'),
(4, 'category4', 'note4'),
(5, 'category5', 'note5')

INSERT INTO Movies (Id, Title, CopyrightYear, Length, Rating, Notes, DirectorId, GenreId, CategoryId) VALUES
(1, 'title', 100, 10, 10, 'note', 5, 5, 5),
(2, 'title1', 200, 20, 11, 'note1', 4, 4, 4),
(3, 'title2', 300, 30, 12, 'note2', 3, 3, 3),
(4, 'title3', 400, 40, 13, 'note3', 2, 2, 2),
(5, 'title4', 500, 50, 14, 'note4', 1, 1, 1)