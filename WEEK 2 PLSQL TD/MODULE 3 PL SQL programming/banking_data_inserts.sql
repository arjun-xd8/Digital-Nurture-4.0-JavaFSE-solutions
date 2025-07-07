-- EXERCISE:1
-- Customers: 2 seniors, 1 under 60, 1 rich
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (1, 'John Old', TO_DATE('1950-01-15', 'YYYY-MM-DD'), 9500, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (2, 'Jane Elder', TO_DATE('1955-03-20', 'YYYY-MM-DD'), 12000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (3, 'Jake Young', TO_DATE('1995-07-01', 'YYYY-MM-DD'), 8500, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (4, 'Richie Rich', TO_DATE('1980-05-30', 'YYYY-MM-DD'), 15000, SYSDATE);

-- Loans
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (101, 1, 10000, 7.5, SYSDATE, ADD_MONTHS(SYSDATE, 12));

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (102, 2, 12000, 6.5, SYSDATE, SYSDATE + 20); -- will trigger reminder

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (103, 3, 8000, 8, SYSDATE, ADD_MONTHS(SYSDATE, 10));

-- EXERCISE:2
-- Insert 2 accounts
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (201, 1, 'Savings', 5000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (202, 2, 'Checking', 2000, SYSDATE);

-- Add sample employee
INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (101, 'Rahul Dev', 'Engineer', 60000, 'IT', SYSDATE);

-- EXERCISE:3
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (203, 1, 'Savings', 1000, SYSDATE);
COMMIT;