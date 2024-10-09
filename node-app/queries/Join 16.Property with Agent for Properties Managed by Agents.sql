SELECT a.First_Name AS Agent_First_Name, a.Last_Name AS Agent_Last_Name, p.Address
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
         JOIN Agent a ON t.Agent_ID = a.Agent_ID;
