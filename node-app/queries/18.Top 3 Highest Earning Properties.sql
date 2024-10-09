SELECT p.Address, SUM(t.Transaction_Amount) AS Total_Earnings
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
GROUP BY p.Address
ORDER BY Total_Earnings DESC
    LIMIT 3;
