SELECT p.Address, t.Transaction_Date
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE p.Status = 'Sold';
