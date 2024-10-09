SELECT p.Address, t.Transaction_Date
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE t.Transaction_Date = (SELECT MAX(Transaction_Date) FROM Transaction WHERE Property_ID = p.Property_ID);
