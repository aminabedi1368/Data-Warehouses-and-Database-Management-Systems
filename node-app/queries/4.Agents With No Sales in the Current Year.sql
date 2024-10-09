SELECT a.Agent_ID, a.First_Name, a.Last_Name
FROM Agent a
         LEFT JOIN Transaction t ON a.Agent_ID = t.Agent_ID
    AND YEAR(t.Transaction_Date) = YEAR(CURDATE())
WHERE t.Transaction_ID IS NULL;
