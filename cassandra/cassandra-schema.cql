-- Create Keyspace
CREATE KEYSPACE IF NOT EXISTS realestate WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- Use the Keyspace
USE realestate;

-- Property Table
CREATE TABLE IF NOT EXISTS Property
(
    Property_ID   UUID PRIMARY KEY,
    Address       TEXT,
    Property_Type TEXT,
    Size          DECIMAL,
    Price         DECIMAL,
    Status        TEXT,
    Year_Built    INT,
    Listed_Date   DATE
);

-- Client Table
CREATE TABLE IF NOT EXISTS Client
(
    Client_ID    UUID PRIMARY KEY,
    First_Name   TEXT,
    Last_Name    TEXT,
    Contact_Info TEXT,
    Client_Type  TEXT
);

-- Agent Table
CREATE TABLE IF NOT EXISTS Agent
(
    Agent_ID            UUID PRIMARY KEY,
    First_Name          TEXT,
    Last_Name           TEXT,
    Contact_Info        TEXT,
    Years_of_Experience INT
);

-- Transaction Table
CREATE TABLE IF NOT EXISTS Transaction
(
    Transaction_ID     UUID PRIMARY KEY,
    Property_ID        UUID,
    Client_ID          UUID,
    Agent_ID           UUID,
    Transaction_Date   DATE,
    Transaction_Amount DECIMAL,
    Transaction_Type   TEXT
);

-- Indexes for faster querying
CREATE INDEX IF NOT EXISTS IDX_Property_Status ON Property (Status);
CREATE INDEX IF NOT EXISTS IDX_Transaction_Date ON Transaction (Transaction_Date);


