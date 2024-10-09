-- Property Table
CREATE TABLE Property
(
    Property_ID   INT AUTO_INCREMENT PRIMARY KEY,
    Address       VARCHAR(255)                       NOT NULL,
    Property_Type ENUM ('Residential', 'Commercial') NOT NULL,
    Size          DECIMAL(10, 2)                     NOT NULL,
    Price         DECIMAL(12, 2)                     NOT NULL,
    Status        ENUM ('Available', 'Sold', 'Leased') DEFAULT 'Available',
    Year_Built    YEAR                               NOT NULL,
    Listed_Date   DATE                               NOT NULL,
    UNIQUE (Address) -- Ensuring each property has a unique address
);

-- Client Table
CREATE TABLE Client
(
    Client_ID    INT AUTO_INCREMENT PRIMARY KEY,
    First_Name   VARCHAR(100)                                   NOT NULL,
    Last_Name    VARCHAR(100)                                   NOT NULL,
    Contact_Info VARCHAR(100)                                   NOT NULL,
    Client_Type  ENUM ('Buyer', 'Seller', 'Tenant', 'Landlord') NOT NULL
);

-- Agent Table
CREATE TABLE Agent
(
    Agent_ID            INT AUTO_INCREMENT PRIMARY KEY,
    First_Name          VARCHAR(100) NOT NULL,
    Last_Name           VARCHAR(100) NOT NULL,
    Contact_Info        VARCHAR(100) NOT NULL,
    Years_of_Experience INT CHECK (Years_of_Experience >= 0),
    CONSTRAINT UC_Agent UNIQUE (First_Name, Last_Name, Contact_Info) -- Avoid duplicate agent entries
);

-- Transaction Table
CREATE TABLE Transaction
(
    Transaction_ID     INT AUTO_INCREMENT PRIMARY KEY,
    Property_ID        INT                    NOT NULL,
    Client_ID          INT                    NOT NULL,
    Agent_ID           INT                    NOT NULL,
    Transaction_Date   DATE                   NOT NULL,
    Transaction_Amount DECIMAL(12, 2)         NOT NULL,
    Transaction_Type   ENUM ('Sale', 'Lease') NOT NULL,
    CONSTRAINT FK_Property FOREIGN KEY (Property_ID) REFERENCES Property (Property_ID) ON DELETE CASCADE,
    CONSTRAINT FK_Client FOREIGN KEY (Client_ID) REFERENCES Client (Client_ID) ON DELETE SET NULL,
    CONSTRAINT FK_Agent FOREIGN KEY (Agent_ID) REFERENCES Agent (Agent_ID),
    CHECK (Transaction_Amount > 0) -- Ensure transaction amount is positive
);

-- Indexes for faster querying
CREATE INDEX IDX_Property_Status ON Property (Status);
CREATE INDEX IDX_Transaction_Date ON Transaction (Transaction_Date);

CONSTRAINT FK_Property FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID) ON
DELETE CASCADE
    CONSTRAINT UC_Agent UNIQUE (First_Name, Last_Name, Contact_Info)

CHECK (Transaction_Amount > 0)
Property_Type ENUM('Residential', 'Commercial') NOT NULL,
CREATE INDEX IDX_Property_Status ON Property (Status);

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN
    IF NEW.Transaction_Type = 'Sale' THEN
        UPDATE Property
        SET Status = 'Sold'
        WHERE Property_ID = NEW.Property_ID;
    ELSEIF NEW.Transaction_Type = 'Lease' THEN
        UPDATE Property
        SET Status = 'Leased'
        WHERE Property_ID = NEW.Property_ID;
    END IF;
END;
