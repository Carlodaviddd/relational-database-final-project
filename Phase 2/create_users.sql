--GROUP MEMBER NAMES:
--Joy Francisco
--Carlo David
--Ivan Herrera

USE [SKSNationalBankDB];
GO


 -- Create server logins and database users --
 --CUSTOMERS--
CREATE LOGIN [customer_group_E] 
WITH PASSWORD = 'customer', 
DEFAULT_DATABASE = SKSNationalBankDB,
CHECK_POLICY = OFF;
GO

CREATE USER [customer_group_E] 
FOR LOGIN [customer_group_E];
GO

--ACCOUNTANT
CREATE LOGIN [accountant_group_E] 
WITH PASSWORD = 'accountant',
DEFAULT_DATABASE = SKSNationalBankDB,
CHECK_POLICY = OFF;
GO

CREATE USER [accountant_group_E] 
FOR LOGIN [accountant_group_E];
GO

-- CUSTOMER: read-only on customer-related tables --
-- Grant/Deny permissions -- 
GRANT SELECT ON OBJECT::[dbo].[Customers]        TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[CustomerChequing] TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[CustomerSavings]  TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[CustomerLoan]     TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[ChequingAccount]  TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[SavingsAccount]   TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[Loan]             TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[LoanPayment]      TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[Transactions]     TO [customer_group_E];
GRANT SELECT ON OBJECT::[dbo].[Overdraft]        TO [customer_group_E];

-- DENY writes for customer_group_E
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[Customers]        TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[CustomerChequing] TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[CustomerSavings]  TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[CustomerLoan]     TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[ChequingAccount]  TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[SavingsAccount]   TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[Loan]             TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[LoanPayment]      TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[Transactions]     TO [customer_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[Overdraft]        TO [customer_group_E];


-- Hide non-customer tables for the customer user
DENY SELECT ON OBJECT::[dbo].[Employees] TO [customer_group_E];
DENY SELECT ON OBJECT::[dbo].[Address]   TO [customer_group_E];
DENY SELECT ON OBJECT::[dbo].[Branch]    TO [customer_group_E];
DENY SELECT ON OBJECT::[dbo].[Location]  TO [customer_group_E];


-- ACCOUNTANT: read all tables, deny writes to accounts/loans/payments
-- Add accountant_group_E to db_datareader (read all tables)
ALTER ROLE db_datareader ADD MEMBER [accountant_group_E];

-- DENY writes for accountant_group_E
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[ChequingAccount]  TO [accountant_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[CustomerChequing] TO [accountant_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[SavingsAccount]   TO [accountant_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[CustomerSavings]  TO [accountant_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[Overdraft]        TO [accountant_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[Loan]             TO [accountant_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[CustomerLoan]     TO [accountant_group_E];
DENY INSERT, UPDATE, DELETE ON OBJECT::[dbo].[LoanPayment]      TO [accountant_group_E];



 -- Privilege tests --
PRINT '--- Test: CUSTOMER user can SELECT customer-related tables ---';
EXECUTE AS USER = 'customer_group_E';
SELECT TOP (1) * FROM [dbo].[Customers];
SELECT TOP (1) * FROM [dbo].[ChequingAccount];
SELECT TOP (1) * FROM [dbo].[SavingsAccount];
SELECT TOP (1) * FROM [dbo].[Loan];
SELECT TOP (1) * FROM [dbo].[LoanPayment];

PRINT '--- Test: CUSTOMER user cannot INSERT into ChequingAccount ---';
BEGIN TRY
    INSERT INTO [dbo].[ChequingAccount] (balance) VALUES (0.00);
    PRINT 'Unexpected: INSERT succeeded (should be denied).';
END TRY
BEGIN CATCH
    PRINT 'Expected: INSERT denied. Error: ' + ERROR_MESSAGE();
END CATCH;
REVERT;

PRINT '--- Test: ACCOUNTANT user can SELECT Employees ---';
EXECUTE AS USER = 'accountant_group_E';
SELECT TOP (5) * FROM [dbo].[Employees];

PRINT '--- Test: ACCOUNTANT user cannot UPDATE Loan ---';
BEGIN TRY
    UPDATE [dbo].[Loan] SET loan_amount = loan_amount WHERE 1 = 0; 
    PRINT 'Unexpected: UPDATE succeeded (should be denied).';
END TRY
BEGIN CATCH
    PRINT 'Expected: UPDATE denied. Error: ' + ERROR_MESSAGE();
END CATCH;
REVERT;

PRINT 'Privilege tests completed.';
