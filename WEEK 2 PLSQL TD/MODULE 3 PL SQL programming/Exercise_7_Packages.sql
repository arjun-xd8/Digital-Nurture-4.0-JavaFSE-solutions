-- Scenario 1: Package — CustomerManagement
CREATE OR REPLACE PACKAGE CustomerManagement AS
  PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER);
  PROCEDURE UpdateCustomer(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER);
  FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS
  PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER) IS
  BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_id, p_name, p_dob, p_balance, SYSDATE);
  END;

  PROCEDURE UpdateCustomer(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER) IS
  BEGIN
    UPDATE Customers
    SET Name = p_name, Balance = p_balance, LastModified = SYSDATE
    WHERE CustomerID = p_id;
  END;

  FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER IS
    v_balance NUMBER;
  BEGIN
    SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_id;
    RETURN v_balance;
  END;
END CustomerManagement;
/

BEGIN
  CustomerManagement.AddCustomer(10, 'Ravi Kumar', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 5000);
END;
/

SELECT CustomerManagement.GetCustomerBalance(10) FROM dual;


-- Scenario 2: Package — EmployeeManagement
CREATE OR REPLACE PACKAGE EmployeeManagement AS
  PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hiredate DATE);
  PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER);
  FUNCTION GetAnnualSalary(p_id NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS
  PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hiredate DATE) IS
  BEGIN
    INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
    VALUES (p_id, p_name, p_position, p_salary, p_dept, p_hiredate);
  END;

  PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER) IS
  BEGIN
    UPDATE Employees
    SET Salary = p_salary
    WHERE EmployeeID = p_id;
  END;

  FUNCTION GetAnnualSalary(p_id NUMBER) RETURN NUMBER IS
    v_salary NUMBER;
  BEGIN
    SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_id;
    RETURN v_salary * 12;
  END;
END EmployeeManagement;
/

BEGIN
  EmployeeManagement.HireEmployee(5, 'Suman Mehta', 'Analyst', 50000, 'Finance', SYSDATE);
END;
/

SELECT EmployeeManagement.GetAnnualSalary(5) FROM dual;


-- Scenario 3: Package — AccountOperations
CREATE OR REPLACE PACKAGE AccountOperations AS
  PROCEDURE OpenAccount(p_accid NUMBER, p_custid NUMBER, p_type VARCHAR2, p_balance NUMBER);
  PROCEDURE CloseAccount(p_accid NUMBER);
  FUNCTION GetTotalBalance(p_custid NUMBER) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS
  PROCEDURE OpenAccount(p_accid NUMBER, p_custid NUMBER, p_type VARCHAR2, p_balance NUMBER) IS
  BEGIN
    INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
    VALUES (p_accid, p_custid, p_type, p_balance, SYSDATE);
  END;

  PROCEDURE CloseAccount(p_accid NUMBER) IS
  BEGIN
    DELETE FROM Accounts WHERE AccountID = p_accid;
  END;

  FUNCTION GetTotalBalance(p_custid NUMBER) RETURN NUMBER IS
    v_total NUMBER := 0;
  BEGIN
    SELECT NVL(SUM(Balance), 0) INTO v_total FROM Accounts WHERE CustomerID = p_custid;
    RETURN v_total;
  END;
END AccountOperations;
/

BEGIN
  AccountOperations.OpenAccount(10, 1, 'Savings', 4000);
END;
/

SELECT AccountOperations.GetTotalBalance(1) FROM dual;