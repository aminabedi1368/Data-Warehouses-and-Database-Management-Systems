SELECT a.Agent_ID, a.First_Name, a.Last_Name, COUNT(*) AS Number_of_Sales
FROM Agent a
         JOIN Transaction t ON a.Agent_ID = t.Agent_ID
         JOIN Property p ON t.Property_ID = p.Property_ID
WHERE t.Transaction_Date > DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
  AND t.Transaction_Type = 'Sale'
GROUP BY a.Agent_ID;
