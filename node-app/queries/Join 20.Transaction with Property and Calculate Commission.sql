SELECT p.Address, t.Transaction_Amount, (t.Transaction_Amount * 0.03) AS Commission
FROM Property p
         JOIN Transaction t ON p.Property_ID = t.Property_ID;
