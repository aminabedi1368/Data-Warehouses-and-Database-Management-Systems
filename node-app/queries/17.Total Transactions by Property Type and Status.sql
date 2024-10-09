SELECT p.Property_Type, p.Status, COUNT(*) AS Number_of_Transactions
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID
GROUP BY p.Property_Type, p.Status;
