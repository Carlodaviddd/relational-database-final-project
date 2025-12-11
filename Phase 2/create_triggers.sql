--GROUP MEMBER NAMES:
--Joy Francisco
--Carlo David
--Ivan Herrera

--Switch to newly created database
USE SKSNationalBankDB;
GO

--------------CRETE Audit--------------
CREATE TABLE Audit (
	audit_id INT IDENTITY (1,1) PRIMARY KEY,
	audit_description VARCHAR (500),
	audit_time_date DATETIME DEFAULT GETDATE()
);

--trg1: New customer added
CREATE TRIGGER trg_Audit_CustomerAdded
ON Customers
AFTER INSERT
AS
BEGIN
	INSERT INTO Audit (audit_description)
	SELECT 'New Customer Added: ' + first_name + ' ' + last_name
	FROM inserted;
END;

--Test
SELECT * FROM Customers;

INSERT INTO Customers (address_id, first_name, last_name)
VALUES (1, 'Alden', 'Richards');

SELECT * FROM Audit;

--trg2: Employee Promotion
CREATE TRIGGER trg_Audit_EmployeePromotion
ON Employees
AFTER UPDATE
AS
BEGIN
	INSERT INTO Audit (audit_description)
	SELECT 'Employee position change ' + CAST(i.employee_id AS VARCHAR) +
	': ' + i.first_name + ' ' + i.last_name +
	' |From Position: ' + d.position +
	' |To Position: ' + i.position +
	' |Date: ' + CONVERT(VARCHAR, GETDATE(), 120)

	FROM inserted i
	JOIN deleted d ON i.employee_id = d.employee_id
	WHERE i.position <> d.position;
END;

--Test
SELECT * FROM Employees;

UPDATE Employees
SET position = 'Senior Loan Officer'
WHERE employee_id = 2;

SELECT * FROM Audit;

--trg3: Chequing Account balance tracker
CREATE TRIGGER trg_Audit_ChequingUpdate
ON ChequingAccount
AFTER UPDATE
AS 
BEGIN
	INSERT INTO Audit (audit_description)
	SELECT 'Balance Updated: ' + i.account_number +
	' |Before: ' + CAST(d.balance AS VARCHAR(20)) +
	' |After: ' + CAST(i.balance AS VARCHAR(20)) +
	
	CASE
		WHEN i.balance > d.balance THEN ' |Deposit'
		WHEN i.balance < d.balance THEN ' |Withdrawal'
		ELSE ' |No change'
	END

	FROM inserted i
	JOIN deleted d ON i.account_number = d.account_number;
END;

--Test
SELECT * FROM ChequingAccount;

UPDATE ChequingAccount
SET balance = balance + 1000
WHERE account_number = '0001';

SELECT * FROM Audit;