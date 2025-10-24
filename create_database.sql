--DELETE DATABASE IF SKSNationalBankDB already exist
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SKSNationalBankDB')
BEGIN
DROP DATABASE SKSNationalBankDB;
END
GO

CREATE DATABASE SKSNationalBankDB;
GO

USE SKSNationalBankDB;
GO

-- Branch
CREATE TABLE Branch (
	branch_name VARCHAR(100) PRIMARY KEY,
	city VARCHAR(100),
	deposits DECIMAL(15, 2),
	loans DECIMAL(15, 2)
);

--Address
CREATE TABLE Address(
	address_id INT PRIMARY KEY,
	house_number INT,
	street INT,
	city VARCHAR(50),
	province VARCHAR(50),
	postal_code VARCHAR(50)
);

--Customers
CREATE TABLE Customers(
	customer_id INT PRIMARY KEY,
	address_id INT,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	customer_home_address VARCHAR(50),

	CONSTRAINT FK_CustomerAddress
	FOREIGN KEY (address_id)
	REFERENCES Address(address_id)
);

--CustomerEmployee
CREATE TABLE CustomerEmployee(
	customer_id INT,
	employee_id INT,
	position VARCHAR(50)
	PRIMARY KEY(customer_id, employee_id)
);

--Employees
CREATE TABLE Employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address_id INT,
	employee_home_address VARCHAR(200),
	start_date DATE,
	manager_id INT NULL,
	position VARCHAR (100),

	CONSTRAINT FK_Manager
	FOREIGN KEY (manager_id)
	REFERENCES Employees(employee_id),

	CONSTRAINT FK_EmployeeAddress
	FOREIGN KEY (address_id)
	REFERENCES Address(address_id)
);

--Location
CREATE TABLE Location (
	location_id INT PRIMARY KEY,
	location_type VARCHAR(100),
	branch_name VARCHAR(100),
	
	CONSTRAINT FK_LocationBranch
	FOREIGN KEY (branch_name)
	REFERENCES Branch(branch_name)
);

--Chequing Account
CREATE TABLE ChequingAccount (
	account_number INT PRIMARY KEY,
	balance DECIMAL(15, 2)
);

--Customer's Chequing Account
CREATE TABLE CustomerChequing (
	customer_id INT,
	account_number INT,
	last_access DATE,
	PRIMARY KEY (customer_id, account_number),

	CONSTRAINT FK_CustomerChequing_Customer
	FOREIGN KEY (customer_id)
	REFERENCES Customers(customer_id),

	CONSTRAINT FK_CustomerChequing_Chequing
	FOREIGN KEY (account_number)
	REFERENCES ChequingAccount(account_number)
);

--Savings Account
CREATE TABLE SavingsAccount (
	account_number INT PRIMARY KEY,
	balance DECIMAL (15, 2),
	interest_rate DECIMAL(15,2),
	last_access DATE
);

--Customer's Savings Account
CREATE TABLE CustomerSavings (
	customer_id INT,
	account_number INT,
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
	account_number INT,
	overdraft_date DATE,
	amount DECIMAL(15,2),
	check_number INT,
	PRIMARY KEY(account_number, check_number),

	CONSTRAINT FK_Overdraft_Chequing
	FOREIGN KEY (account_number)
	REFERENCES ChequingAccount(account_number)
);

--Loan
CREATE TABLE Loan (
	loan_id INT PRIMARY KEY,
	branch_name VARCHAR(100),
	loan_amount DECIMAL(15, 2),

	CONSTRAINT FK_Loan_Branch
	FOREIGN KEY (branch_name)
	REFERENCES Branch(branch_name)
);

--Customer's Loan
CREATE TABLE CustomerLoan (
	customer_id INT,
	loan_id INT,
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
	loan_id INT,
	payment_id INT,
	payment_date DATE,
	amount DECIMAL(15,2),
	PRIMARY KEY(loan_id, payment_id),

	CONSTRAINT FK_LoanPayment_Loan
	FOREIGN KEY (loan_id)
	REFERENCES Loan (loan_id)
);