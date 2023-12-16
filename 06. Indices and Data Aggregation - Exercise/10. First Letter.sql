SELECT k.FirstLetter
	FROM( SELECT LEFT(FirstName, 1) AS [FirstLetter] 
			FROM WizzardDeposits
			WHERE DepositGroup = 'Troll Chest'
			GROUP BY FirstName
) AS k
GROUP BY k.FirstLetter