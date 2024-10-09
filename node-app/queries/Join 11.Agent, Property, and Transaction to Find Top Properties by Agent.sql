SELECT a.Agent_ID, a.First_Name, a.Last_Name, p.Address, SUM(t.Transaction_Amount) AS Total_Sales
FROM Agent a
         JOIN Transaction t ON a.Agent_ID = t.Agent_ID
         JOIN Property p ON t.Property_ID = p.Property_ID
GROUP BY a.Agent_ID, a.First_Name, a.Last_Name, p.Address
ORDER BY Total_Sales DESC;
