SELECT p.Address, t.Transaction_Date, a.First_Name, a.Last_Name
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
         JOIN Agent a ON t.Agent_ID = a.Agent_ID;
