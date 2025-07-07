--  Scenario 1: Process Monthly Interest for All Savings Accounts
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
  FOR acc IN (SELECT AccountID, Balance FROM Accounts WHERE AccountType = 'Savings') LOOP
    UPDATE Accounts
    SET Balance = Balance + (acc.Balance * 0.01),
        LastModified = SYSDATE
    WHERE AccountID = acc.AccountID;

    DBMS_OUTPUT.PUT_LINE('Interest added to Account ID: ' || acc.AccountID);
  END LOOP;
  COMMIT;
END;
/

-- Scenario 2: Update Employee Bonus by Department
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
) AS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * p_bonus_percent / 100)
  WHERE Department = p_department;

  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No employees found in department: ' || p_department);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Bonus applied to department: ' || p_department);
  END IF;

  COMMIT;
END;
/

-- Scenario 3: Transfer Funds Between Customer's Own Accounts
CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) AS
    v_balance NUMBER;
    v_customer_from NUMBER;
    v_customer_to NUMBER;
BEGIN
    -- Check ownership and balance
    SELECT Balance, CustomerID INTO v_balance, v_customer_from FROM Accounts WHERE AccountID = p_from_account FOR UPDATE;
    SELECT CustomerID INTO v_customer_to FROM Accounts WHERE AccountID = p_to_account;

    IF v_customer_from != v_customer_to THEN
        RAISE_APPLICATION_ERROR(-20001, 'Accounts do not belong to the same customer.');
    END IF;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds.');
    END IF;

    -- Deduct and credit
    UPDATE Accounts
    SET Balance = Balance - p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_from_account;

    UPDATE Accounts
    SET Balance = Balance + p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_to_account;

    DBMS_OUTPUT.PUT_LINE('Transfer of ' || p_amount || ' completed.');
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error during transfer: ' || SQLERRM);
END;
/

-- Scenario 1
BEGIN
  ProcessMonthlyInterest;
END;
/

-- Scenario 2
BEGIN
  UpdateEmployeeBonus('IT', 10);
END;
/

-- Scenario 3
BEGIN
  TransferFunds(201, 203, 500);  -- Change IDs accordingly
END;
/

-- for debugging I used
SELECT AccountID, CustomerID, Balance FROM Accounts WHERE AccountID IN (201, 203);