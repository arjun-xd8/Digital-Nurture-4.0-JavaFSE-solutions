--  Scenario 1: Trigger to Update LastModified on Customer Record Update
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
  :NEW.LastModified := SYSDATE;
END;
/

UPDATE Customers
SET Name = 'Brad Pitt'
WHERE CustomerID = 1;

SELECT LastModified FROM Customers WHERE CustomerID = 1;

-- Scenario 2: Maintain Audit Log for Transactions
-- Create AuditLog table
CREATE TABLE AuditLog (
  AuditID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  TransactionID NUMBER,
  ActionType VARCHAR2(50),
  ActionDate DATE
);

-- Trigger to insert into AuditLog
CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
  INSERT INTO AuditLog (TransactionID, ActionType, ActionDate)
  VALUES (:NEW.TransactionID, 'INSERT', SYSDATE);
END;
/
-- Ensure the customer exists first
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (1, 'John Doe', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 1000, SYSDATE);

-- Then create the account
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (1, 1, 'Savings', 1000, SYSDATE);

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (3, 1, SYSDATE, 400, 'Deposit');

SELECT * FROM AuditLog;

-- Scenario 3: Trigger to Enforce Transaction Rules
CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
  v_balance NUMBER;
BEGIN
  SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = :NEW.AccountID;

  IF :NEW.TransactionType = 'Withdrawal' AND :NEW.Amount > v_balance THEN
    RAISE_APPLICATION_ERROR(-20001, ' Withdrawal amount exceeds account balance');
  ELSIF :NEW.TransactionType = 'Deposit' AND :NEW.Amount <= 0 THEN
    RAISE_APPLICATION_ERROR(-20002, ' Deposit amount must be greater than zero');
  END IF;
END;
/

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (4, 1, SYSDATE, -100, 'Deposit');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (5, 1, SYSDATE, 999999, 'Withdrawal');