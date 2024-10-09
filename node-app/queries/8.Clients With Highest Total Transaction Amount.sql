SELECT c.Client_ID, c.First_Name, c.Last_Name, SUM(t.Transaction_Amount) AS Total_Amount
FROM Client c
         JOIN Transaction t ON c.Client_ID = t.Client_ID
GROUP BY c.Client_ID
ORDER BY Total_Amount DESC
    LIMIT 10;
