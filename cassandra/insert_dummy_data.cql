-- Use Keyspace
USE realestate;

-- Insert data into Property Table
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '123 Maple St', 'Residential', 1500.00, 250000.00, 'Available', 2010, '2024-01-15');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '456 Oak St', 'Commercial', 3000.00, 500000.00, 'Sold', 2015, '2024-02-20');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '789 Pine St', 'Residential', 2000.00, 350000.00, 'Leased', 2018, '2024-03-10');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '101 Elm St', 'Commercial', 2500.00, 400000.00, 'Available', 2020, '2024-04-05');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '202 Birch St', 'Residential', 1800.00, 275000.00, 'Sold', 2012, '2024-05-15');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '303 Cedar St', 'Commercial', 2200.00, 325000.00, 'Available', 2017, '2024-06-20');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '404 Fir St', 'Residential', 1600.00, 285000.00, 'Leased', 2011, '2024-07-25');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '505 Spruce St', 'Commercial', 2700.00, 550000.00, 'Sold', 2014, '2024-08-30');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '606 Redwood St', 'Residential', 1900.00, 300000.00, 'Available', 2016, '2024-09-15');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '707 Maple Ave', 'Commercial', 3100.00, 600000.00, 'Leased', 2019, '2024-10-05');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '808 Oak Ave', 'Residential', 1700.00, 295000.00, 'Sold', 2013, '2024-11-10');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '909 Pine Ave', 'Commercial', 2600.00, 500000.00, 'Available', 2018, '2024-12-01');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1010 Elm Ave', 'Residential', 1800.00, 310000.00, 'Leased', 2014, '2024-12-20');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1111 Birch Ave', 'Commercial', 2400.00, 400000.00, 'Sold', 2015, '2024-12-25');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1212 Cedar Ave', 'Residential', 2000.00, 325000.00, 'Available', 2017, '2024-12-30');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1313 Fir Ave', 'Commercial', 2500.00, 450000.00, 'Leased', 2016, '2024-11-30');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1414 Spruce Ave', 'Residential', 1600.00, 270000.00, 'Sold', 2018, '2024-11-15');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1515 Redwood Ave', 'Commercial', 2800.00, 575000.00, 'Available', 2019, '2024-11-05');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1616 Maple Blvd', 'Residential', 1900.00, 305000.00, 'Leased', 2012, '2024-10-20');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1717 Oak Blvd', 'Commercial', 3200.00, 620000.00, 'Sold', 2020, '2024-09-25');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1818 Pine Blvd', 'Residential', 1700.00, 290000.00, 'Available', 2015, '2024-08-10');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '1919 Elm Blvd', 'Commercial', 2600.00, 480000.00, 'Leased', 2016, '2024-07-30');
INSERT INTO Property (Property_ID, Address, Property_Type, Size, Price, Status, Year_Built, Listed_Date) VALUES (uuid(), '2020 Birch Blvd', 'Residential', 1800.00, 320000.00, 'Sold', 2014, '2024-06-15');

-- Insert data into Client Table
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'John', 'Doe', 'john.doe@example.com', 'Buyer');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Jane', 'Smith', 'jane.smith@example.com', 'Seller');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Robert', 'Johnson', 'robert.johnson@example.com', 'Tenant');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Emily', 'Davis', 'emily.davis@example.com', 'Landlord');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Michael', 'Brown', 'michael.brown@example.com', 'Buyer');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Sophia', 'Miller', 'sophia.miller@example.com', 'Seller');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'William', 'Wilson', 'william.wilson@example.com', 'Tenant');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Olivia', 'Moore', 'olivia.moore@example.com', 'Landlord');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'James', 'Taylor', 'james.taylor@example.com', 'Buyer');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Ava', 'Anderson', 'ava.anderson@example.com', 'Seller');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Liam', 'Thomas', 'liam.thomas@example.com', 'Tenant');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Mia', 'Jackson', 'mia.jackson@example.com', 'Landlord');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Ethan', 'White', 'ethan.white@example.com', 'Buyer');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Isabella', 'Harris', 'isabella.harris@example.com', 'Seller');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Benjamin', 'Clark', 'benjamin.clark@example.com', 'Tenant');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Charlotte', 'Lewis', 'charlotte.lewis@example.com', 'Landlord');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Lucas', 'Young', 'lucas.young@example.com', 'Buyer');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Amelia', 'Walker', 'amelia.walker@example.com', 'Seller');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Henry', 'Hall', 'henry.hall@example.com', 'Tenant');
INSERT INTO Client (Client_ID, First_Name, Last_Name, Contact_Info, Client_Type) VALUES (uuid(), 'Harper', 'Allen', 'harper.allen@example.com', 'Landlord');

-- Insert data into Agent Table
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Sarah', 'Wilson', 'sarah.wilson@example.com', 5);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'David', 'Martinez', 'david.martinez@example.com', 10);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Laura', 'Taylor', 'laura.taylor@example.com', 7);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'James', 'Anderson', 'james.anderson@example.com', 3);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Olivia', 'Thomas', 'olivia.thomas@example.com', 8);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'John', 'Roberts', 'john.roberts@example.com', 6);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Emma', 'Harris', 'emma.harris@example.com', 9);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'William', 'Clark', 'william.clark@example.com', 4);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Sophia', 'Lewis', 'sophia.lewis@example.com', 11);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Aiden', 'Walker', 'aiden.walker@example.com', 5);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Mia', 'Young', 'mia.young@example.com', 12);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Noah', 'King', 'noah.king@example.com', 7);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Isabella', 'Scott', 'isabella.scott@example.com', 3);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Lucas', 'Adams', 'lucas.adams@example.com', 6);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Ava', 'Mitchell', 'ava.mitchell@example.com', 8);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Ethan', 'Parker', 'ethan.parker@example.com', 4);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Harper', 'Bell', 'harper.bell@example.com', 10);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Mason', 'Hughes', 'mason.hughes@example.com', 5);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Charlotte', 'Bryant', 'charlotte.bryant@example.com', 7);
INSERT INTO Agent (Agent_ID, First_Name, Last_Name, Contact_Info, Years_of_Experience) VALUES (uuid(), 'Liam', 'Harris', 'liam.harris@example.com', 6);

-- Insert data into Transaction Table
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1), (SELECT Client_ID FROM Client LIMIT 1), (SELECT Agent_ID FROM Agent LIMIT 1), '2024-06-01', 250000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 1), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 1), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 1), '2024-06-15', 500000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 2), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 2), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 2), '2024-07-01', 350000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 3), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 3), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 3), '2024-07-15', 400000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 4), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 4), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 4), '2024-08-01', 275000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 5), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 5), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 5), '2024-08-15', 325000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 6), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 6), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 6), '2024-09-01', 300000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 7), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 7), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 7), '2024-09-15', 550000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 8), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 8), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 8), '2024-10-01', 295000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 9), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 9), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 9), '2024-10-15', 500000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 10), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 10), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 10), '2024-11-01', 310000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 11), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 11), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 11), '2024-11-15', 400000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 12), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 12), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 12), '2024-12-01', 325000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 13), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 13), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 13), '2024-12-15', 450000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 14), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 14), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 14), '2024-12-25', 270000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 15), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 15), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 15), '2024-12-30', 575000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 16), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 16), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 16), '2024-11-20', 305000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 17), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 17), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 17), '2024-10-25', 620000.00, 'Lease');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 18), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 18), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 18), '2024-09-30', 290000.00, 'Sale');
INSERT INTO Transaction (Transaction_ID, Property_ID, Client_ID, Agent_ID, Transaction_Date, Transaction_Amount, Transaction_Type) VALUES (uuid(), (SELECT Property_ID FROM Property LIMIT 1 OFFSET 19), (SELECT Client_ID FROM Client LIMIT 1 OFFSET 19), (SELECT Agent_ID FROM Agent LIMIT 1 OFFSET 19), '2024-08-20', 480000.00, 'Lease');
