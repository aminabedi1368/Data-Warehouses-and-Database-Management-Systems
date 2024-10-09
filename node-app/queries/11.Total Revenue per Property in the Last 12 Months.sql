SELECT p.Address, SUM(t.Transaction_Amount) AS Total_Revenue
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE t.Transaction_Date > DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY p.Address;
