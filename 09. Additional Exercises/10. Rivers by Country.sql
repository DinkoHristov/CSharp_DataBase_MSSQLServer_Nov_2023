SELECT c.CountryName, co.ContinentName, COUNT(r.Id) AS RiversCount, ISNULL(SUM(r.Length), 0) AS TotalLength
	FROM Countries AS c
	LEFT JOIN Continents AS co ON co.ContinentCode = c.ContinentCode
	LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
	LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
	GROUP BY c.CountryName, co.ContinentName
ORDER BY RiversCount DESC,
TotalLength DESC,
c.CountryName ASC