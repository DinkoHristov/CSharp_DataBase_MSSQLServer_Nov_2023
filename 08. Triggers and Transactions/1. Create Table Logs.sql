CREATE OR ALTER TRIGGER tr_BalanceTrigger
ON Accounts AFTER UPDATE
AS
	INSERT INTO Logs (AccountId, OldSum, NewSum) VALUES
	(
		(SELECT Id FROM inserted),
		(SELECT Balance FROM deleted),
		(SELECT Balance FROM inserted)
	)
GO

CREATE TABLE Logs 
(
	LogId INT PRIMARY KEY IDENTITY,
	AccountId INT REFERENCES Accounts(Id),
	OldSum MONEY,
	NewSum MONEY
)
