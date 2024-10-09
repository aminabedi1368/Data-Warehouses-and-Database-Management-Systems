SELECT p.Address, t.Transaction_Date, c.First_Name, c.Last_Name
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
         JOIN Client c ON t.Client_ID = c.Client_ID;
