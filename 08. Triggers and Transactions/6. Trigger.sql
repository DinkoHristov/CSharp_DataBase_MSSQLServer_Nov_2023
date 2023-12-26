CREATE OR ALTER TRIGGER tr_RestrictItems
ON UserGameItems INSTEAD OF INSERT
AS
	DECLARE @itemId INT = (SELECT ItemId FROM inserted);
	DECLARE @userGameId INT = (SELECT UserGameId FROM inserted);
	DECLARE @itemLevel INT = (SELECT MinLevel FROM Items WHERE Id = @itemId)
	DECLARE @userGameLevel INT = (SELECT [Level] FROM UsersGames WHERE Id = @userGameId)

	IF (@userGameLevel >= @itemLevel)
	BEGIN
		INSERT INTO UserGameItems (ItemId, UserGameId) VALUES
		(@itemId, @userGameId)
	END
GO

UPDATE UsersGames
SET Cash += 50000
WHERE GameId = (SELECT Id FROM Games WHERE [Name] = 'Bali') AND
	  UserId IN (SELECT Id FROM Users WHERE Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos'))

CREATE OR ALTER PROCEDURE usp_BuyItem (@userId INT, @itemId INT, @gameId INT)
AS
BEGIN TRANSACTION
	DECLARE @user INT = (SELECT Id FROM Users WHERE Id = @userId);
	DECLARE @item INT = (SELECT Id FROM Items WHERE Id = @itemId);

	IF (@user IS NULL OR @item IS NULL)
	BEGIN
		ROLLBACK
		RAISERROR('Invalid user or item Id!', 16, 1);
		RETURN
	END

	DECLARE @userCash DECIMAL(15, 2) = (SELECT Cash FROM UsersGames WHERE UserId = @userId AND GameId = @gameId);
	DECLARE @itemPrice DECIMAL(15, 2) = (SELECT Price FROM Items WHERE Id = @itemId);

	IF (@userCash - @itemPrice < 0)
	BEGIN
		ROLLBACK
		RAISERROR('Insufficient funds!', 16, 2)
		RETURN
	END

	UPDATE UsersGames
	SET Cash -= @itemPrice
	WHERE UserId = @userId AND GameId = 212

	DECLARE @userGameId DECIMAL(15, 2) = (SELECT Id FROM UsersGames WHERE UserId = @userId AND GameId = @gameId);

	INSERT INTO UserGameItems (ItemId, UserGameId) VALUES
	(@itemId, @userGameId)
COMMIT

GO

DECLARE @itemId INT = 251;

WHILE(@itemId <= 299)
BEGIN
	EXECUTE usp_BuyItem 22, @itemId, 212
	EXECUTE usp_BuyItem 37, @itemId, 212
	EXECUTE usp_BuyItem 52, @itemId, 212
	EXECUTE usp_BuyItem 61, @itemId, 212

	SET @itemId += 1;
END

DECLARE @counter INT = 501;

WHILE(@counter <= 539)
BEGIN
	EXECUTE usp_BuyItem 22, @counter, 212
	EXECUTE usp_BuyItem 37, @counter, 212
	EXECUTE usp_BuyItem 52, @counter, 212
	EXECUTE usp_BuyItem 61, @counter, 212

	SET @counter += 1;
END

GO

SELECT u.Username, g.Name, ug.Cash, i.Name
	FROM Users AS u
	JOIN UsersGames AS ug ON ug.UserId = u.Id
	JOIN Games AS g ON g.Id = ug.Id
	JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
	JOIN Items AS i ON i.Id = ugi.ItemId
	WHERE g.Name = 'Bali'
ORDER BY u.Username ASC, i.Name ASC