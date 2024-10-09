SELECT c.Client_ID, c.First_Name, c.Last_Name
FROM Client c
         LEFT JOIN Transaction t ON c.Client_ID = t.Client_ID
    AND t.Transaction_Date > DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
WHERE t.Transaction_ID IS NULL;
