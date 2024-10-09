SELECT a.Agent_ID, a.First_Name, a.Last_Name, COUNT(t.Transaction_ID) AS Number_of_Transactions
FROM Agent a
         JOIN Transaction t ON a.Agent_ID = t.Agent_ID
GROUP BY a.Agent_ID, a.First_Name, a.Last_Name;
