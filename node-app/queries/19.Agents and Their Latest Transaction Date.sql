SELECT a.Agent_ID, a.First_Name, a.Last_Name, MAX(t.Transaction_Date) AS Latest_Transaction
FROM Agent a
         JOIN Transaction t ON a.Agent_ID = t.Agent_ID
GROUP BY a.Agent_ID;
