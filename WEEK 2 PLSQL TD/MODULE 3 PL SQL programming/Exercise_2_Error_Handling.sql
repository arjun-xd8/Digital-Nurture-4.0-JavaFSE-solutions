-- Scenario 1: Fund Transfer with Error Handling
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) AS
    v_balance NUMBER;
BEGIN
    -- Check available balance
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_from_account FOR UPDATE;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in source account.');
    END IF;

    -- Deduct from source
    UPDATE Accounts
    SET Balance = Balance - p_amount, LastModified = SYSDATE
    WHERE AccountID = p_from_account;

    -- Add to destination
    UPDATE Accounts
    SET Balance = Balance + p_amount, LastModified = SYSDATE
    WHERE AccountID = p_to_account;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Funds transferred successfully.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error during transfer: ' || SQLERRM);
END;
/

-- Scenario 2: Update Employee Salary with Error Handling
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_emp_id IN NUMBER,
    p_percent IN NUMBER
) AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_percent / 100)
    WHERE EmployeeID = p_emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(' Error updating salary: ' || SQLERRM);
END;
/

-- Scenario 3: Add New Customer Safely
CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
) AS
BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, IsVIP, LastModified)
    VALUES (p_id, p_name, p_dob, p_balance, 'FALSE', SYSDATE);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('New customer inserted.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Customer ID ' || p_id || ' already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting customer: ' || SQLERRM);
END;
/

-- Main method
-- Try a safe fund transfer
BEGIN
    SafeTransferFunds(201, 202, 1000);
END;
/

-- Try salary update
BEGIN
    UpdateSalary(101, 10);
END;
/

-- Try inserting a new customer
BEGIN
    AddNewCustomer(10, 'Test Customer', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 8000);
END;