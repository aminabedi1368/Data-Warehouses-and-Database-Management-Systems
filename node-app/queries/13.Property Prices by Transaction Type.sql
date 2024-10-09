SELECT p.Address, t.Transaction_Type, AVG(p.Price) AS Average_Price
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
GROUP BY p.Address, t.Transaction_Type;
