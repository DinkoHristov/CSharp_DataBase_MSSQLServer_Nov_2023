CREATE OR ALTER TRIGGER tr_InsertIntoEmails
ON Logs FOR INSERT
AS
	DECLARE @AccountId INT = (SELECT TOP(1) AccountId FROM inserted); 
	DECLARE @OldBalance MONEY = (SELECT TOP(1) OldSum FROM inserted);
	DECLARE @NewBalance MONEY = (SELECT TOP(1) NewSum FROM inserted)
	
	INSERT INTO NotificationEmails(Recipient, [Subject], Body) VALUES
	(
		@AccountId,
		'Balance change for account: ' + CAST(@AccountId AS VARCHAR(20)),
		'On ' + CONVERT(VARCHAR(30), GETDATE(), 103) + ' your balance was changed from ' + CAST(@OldBalance AS VARCHAR(20)) + ' to ' + CAST(@NewBalance AS VARCHAR(20)) + '.'
	)