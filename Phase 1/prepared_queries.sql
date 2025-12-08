--GROUP MEMBER NAMES:
--Joy Francisco
--Carlo David
--Ivan Herrera

USE SKSNationalBankDB;
GO

-- 1. Customer Details
CREATE PROC GetCustomerDetailsById @CustomerId INT
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerId)
BEGIN
THROW 50000, 'Invalid Customer ID', 1;
END

SELECT C.customer_id, C.first_name +' '+ C.last_name AS customer_name,
CAST(A.house_number AS VARCHAR(10))+' '+ A.street + ', ' + A.city + ', ' + A.province + ' ' + A.postal_code 
	AS Address
    FROM Customers C
    JOIN Address A ON C.address_id = A.address_id
    WHERE C.customer_id = @CustomerId;
	
SELECT 'Chequing' AS AccountType, 
	CA.account_number, 
	CA.balance, 
	CC.last_access

    FROM CustomerChequing CC
    JOIN ChequingAccount CA ON CC.account_number = CA.account_number
    WHERE CC.customer_id = @CustomerId;

SELECT 'Savings' AS AccountType, 
	SA.account_number,
	SA.balance, 
	SA.interest_rate, 
	SA.last_access
    
	FROM CustomerSavings CS
    JOIN SavingsAccount SA ON CS.account_number = SA.account_number
    WHERE CS.customer_id = @CustomerId;

SELECT L.loan_id, 
	L.loan_amount,
	B.branch_name,
	B.city AS branch_city
    
	FROM CustomerLoan CL
    JOIN Loan L ON CL.loan_id = L.loan_id
    JOIN Branch B ON L.branch_id = B.branch_id
    WHERE CL.customer_id = @CustomerId;

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
THROW 50002, @ErrorMessage, 1;
END CATCH
END;
GO

-- EXAMPLE
EXEC GetCustomerDetailsById
	@CustomerId = 21;


---------------------------------
-- 2. Add Customer
CREATE PROC AddCustomer
    @FirstName VARCHAR(100),
    @LastName VARCHAR(100),
    @HouseNumber INT,
    @Street VARCHAR(100),
    @City VARCHAR(50),
    @Province VARCHAR(50),
    @PostalCode VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY DECLARE @AddressId INT;

INSERT INTO Address (house_number, street, city, province, postal_code)
VALUES (@HouseNumber, @Street, @City, @Province, @PostalCode);
SET @AddressId = SCOPE_IDENTITY();
INSERT INTO Customers (address_id, first_name, last_name)
VALUES (@AddressId, @FirstName, @LastName)

	PRINT 'New Customer added successfully.';

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
THROW 50002, @ErrorMessage, 1;
END CATCH
END;
GO

-- EXAMPLE:
 EXEC AddCustomer
	@FirstName = 'Khris Dennis',
	@LastName = 'Bedar',
    @HouseNumber = 125,
    @Street = 'Sta Mesa',
    @City = 'Manila',
    @Province = 'Metro Manila',
    @PostalCode = '1101';


---------------------------------
-- 3. Update Customer Address
CREATE PROC UpdateCustomerAddress
    @CustomerId INT,
    @HouseNumber INT,
    @Street VARCHAR(100),
    @City VARCHAR(50),
    @Province VARCHAR(50),
    @PostalCode VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerId)
BEGIN
THROW 50000, 'Invalid Customer ID', 1;
END

IF @HouseNumber IS NULL OR
@Street IS NULL OR LTRIM(RTRIM(@Street)) = '' OR
@City IS NULL OR LTRIM(RTRIM(@City)) = '' OR
@Province IS NULL OR LTRIM(RTRIM(@Province)) = '' OR
@PostalCode IS NULL OR LTRIM(RTRIM(@PostalCode)) = ''

BEGIN
THROW 50004, 'One or more address fields are missing or empty.', 1;
END
DECLARE @NewAddressId INT;
INSERT INTO Address (house_number, street, city, province, postal_code)
VALUES (@HouseNumber, @Street, @City, @Province, @PostalCode);
SET @NewAddressId = SCOPE_IDENTITY();

UPDATE Customers
SET address_id = @NewAddressId
WHERE customer_id = @CustomerId;

	PRINT 'Update Customer Address successfully.';

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
THROW 50002, @ErrorMessage, 1;
END CATCH
END;
GO

-- EXAMPLE:
 EXEC UpdateCustomerAddress
	@CustomerId = 1,
    @HouseNumber = 123,
    @Street = 'Maginhawa',
    @City = 'Quezon City',
    @Province = 'Metro Manila',
    @PostalCode = '1101'


---------------------------------
-- 4. Open Chequing Account
CREATE PROC OpenChequingAccount
	@CustomerId INT,
	@InitialDeposit DECIMAL(15,2)
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerId)
BEGIN
THROW 50000, 'Invalid Customer ID', 1;
END
DECLARE @AccountNumber CHAR(4);

INSERT INTO ChequingAccount (balance)
VALUES (@InitialDeposit);

SET @AccountNumber = (SELECT TOP 1 account_number FROM ChequingAccount ORDER BY account_number DESC);
INSERT INTO CustomerChequing (customer_id, account_number, last_access)
VALUES (@CustomerId, @AccountNumber, GETDATE());

	PRINT 'Checking Account opened successfully.';
    
END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
THROW 50002, @ErrorMessage, 1;
END CATCH
END;
GO

-- EXAMPLE:
EXEC OpenChequingAccount 
	@CustomerId = 21, 
	@InitialDeposit = 500.00


---------------------------------
-- 5. Open Savings Account
CREATE PROC OpenSavingsAccount
    @CustomerId INT,
    @InitialDeposit DECIMAL(15,2),
    @InterestRate DECIMAL(15,2)
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerId)
BEGIN
THROW 50000, 'Invalid Customer ID', 1;
END
DECLARE @AccountNumber CHAR(4);

INSERT INTO SavingsAccount (balance, interest_rate, last_access)
VALUES (@InitialDeposit, @InterestRate, GETDATE());

SET @AccountNumber = (SELECT TOP 1 account_number FROM SavingsAccount ORDER BY account_number DESC);

INSERT INTO CustomerSavings (customer_id, account_number)
VALUES (@CustomerId, @AccountNumber);

	PRINT 'Savings Account opened successfully.';

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
THROW 50002, @ErrorMessage, 1;
END CATCH
END;
GO

-- EXAMPLE:
EXEC OpenSavingsAccount 
	@CustomerId = 21, 
	@InitialDeposit = 1000.00, 
	@InterestRate = 1.5

	
---------------------------------
-- 6. Checquing Account Deposit
CREATE PROC DepositToChequing
    @CustomerId INT,
    @Amount DECIMAL(15,2)
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerId)
BEGIN
THROW 50000, 'Invalid Customer ID', 1;
END

IF @Amount IS NULL OR @Amount <= 0
BEGIN
THROW 50005, 'Deposit amount must be greater than zero.', 1;
END

DECLARE @AccountNumber CHAR(4);
SELECT TOP 1 @AccountNumber = account_number
FROM CustomerChequing
WHERE customer_id = @CustomerId;

IF @AccountNumber IS NULL
BEGIN
THROW 50006, 'Customer does not have a chequing account.', 1;
END

UPDATE ChequingAccount
SET balance = balance + @Amount
WHERE account_number = @AccountNumber;

UPDATE CustomerChequing
SET last_access = GETDATE()
WHERE customer_id = @CustomerId AND account_number = @AccountNumber;

SELECT account_number, balance
FROM ChequingAccount
WHERE account_number = @AccountNumber;

	PRINT 'Checking Account deposit successful.';

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorState INT = ERROR_STATE();
THROW @ErrorNumber, @ErrorMessage, @ErrorState;
END CATCH
END;
GO

-- EXAMPLE:
EXEC DepositToChequing 
	@CustomerId = 21, 
	@Amount = 250.00


---------------------------------
-- 7. Chequing Account Withdrawal
CREATE PROC WithdrawFromChequing
    @CustomerId INT,
    @Amount DECIMAL(15,2)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @AccountNumber CHAR(4);
DECLARE @CurrentBalance DECIMAL(15,2);

BEGIN TRY
IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerId)
BEGIN
THROW 50000, 'Invalid Customer ID', 1;
END
IF @Amount IS NULL OR @Amount <= 0
BEGIN
THROW 50007, 'Withdrawal amount must be greater than zero.', 1;
END

SELECT TOP 1 @AccountNumber = account_number
FROM CustomerChequing
WHERE customer_id = @CustomerId;

IF @AccountNumber IS NULL
BEGIN
THROW 50006, 'Customer does not have a chequing account.', 1;
END

SELECT @CurrentBalance = balance
FROM ChequingAccount
WHERE account_number = @AccountNumber;

IF @Amount > @CurrentBalance
BEGIN
THROW 50008, 'Insufficient funds for withdrawal.', 1;
END

UPDATE ChequingAccount
SET balance = balance - @Amount
WHERE account_number = @AccountNumber;

UPDATE CustomerChequing
SET last_access = GETDATE()
WHERE customer_id = @CustomerId AND account_number = @AccountNumber;

SELECT account_number, balance
FROM ChequingAccount
WHERE account_number = @AccountNumber;

	PRINT 'Checking Account withdrawal successful.';

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorState INT = ERROR_STATE();
THROW @ErrorNumber, @ErrorMessage, @ErrorState;
END CATCH
END;
GO

-- EXAMPLE:
EXEC WithdrawFromChequing 
	@CustomerId = 21, 
	@Amount = 250.00


---------------------------------
-- 8. Get Customer Loan History
CREATE PROC CustomerLoanHistory
    @CustomerID INT
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
-- Validate customer
IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerID)
BEGIN
THROW 50000, 'Invalid Customer ID.', 1;
END

-- Return loan history
SELECT 
	L.loan_id,
    L.loan_amount,
    B.branch_name,
    LP.payment_id,
    LP.payment_date,
    LP.amount AS payment_amount
	
FROM CustomerLoan CL
JOIN Loan L ON CL.loan_id = L.loan_id
JOIN Branch B ON L.branch_id = B.branch_id
LEFT JOIN LoanPayment LP ON L.loan_id = LP.loan_id
WHERE CL.customer_id = @CustomerID
ORDER BY L.loan_id, LP.payment_date;

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorState INT = ERROR_STATE();
THROW @ErrorNumber, @ErrorMessage, @ErrorState;
END CATCH
END;

-- EXAMPLE:
EXEC CustomerLoanHistory
	@CustomerID = 21;


---------------------------------
-- 9. Paying Loan
CREATE PROC PayCustomerLoan
    @CustomerID INT,
    @LoanID INT,
    @Amount DECIMAL(15,2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentBalance DECIMAL(15,2);
    DECLARE @NextPaymentID INT;
    DECLARE @PaymentDate DATE = GETDATE();

BEGIN TRY
IF NOT EXISTS (
SELECT 1 FROM CustomerLoan WHERE customer_id = @CustomerID AND loan_id = @LoanID)
BEGIN
THROW 50001, 'Loan does not belong to the specified customer.', 1;
END

SELECT @CurrentBalance = loan_amount FROM Loan WHERE loan_id = @LoanID;
IF @Amount > @CurrentBalance
BEGIN
THROW 50002, 'Payment amount exceeds current loan balance.', 1;
END

SELECT @NextPaymentID = ISNULL(MAX(payment_id), 0) + 1 FROM LoanPayment WHERE loan_id = @LoanID;
INSERT INTO LoanPayment (loan_id, payment_id, payment_date, amount)
VALUES (@LoanID, @NextPaymentID, @PaymentDate, @Amount);

UPDATE Loan SET loan_amount = loan_amount - @Amount WHERE loan_id = @LoanID;

SELECT loan_id, loan_amount, branch_id FROM Loan WHERE loan_id = @LoanID;

PRINT 'Loan payment recorded successfully.';

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorState INT = ERROR_STATE();
THROW @ErrorNumber, @ErrorMessage, @ErrorState;
END CATCH
END;
GO

-- EXAMPLE:
EXEC PayCustomerLoan
    @CustomerID = 1,
    @LoanID = 1,
    @Amount =2000;


---------------------------------
-- 10. Open a loan
CREATE or ALTER PROC OpenNewLoan
    @CustomerID INT,
    @BranchID INT,
    @LoanAmount DECIMAL(15,2)
AS
BEGIN
SET NOCOUNT ON;

DECLARE @LoanID INT;

BEGIN TRY

IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = @CustomerID)
BEGIN
THROW 50000, 'Invalid Customer ID.', 1;
END

IF NOT EXISTS (SELECT 1 FROM Branch WHERE branch_id = @BranchID)
BEGIN
THROW 50001, 'Invalid Branch ID.', 1;
END

IF @LoanAmount IS NULL OR @LoanAmount <= 0
BEGIN
THROW 50002, 'Loan amount must be greater than zero.', 1;
END

INSERT INTO Loan (loan_amount, branch_id)
VALUES (@LoanAmount, @BranchID);

SET @LoanID = SCOPE_IDENTITY();

INSERT INTO CustomerLoan (customer_id, loan_id)
VALUES (@CustomerID, @LoanID);

SELECT @LoanID AS loan_id, 
	@LoanAmount AS loan_amount, 
	@BranchID AS branch_id;

	PRINT 'Opening New Loan recorded successfully.';

END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorState INT = ERROR_STATE();
THROW @ErrorNumber, @ErrorMessage, @ErrorState;
END CATCH
END;
GO

-- EXAMPLE:
EXEC OpenNewLoan
    @CustomerID = 21,
    @BranchID = 4,
    @LoanAmount = 5000;


---------------------------------
-- 11. Branch Summary
CREATE PROC GetBranchSummary
@BranchId INT
AS
BEGIN
BEGIN TRY

SELECT * FROM Branch 
WHERE branch_id = @BranchId;
END TRY
BEGIN CATCH
DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
THROW 50002, @ErrorMessage, 1;
END CATCH
END;
GO

-- EXAMPLE: --
EXEC GetBranchSummary
	@BranchId = 1;
