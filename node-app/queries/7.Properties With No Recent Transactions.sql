SELECT p.Address
FROM Property p
         LEFT JOIN Transaction t ON p.Property_ID = t.Property_ID
    AND t.Transaction_Date > DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
WHERE t.Transaction_ID IS NULL;
