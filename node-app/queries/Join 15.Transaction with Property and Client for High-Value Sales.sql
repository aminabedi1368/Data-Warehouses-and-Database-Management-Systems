SELECT p.Address, c.First_Name AS Client_First_Name, c.Last_Name AS Client_Last_Name, t.Transaction_Amount
FROM Transaction t
         JOIN Property p ON t.Property_ID = p.Property_ID
         JOIN Client c ON t.Client_ID = c.Client_ID
WHERE t.Transaction_Amount > 500000;
