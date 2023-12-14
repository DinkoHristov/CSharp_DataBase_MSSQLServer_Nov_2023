SELECT TOP(5) CountryName, r.RiverName
	FROM Countries AS c
	JOIN Continents AS cn ON c.ContinentCode = cn.ContinentCode
	LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
	LEFT JOIN Rivers AS r ON cr.RiverId = r.Id
	WHERE cn.ContinentName = 'Africa'
	ORDER BY c.CountryName ASC