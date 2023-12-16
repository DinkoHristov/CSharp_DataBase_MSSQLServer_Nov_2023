SELECT TOP(2) k.DepositGroup 
	FROM ( SELECT DepositGroup, AVG(MagicWandSize) AS [LowestAverageWand]
			FROM WizzardDeposits
			GROUP BY DepositGroup
) AS k
ORDER BY k.LowestAverageWand ASC