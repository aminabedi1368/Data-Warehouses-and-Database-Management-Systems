SELECT Address, Listed_Date
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
WHERE t.Transaction_Type = 'Lease'
  AND t.Transaction_Date > DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
