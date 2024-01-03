CREATE OR ALTER PROCEDURE usp_SearchByCountry(@country VARCHAR(50))
AS
	SELECT t.Name, t.PhoneNumber, t.Email, COUNT(b.RoomId) AS CountOfBookings
		FROM Tourists AS t
		JOIN Countries AS c ON t.CountryId = c.Id
		JOIN Bookings AS b ON b.TouristId = t.Id
		WHERE c.[Name] = @country
		GROUP BY t.Name, t.PhoneNumber, t.Email