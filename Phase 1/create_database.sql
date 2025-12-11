--GROUP MEMBER NAMES:
--Joy Francisco
--Carlo David
--Ivan Herrera

--DELETE DATABASE IF SKSNationalBankDB already exist
USE master;
GO

ALTER DATABASE SKSNationalBankDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE SKSNationalBankDB;
GO

--Create new, empty SKSNationalBankDB
CREATE DATABASE SKSNationalBankDB;
GO

--Switch to newly created database
USE SKSNationalBankDB;
GO

-- Branch
CREATE TABLE Branch (
	branch_id INT IDENTITY(1,1) PRIMARY KEY,
	branch_name VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
	deposits DECIMAL(15, 2) DEFAULT 0,
	loans DECIMAL(15, 2) DEFAULT 0
);

--Address
CREATE TABLE Address(
	address_id INT IDENTITY(1,1) PRIMARY KEY,
	house_number INT NOT NULL,
	street VARCHAR(100) NOT NULL,
	city VARCHAR(50) NOT NULL,
	province VARCHAR(50) NOT NULL,
	postal_code VARCHAR(50) NOT NULL
);

--Customers
CREATE TABLE Customers(
	customer_id INT IDENTITY(1,1) PRIMARY KEY,
	address_id INT NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,

	CONSTRAINT FK_CustomerAddress
	FOREIGN KEY (address_id)
	REFERENCES Address(address_id)
);

--Employees
CREATE TABLE Employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	address_id INT NOT NULL,
	manager_id INT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	start_date DATE NOT NULL,
	position VARCHAR (100) NOT NULL,

	CONSTRAINT FK_Manager
	FOREIGN KEY (manager_id)
	REFERENCES Employees(employee_id),

	CONSTRAINT FK_EmployeeAddress
	FOREIGN KEY (address_id)
	REFERENCES Address(address_id)
);

--CustomerEmployee
CREATE TABLE CustomerEmployee(
	customer_id INT NOT NULL,
	employee_id INT NOT NULL,
	position VARCHAR(50),
	PRIMARY KEY(customer_id, employee_id),

	CONSTRAINT FK_CustomerEmployee_Customer
	FOREIGN KEY (customer_id)
	REFERENCES Customers(customer_id),

	CONSTRAINT FK_CustomerEmployee_Employee
	FOREIGN KEY (employee_id)
	REFERENCES Employees(employee_id)
);

--Location
CREATE TABLE Location (
	location_id INT IDENTITY(1,1) PRIMARY KEY,
	location_type VARCHAR(100) NOT NULL,
	branch_id INT NULL,
	
	CONSTRAINT FK_LocationBranch
	FOREIGN KEY (branch_id)
	REFERENCES Branch(branch_id)
);


--Account number sequence starting at 1
CREATE SEQUENCE ChequingAccountSeq
START WITH 1
INCREMENT BY 1

--Chequing Account
CREATE TABLE ChequingAccount (
	account_number CHAR(4) PRIMARY KEY
	DEFAULT RIGHT('0000' + CAST(NEXT VALUE FOR ChequingAccountSeq AS VARCHAR(4)), 4),
	balance DECIMAL(15, 2) DEFAULT 0
);

--Customer's Chequing Account
CREATE TABLE CustomerChequing (
	customer_id INT NOT NULL,
	account_number CHAR(4) NOT NULL,
	last_access DATE,
	PRIMARY KEY (customer_id, account_number),

	CONSTRAINT FK_CustomerChequing_Customer
	FOREIGN KEY (customer_id)
	REFERENCES Customers(customer_id),

	CONSTRAINT FK_CustomerChequing_Chequing
	FOREIGN KEY (account_number)
	REFERENCES ChequingAccount(account_number)
);


----Account number sequence starting at 1
CREATE SEQUENCE SavingAccountSeq
START WITH 1
INCREMENT BY 1

--Savings Account
CREATE TABLE SavingsAccount (
	account_number CHAR(4) PRIMARY KEY
	DEFAULT RIGHT('0000' + CAST(NEXT VALUE FOR SavingAccountSeq AS VARCHAR(4)), 4),
	balance DECIMAL (15, 2) DEFAULT 0,
	interest_rate DECIMAL(15,2) DEFAULT 0,
	last_access DATE
);

--Customer's Savings Account
CREATE TABLE CustomerSavings (
	customer_id INT NOT NULL,
	account_number CHAR(4) NOT NULL,
	PRIMARY KEY (customer_id, account_number),

	CONSTRAINT FK_CustomerSavings_Customer
	FOREIGN KEY (customer_id)
	REFERENCES Customers(customer_id),

	CONSTRAINT FK_CustomerSavings_Savings
	FOREIGN KEY (account_number)
	REFERENCES SavingsAccount(account_number)
);

--Overdraft
CREATE TABLE Overdraft (
	account_number CHAR(4) NOT NULL,
	check_number INT IDENTITY(1,1) NOT NULL,
	overdraft_date DATE NOT NULL,
	amount DECIMAL(15,2) NOT NULL,
	PRIMARY KEY(account_number, check_number),

	CONSTRAINT FK_Overdraft_Chequing
	FOREIGN KEY (account_number)
	REFERENCES ChequingAccount(account_number)
);

--Loan
CREATE TABLE Loan (
	loan_id INT IDENTITY(1,1) PRIMARY KEY,
	loan_amount DECIMAL(15, 2) NOT NULL,
	branch_id INT NOT NULL,

	CONSTRAINT FK_Loan_Branch
	FOREIGN KEY (branch_id)
	REFERENCES Branch(branch_id)
);

--Customer's Loan
CREATE TABLE CustomerLoan (
	customer_id INT NOT NULL,
	loan_id INT NOT NULL,
	PRIMARY KEY (customer_id, loan_id),

	CONSTRAINT FK_CustomerLoan_Customer
	FOREIGN KEY (customer_id)
	REFERENCES Customers(customer_id),

	CONSTRAINT FK_CustomerLoan_Loan
	FOREIGN KEY (loan_id)
	REFERENCES Loan(loan_id)
);

--Loan Payment
CREATE TABLE LoanPayment (
	loan_id INT NOT NULL,
	payment_id INT NOT NULL,
	payment_date DATE NOT NULL,
	amount DECIMAL(15,2) NOT NULL,
	PRIMARY KEY(loan_id, payment_id),

	CONSTRAINT FK_LoanPayment_Loan
	FOREIGN KEY (loan_id)
	REFERENCES Loan (loan_id)
);

--Transaction
CREATE TABLE Transactions (
	transaction_id INT IDENTITY (1,1) PRIMARY KEY,
	account_number CHAR(4),
	account_type VARCHAR(20) CHECK (account_type IN ('Chequing', 'Savings')),
	branch_id INT,
	transaction_date DATETIME,
	transaction_type VARCHAR (50) NOT NULL,
	amount DECIMAL(15,2) NOT NULL,

	CONSTRAINT FK_Transaction_Branch
	FOREIGN KEY (branch_id)
	REFERENCES Branch (branch_id)
);