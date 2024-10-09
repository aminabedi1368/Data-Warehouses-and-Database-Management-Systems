SELECT p.Address, AVG(t.Transaction_Amount) AS Average_Sale_Price
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE t.Transaction_Type = 'Sale'
GROUP BY p.Address;
