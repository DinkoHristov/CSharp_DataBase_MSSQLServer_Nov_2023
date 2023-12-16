SELECT * 
FROM ( SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) AS [MinDepositCharge]
		FROM WizzardDeposits
		GROUP BY DepositGroup, MagicWandCreator
) AS k
ORDER BY k.MagicWandCreator ASC, k.DepositGroup ASC