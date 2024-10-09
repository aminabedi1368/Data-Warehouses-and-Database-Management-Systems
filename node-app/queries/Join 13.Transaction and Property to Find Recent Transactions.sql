SELECT p.Address, t.Transaction_Date, t.Transaction_Amount
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE t.Transaction_Date > DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
