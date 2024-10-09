SELECT p.Address, c.First_Name, c.Last_Name, t.Transaction_Date
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
         JOIN Client c ON t.Client_ID = c.Client_ID
WHERE t.Transaction_Date > DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
