CREATE OR ALTER PROCEDURE usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL(18, 4))
AS
	IF (@Amount < 0)
		THROW 50001, 'Amount must be a positive number!', 1

	UPDATE Accounts
	SET Balance -= @Amount
	WHERE Id = @SenderId

	UPDATE Accounts
	SET Balance += @Amount
	WHERE Id = @ReceiverId