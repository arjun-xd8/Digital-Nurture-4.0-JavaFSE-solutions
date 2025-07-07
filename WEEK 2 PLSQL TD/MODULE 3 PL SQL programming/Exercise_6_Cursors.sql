-- Scenario 1: Generate Monthly Statements for All Customers
SET SERVEROUTPUT ON;

DECLARE
  CURSOR txn_cursor IS
    SELECT t.TransactionID, t.AccountID, t.Amount, t.TransactionType, t.TransactionDate, a.CustomerID
    FROM Transactions t
    JOIN Accounts a ON t.AccountID = a.AccountID
    WHERE TO_CHAR(t.TransactionDate, 'MM-YYYY') = TO_CHAR(SYSDATE, 'MM-YYYY')
    ORDER BY a.CustomerID, t.TransactionDate;

  v_txn txn_cursor%ROWTYPE;
BEGIN
  OPEN txn_cursor;
  LOOP
    FETCH txn_cursor INTO v_txn;
    EXIT WHEN txn_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_txn.CustomerID || 
                         ' | Account ID: ' || v_txn.AccountID || 
                         ' | Txn Type: ' || v_txn.TransactionType || 
                         ' | Amount: ' || v_txn.Amount || 
                         ' | Date: ' || TO_CHAR(v_txn.TransactionDate, 'DD-Mon-YYYY'));
  END LOOP;
  CLOSE txn_cursor;
END;
/

-- Scenario 2: Apply Annual Fee to All Accounts
DECLARE
  CURSOR acc_cursor IS
    SELECT AccountID, Balance FROM Accounts;

  v_acc acc_cursor%ROWTYPE;
  v_fee CONSTANT NUMBER := 200;
BEGIN
  OPEN acc_cursor;
  LOOP
    FETCH acc_cursor INTO v_acc;
    EXIT WHEN acc_cursor%NOTFOUND;

    UPDATE Accounts
    SET Balance = Balance - v_fee
    WHERE AccountID = v_acc.AccountID;

    DBMS_OUTPUT.PUT_LINE('Annual fee of ₹' || v_fee || ' deducted from Account ID: ' || v_acc.AccountID);
  END LOOP;
  CLOSE acc_cursor;
  COMMIT;
END;
/

-- Scenario 3: Update Loan Interest Rates Based on Policy
DECLARE
  CURSOR loan_cursor IS
    SELECT LoanID, LoanAmount FROM Loans;

  v_loan loan_cursor%ROWTYPE;
  v_new_rate NUMBER;
BEGIN
  OPEN loan_cursor;
  LOOP
    FETCH loan_cursor INTO v_loan;
    EXIT WHEN loan_cursor%NOTFOUND;

    IF v_loan.LoanAmount < 5000 THEN
      v_new_rate := 5;
    ELSIF v_loan.LoanAmount <= 10000 THEN
      v_new_rate := 6;
    ELSE
      v_new_rate := 7;
    END IF;

    UPDATE Loans
    SET InterestRate = v_new_rate
    WHERE LoanID = v_loan.LoanID;

    DBMS_OUTPUT.PUT_LINE('Loan ID ' || v_loan.LoanID || ' updated to new interest rate: ' || v_new_rate || '%');
  END LOOP;
  CLOSE loan_cursor;
  COMMIT;
END;
/