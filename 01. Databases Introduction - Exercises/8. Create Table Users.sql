CREATE TABLE Users
(
	Id BIGINT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARCHAR(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT
)

INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted) VALUES
('john', 'john123', 'https://www.istockphoto.com/photos/landscapes', '11/21/2023', 1),
('john1', 'john1234', 'https://www.istockphoto.com/photos/landscapes', '1/22/2023', 0),
('john2', 'john12345', 'https://www.istockphoto.com/photos/landscapes', '11/23/2023', 0),
('john3', 'john123456', 'https://www.istockphoto.com/photos/landscapes', '11/24/2023', 1),
('john4', 'john1234567', 'https://www.istockphoto.com/photos/landscapes', '11/25/2023', 1)
