CREATE TABLE Passengers
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(80) NOT NULL
)

CREATE TABLE Towns
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE RailwayStations
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	TownId INT REFERENCES Towns(Id) NOT NULL
)

CREATE TABLE Trains
(
	Id INT PRIMARY KEY IDENTITY,
	HourOfDeparture VARCHAR(5) NOT NULL,
	HourOfArrival VARCHAR(5) NOT NULL,
	DepartureTownId INT REFERENCES Towns(Id) NOT NULL,
	ArrivalTownId INT REFERENCES Towns(Id) NOT NULL
)

CREATE TABLE TrainsRailwayStations
(
	TrainId INT REFERENCES Trains(Id) NOT NULL,
	RailwayStationId INT REFERENCES RailwayStations(Id) NOT NULL,
	CONSTRAINT PK_TrainsRailwayStations
	PRIMARY KEY (TrainId, RailwayStationId)
)

CREATE TABLE MaintenanceRecords
(
	Id INT PRIMARY KEY IDENTITY,
	DateOfMaintenance DATE NOT NULL,
	Details VARCHAR(2000) NOT NULL,
	TrainId INT REFERENCES Trains(Id) NOT NULL
)

CREATE TABLE Tickets
(
	Id INT PRIMARY KEY IDENTITY,
	Price DECIMAL(18, 2) NOT NULL,
	DateOfDeparture DATE NOT NULL,
	DateOfArrival DATE NOT NULL,
	TrainId INT REFERENCES Trains(Id) NOT NULL,
	PassengerId INT REFERENCES Passengers(Id) NOT NULL
)