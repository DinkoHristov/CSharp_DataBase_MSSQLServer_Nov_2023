SELECT TOP(5) ISNULL(c.CountryName, NULL) AS [CountryName], ISNULL(MAX(p.Elevation), NULL) AS [HighestPeakElevation], ISNULL(MAX(r.Length), NULL) AS [LongestRiverLength]
	FROM Countries AS c
	JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	JOIN Mountains AS m ON mc.MountainId = m.Id
	JOIN Peaks AS p ON m.Id = p.MountainId
	JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
	JOIN Rivers AS r ON cr.RiverId = r.Id
	GROUP BY c.CountryName
	ORDER BY [HighestPeakElevation] DESC,
	[LongestRiverLength] DESC,
	c.CountryName ASC