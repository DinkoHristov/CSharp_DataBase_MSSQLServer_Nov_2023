SELECT TOP(5) k.CountryName, k.[Highest Peak Name], k.[Highest Peak Elevation], k.Mountain
	FROM (
	SELECT c.CountryName,
	ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
	ISNULL(m.MountainRange, '(no mountain)') AS [Mountain],
	ISNULL(MAX(p.Elevation), 0) AS [Highest Peak Elevation],
	DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY MAX(p.Elevation) DESC) AS Ranked
	FROM Countries AS c
	LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
	LEFT JOIN Peaks AS p ON m.Id = p.MountainId
	GROUP BY c.CountryName, p.PeakName, m.MountainRange
) AS k
WHERE Ranked = 1
ORDER BY k.CountryName ASC,
k.[Highest Peak Name] ASC