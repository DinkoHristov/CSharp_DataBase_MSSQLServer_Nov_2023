--•	Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
CREATE TABLE Categories
(
	Id INT PRIMARY KEY,
	CategoryName VARCHAR(255) NOT NULL,
	DailyRate VARCHAR(255) NOT NULL,
	WeeklyRate VARCHAR(255) NOT NULL,
	MonthlyRate VARCHAR(255) NOT NULL,
	WeekendRate VARCHAR(255) NOT NULL
)

--•	Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
CREATE TABLE Cars
(
	Id INT PRIMARY KEY,
	PlateNumber VARCHAR(255) NOT NULL,
	Manufacturer VARCHAR(255) NOT NULL,
	Model VARCHAR(255) NOT NULL,
	CarYear INT NOT NULL,
	CategoryId INT,
	Doors INT NOT NULL,
	Picture VARCHAR(255) NOT NULL,
	Condition VARCHAR(255) NOT NULL,
	Available BIT NOT NULL
)

ALTER TABLE Cars
ADD FOREIGN KEY (CategoryId) REFERENCES Categories(Id)

--•	Employees (Id, FirstName, LastName, Title, Notes)
CREATE TABLE Employees
(
	Id INT PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Notes VARCHAR(255) NOT NULL
)

--•	Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
CREATE TABLE Customers
(
	Id INT PRIMARY KEY,
	DriverLicenceNumber VARCHAR(255) NOT NULL,
	FullName VARCHAR(255) NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	City VARCHAR(255) NOT NULL,
	ZIPCode VARCHAR(255) NOT NULL,
	Notes VARCHAR(255) NOT NULL
)

--•	RentalOrders (Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
CREATE TABLE RentalOrders
(
	Id INT PRIMARY KEY,
	EmployeeId INT,
	CustomerId INT,
	CarId INT,
	TankLevel INT NOT NULL,
	KilometrageStart INT NOT NULL,
	KilometrageEnd INT NOT NULL,
	TotalKilometrage INT NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	TotalDays INT NOT NULL,
	RateApplied VARCHAR(255) NOT NULL,
	TaxRate VARCHAR(255) NOT NULL,
	OrderStatus VARCHAR(255) NOT NULL,
	Notes VARCHAR(255) NOT NULL
)

ALTER TABLE RentalOrders
ADD FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE RentalOrders
ADD FOREIGN KEY (CustomerId) REFERENCES Customers(Id)

ALTER TABLE RentalOrders
ADD FOREIGN KEY (CarId) REFERENCES Cars(Id)

INSERT INTO Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
(1, '1', '1', '1', '1', '1'),
(2, '2', '2', '2', '2', '2'),
(3, '3', '3', '3', '3', '3')

INSERT INTO Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) VALUES
(1, '1', '1', '1', 1, 1, 1, '1', '1', 1),
(2, '2', '2', '2', 2, 2, 2, '2', '2', 2),
(3, '3', '3', '3', 3, 3, 3, '3', '3', 3)

INSERT INTO Employees (Id, FirstName, LastName, Title, Notes) VALUES
(1, '1', '1', '1', '1'),
(2, '2', '2', '2', '2'),
(3, '3', '3', '3', '3')

INSERT INTO Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes) VALUES
(1, '1', '1', '1', '1', '1', '1'),
(2, '2', '2', '2', '2', '2', '2'),
(3, '3', '3', '3', '3', '3', '3')

INSERT INTO RentalOrders (Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, '12/12/2012', '12/15/2012', 1, '1', '1', '1', '1'),
(2, 2, 2, 2, 2, 2, 2, 2, '12/13/2012', '12/16/2012', 2, '2', '2', '2', '2'),
(3, 3, 3, 3, 3, 3, 3, 3, '12/14/2012', '12/17/2012', 3, '3', '3', '3', '3')