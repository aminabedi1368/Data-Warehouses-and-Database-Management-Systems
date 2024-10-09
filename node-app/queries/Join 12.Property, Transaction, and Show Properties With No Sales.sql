SELECT p.Address
FROM Property p
         LEFT JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE t.Transaction_ID IS NULL;
