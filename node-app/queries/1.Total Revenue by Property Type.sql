SELECT Property_Type, SUM(Transaction_Amount) AS Total_Revenue
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE Transaction_Type = 'Sale'
GROUP BY Property_Type;
