SELECT p.Property_ID, p.Address, SUM(t.Transaction_Amount) AS Total_Sales
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
GROUP BY p.Property_ID, p.Address;
