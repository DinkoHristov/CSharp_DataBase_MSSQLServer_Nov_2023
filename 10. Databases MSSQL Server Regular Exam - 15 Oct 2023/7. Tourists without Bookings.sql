SELECT t.Id, t.[Name], t.PhoneNumber
	FROM Tourists AS t
	LEFT JOIN Bookings AS b ON t.Id = b.TouristId
	LEFT JOIN Hotels AS h ON b.HotelId = h.Id
	WHERE h.Id IS NULL
	ORDER BY t.Name ASC