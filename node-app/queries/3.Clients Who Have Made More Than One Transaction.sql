SELECT Client_ID, COUNT(*) AS Number_of_Transactions
FROM Transaction
GROUP BY Client_ID
HAVING COUNT(*) > 1;
