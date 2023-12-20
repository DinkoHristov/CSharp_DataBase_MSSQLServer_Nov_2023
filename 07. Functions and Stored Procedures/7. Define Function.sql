CREATE OR ALTER FUNCTION ufn_IsWordComprised (@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS INT
AS
BEGIN
	DECLARE @myIndex INT = 1;

	WHILE (@myIndex <= LEN(@word))
	BEGIN
		DECLARE @letter VARCHAR(1) = SUBSTRING(@word, @myIndex, 1);

		IF (@setOfLetters NOT LIKE '%' + @letter + '%')
			RETURN 0;

		SET @myIndex += 1;
	END

	RETURN 1;
END