SELECT a.Agent_ID, a.First_Name, a.Last_Name, SUM(t.Transaction_Amount) AS Total_Sales
FROM Agent a
         JOIN Transaction t ON a.Agent_ID = t.Agent_ID
GROUP BY a.Agent_ID
HAVING Total_Sales > 500000;
