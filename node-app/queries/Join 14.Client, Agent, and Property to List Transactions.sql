SELECT c.First_Name AS Client_First_Name, c.Last_Name AS Client_Last_Name, a.First_Name AS Agent_First_Name, a.Last_Name AS Agent_Last_Name, p.Address
FROM Client c
         JOIN Transaction t ON c.Client_ID = t.Client_ID
         JOIN Agent a ON t.Agent_ID = a.Agent_ID
         JOIN Property p ON t.Property_ID = p.Property_ID;
