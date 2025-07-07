-- Scenario 1: Discount 1% Interest for Customers Over 60
SET SERVEROUTPUT ON;
BEGIN
  FOR cust IN (SELECT CustomerID, DOB FROM Customers) LOOP
    IF TRUNC(MONTHS_BETWEEN(SYSDATE, cust.DOB) / 12) > 60 THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE('1% discount applied to Customer ID: ' || cust.CustomerID);
    END IF;
  END LOOP;
  COMMIT;
END;
/

-- Scenario 2: Set IsVIP to TRUE if Balance > 10000
ALTER TABLE Customers ADD IsVIP VARCHAR2(5) DEFAULT 'FALSE';
SET SERVEROUTPUT ON;
BEGIN
  FOR cust IN (SELECT CustomerID, Balance FROM Customers) LOOP
    IF cust.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'TRUE'
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Customer ID ' || cust.CustomerID || ' promoted to VIP');
    END IF;
  END LOOP;
  COMMIT;
END;
/

-- Scenario 3: Remind Customers Whose Loans End Within 30 Days
SET SERVEROUTPUT ON;
BEGIN
  FOR loan IN (
    SELECT l.LoanID, l.EndDate, c.Name
    FROM Loans l
    JOIN Customers c ON l.CustomerID = c.CustomerID
    WHERE l.EndDate <= SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || loan.LoanID ||
                         ' for customer "' || loan.Name ||
                         '" is due on ' || TO_CHAR(loan.EndDate, 'YYYY-MM-DD'));
  END LOOP;
END;
/