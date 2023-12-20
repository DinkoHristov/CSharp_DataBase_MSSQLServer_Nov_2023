CREATE OR ALTER FUNCTION ufn_CalculateFutureValue (@Sum DECIMAL(32, 4), @YearlyInterestRate FLOAT, @NumberOfYears INT)
RETURNS DECIMAL(32, 4)
AS
BEGIN
	RETURN @Sum * (POWER(1 + @YearlyInterestRate, @NumberOfYears));
END