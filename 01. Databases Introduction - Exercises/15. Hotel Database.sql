--•	Employees (Id, FirstName, LastName, Title, Notes)
CREATE TABLE Employees
(
	Id INT PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Notes VARCHAR(255) NOT NULL
)

--•	Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
CREATE TABLE Customers
(
	AccountNumber INT PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(255) NOT NULL,
	EmergencyName VARCHAR(255) NOT NULL,
	EmergencyNumber VARCHAR(255) NOT NULL,
	Notes VARCHAR(255) NOT NULL
)

--•	RoomStatus (RoomStatus, Notes)
CREATE TABLE RoomStatus
(
	RoomStatus VARCHAR(255) PRIMARY KEY,
	Notes VARCHAR(255) NOT NULL
)

--•	RoomTypes (RoomType, Notes)
CREATE TABLE RoomTypes
(
	RoomType VARCHAR(255) PRIMARY KEY,
	Notes VARCHAR(255) NOT NULL
)

--•	BedTypes (BedType, Notes)
CREATE TABLE BedTypes
(
	BedType VARCHAR(255) PRIMARY KEY,	
	Notes VARCHAR(255) NOT NULL
)

--•	Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY,
	RoomType VARCHAR(255),
	BedType VARCHAR(255),
	Rate VARCHAR(255) NOT NULL,	
	RoomStatus VARCHAR(255) NOT NULL,	
	Notes VARCHAR(255) NOT NULL
)

ALTER TABLE Rooms
ADD FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType)

ALTER TABLE Rooms
ADD FOREIGN KEY (BedType) REFERENCES BedTypes(BedType)

ALTER TABLE Rooms
ADD FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(RoomStatus)

--•	Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
CREATE TABLE Payments
(
	Id INT PRIMARY KEY,
	EmployeeId INT,
	PaymentDate DATETIME NOT NULL,
	AccountNumber INT,
	FirstDateOccupied DATETIME NOT NULL,
	LastDateOccupied DATETIME NOT NULL,
	TotalDays INT NOT NULL,
	AmountCharged INT NOT NULL,
	TaxRate INT NOT NULL,
	TaxAmount INT NOT NULL,
	PaymentTotal INT NOT NULL,
	Notes VARCHAR(255)
)

ALTER TABLE Payments
ADD FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE Payments
ADD FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber)

--•	Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
CREATE TABLE Occupancies
(
	Id INT PRIMARY KEY,
	EmployeeId INT,
	DateOccupied DATETIME NOT NULL,
	AccountNumber INT,
	RoomNumber INT,
	RateApplied INT NOT NULL,
	PhoneCharge INT NOT NULL,
	Notes VARCHAR(255) NOT NULL
)

ALTER TABLE Occupancies
ADD FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE Occupancies
ADD FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber)

ALTER TABLE Occupancies
ADD FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber)

INSERT INTO Employees (Id, FirstName, LastName, Title, Notes) VALUES
(1, '1', '1', '1', '1'),
(2, '2', '2', '2', '2'),
(3, '3', '3', '3', '3')

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) VALUES
(1, '1', '1', '1', '1', '1', '1'),
(2, '2', '2', '2', '2', '2', '2'),
(3, '3', '3', '3', '3', '3', '3')

INSERT INTO RoomStatus (RoomStatus, Notes) VALUES
(1, '1'),
(2, '2'),
(3, '3')

INSERT INTO RoomTypes (RoomType, Notes) VALUES
(1, '1'),
(2, '2'),
(3, '3')

INSERT INTO BedTypes (BedType, Notes) VALUES
(1, '1'),
(2, '2'),
(3, '3')

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes) VALUES
(1, 1, 1, 1, 1, '1'),
(2, 2, 2, 2, 2, '2'),
(3, 3, 3, 3, 3, '3')

INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes) VALUES
(1, 1, '12/12/2012', 1, '12/12/2012', '12/12/2012', 1, 1, 1, 1, 1, '1'),
(2, 2, '12/12/2012', 2, '12/12/2012', '12/12/2012', 2, 2, 2, 2, 2, '2'),
(3, 3, '12/12/2012', 3, '12/12/2012', '12/12/2012', 3, 3, 3, 3, 3, '3')

INSERT INTO Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes) VALUES
(1, 1, '12/12/2012', 1, 1, 1, 1, '1'),
(2, 2, '12/12/2012', 2, 2, 2, 2, '2'),
(3, 3, '12/12/2012', 3, 3, 3, 3, '3')