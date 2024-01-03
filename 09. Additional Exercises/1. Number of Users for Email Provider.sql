SELECT k.[Email Provider], COUNT(k.[Email Provider]) AS [Number Of Users] 
	FROM (SELECT SUBSTRING(Email ,CHARINDEX('@' ,Email, 1) + 1, LEN(Email)) AS [Email Provider]
	FROM Users
) AS k
GROUP BY k.[Email Provider]
ORDER BY COUNT(k.[Email Provider]) DESC,
k.[Email Provider] ASC