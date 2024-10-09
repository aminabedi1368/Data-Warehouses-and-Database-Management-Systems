SELECT YEAR(Transaction_Date) AS Year, MONTH(Transaction_Date) AS Month, COUNT(*) AS Number_of_Sales, SUM(Transaction_Amount) AS Total_Sales
FROM Transaction
WHERE Transaction_Type = 'Sale'
GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date)
ORDER BY Year, Month;
