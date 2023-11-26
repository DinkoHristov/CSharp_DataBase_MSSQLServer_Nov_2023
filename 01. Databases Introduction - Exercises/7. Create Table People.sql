CREATE TABLE People
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(200) NOT NULL,
	Picture VARCHAR(MAX),
	Height FLOAT,
	[Weight] FLOAT,
	Gender CHAR NOT NULL,
	Birthdate DATETIME NOT NULL,
	Biography VARCHAR(MAX)
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography) VALUES
('Claire', 'https://www.istockphoto.com/photos/landscapes', 12.387, 14.9888, 'm', '12/12/2012', 'My Bio'),
('Claire1', 'https://www.istockphoto.com/photos/landscapes', 13.387, 14.9888, 'f', '12/13/2012', 'My Bio1'),
('Claire2', 'https://www.istockphoto.com/photos/landscapes', 14.387, 14.9888, 'f', '12/14/2012', 'My Bio2'),
('Claire3', 'https://www.istockphoto.com/photos/landscapes', 15.387, 14.9888, 'm', '12/15/2012', 'My Bio3'),
('Clair4', 'https://www.istockphoto.com/photos/landscapes', 16.387, 14.9888, 'm', '12/16/2012', 'My Bio4')