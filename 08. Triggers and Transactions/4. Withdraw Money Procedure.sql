CREATE OR ALTER PROCEDURE usp_WithdrawMoney(@AccountId INT, @MoneyAmount DECIMAL(15, 4))
AS
	IF (@MoneyAmount < 0)
		THROW 50001, 'Amount must be a positive numebr!', 1

	UPDATE Accounts
	SET Balance -= @MoneyAmount