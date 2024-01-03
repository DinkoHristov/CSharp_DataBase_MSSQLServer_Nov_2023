SELECT h.Id, h.Name
	FROM Hotels AS h
	JOIN HotelsRooms AS hr ON hr.HotelId = h.Id
	JOIN Rooms AS r ON hr.RoomId = r.Id
	LEFT JOIN Bookings AS b ON b.HotelId = h.Id
	WHERE r.Type = 'VIP Apartment'
	GROUP BY h.Id, h.Name
	ORDER BY COUNT(b.Id) DESC