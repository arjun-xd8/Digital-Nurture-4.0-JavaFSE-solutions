-- Scenario 1: CalculateAge Function
CREATE OR REPLACE FUNCTION CalculateAge (
    p_dob IN DATE
) RETURN NUMBER IS
    v_age NUMBER;
BEGIN
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, p_dob) / 12);
    RETURN v_age;
END;
/

SELECT 
    CustomerID, 
    Name, 
    DOB,
    CalculateAge(DOB) AS Age
FROM 
    Customers;

--  Scenario 2: Use CalculateMonthlyInstallment with data from your Loans table
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_amount IN NUMBER,
    p_annual_rate IN NUMBER,
    p_years IN NUMBER
) RETURN NUMBER IS
    r NUMBER;
    n NUMBER;
    emi NUMBER;
BEGIN
    r := (p_annual_rate / 12) / 100;
    n := p_years * 12;

    IF r = 0 THEN
        emi := p_amount / n;
    ELSE
        emi := p_amount * r * POWER(1 + r, n) / (POWER(1 + r, n) - 1);
    END IF;

    RETURN ROUND(emi, 2);
END;
/

SELECT 
    LoanID,
    CustomerID,
    LoanAmount,
    InterestRate,
    ROUND(MONTHS_BETWEEN(EndDate, StartDate) / 12, 2) AS Duration_Years,
    CalculateMonthlyInstallment(
        LoanAmount,
        InterestRate,
        ROUND(MONTHS_BETWEEN(EndDate, StartDate) / 12, 2)
    ) AS MonthlyEMI
FROM 
    Loans;

-- Scenario 3: Use HasSufficientBalance with your Accounts table
CREATE OR REPLACE FUNCTION HasSufficientBalance (
    p_account_id IN NUMBER,
    p_required_amount IN NUMBER
) RETURN BOOLEAN IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_account_id;
    RETURN v_balance >= p_required_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    WHEN OTHERS THEN
        RETURN FALSE;
END;
/

BEGIN
  FOR acc IN (SELECT AccountID, Balance FROM Accounts) LOOP
    IF HasSufficientBalance(acc.AccountID, 1000) THEN
      DBMS_OUTPUT.PUT_LINE('✅ Account ' || acc.AccountID || ' has sufficient balance.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('❌ Account ' || acc.AccountID || ' does NOT have sufficient balance.');
    END IF;
  END LOOP;
END;
/