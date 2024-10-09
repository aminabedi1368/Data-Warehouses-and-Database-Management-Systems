SELECT p.Address, t.Transaction_Amount
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
ORDER BY t.Transaction_Amount DESC
    LIMIT 5;
