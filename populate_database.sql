USE SKSNationalBankDB;
GO

--Branch
INSERT INTO Branch (branch_name, city, deposits, loans)
VALUES
('MainBranch', 'Manila', 1250000.00, 700000.00),
('MakatiBranch', 'Makati City', 1200000.00, 680000.00),
('QuezonBranch', 'Quezon City', 1180000.00, 660000.00),
('CebuBranch', 'Cebu City', 1150000.00, 640000.00),
('DavaoBranch', 'Davao City', 1100000.00, 620000.00),
('IloiloBranch', 'Iloilo City', 1080000.00, 610000.00),
('BaguioBranch', 'Baguio City', 1060000.00, 600000.00),
('BacolodBranch', 'Bacolod City', 1040000.00, 590000.00),
('CagayanBranch', 'Cagayan de Oro', 1020000.00, 580000.00),
('GeneralSantosBranch', 'General Santos City', 1000000.00, 570000.00),
('TaclobanBranch', 'Tacloban City', 980000.00, 560000.00),
('ZamboangaBranch', 'Zamboanga City', 960000.00, 550000.00),
('TaguigBranch', 'Taguig City', 940000.00, 540000.00),
('PasigBranch', 'Pasig City', 920000.00, 530000.00),
('CaviteBranch', 'Cavite City', 900000.00, 520000.00),
('BatangasBranch', 'Batangas City', 880000.00, 510000.00),
('LagunaBranch', 'Calamba City', 860000.00, 500000.00),
('PalawanBranch', 'Puerto Princesa', 840000.00, 490000.00),
('BulacanBranch', 'Malolos City', 820000.00, 480000.00),
('PampangaBranch', 'San Fernando', 800000.00, 470000.00);

--Customers
INSERT INTO Customers (customer_id, first_name, last_name, customer_home_address)
VALUES
(1, 'Juan', 'Dela Cruz', '123 Mabini St, Manila'),
(2, 'Maria', 'Santos', '456 Rizal Ave, Quezon City'),
(3, 'Jose', 'Reyes', '789 Bonifacio St, Makati City'),
(4, 'Ana', 'Garcia', '101 Maginhawa St, Quezon City'),
(5, 'Ramon', 'Lopez', '202 Katipunan Ave, Pasig City'),
(6, 'Liza', 'Mendoza', '303 P. Burgos St, Cebu City'),
(7, 'Carlo', 'Torres', '404 Lacson St, Bacolod City'),
(8, 'Angela', 'Fernandez', '505 Real St, Calamba City'),
(9, 'Mark', 'Castillo', '606 Aguinaldo Hwy, Cavite City'),
(10, 'Patricia', 'Ramos', '707 Abad Santos St, Davao City'),
(11, 'Jerome', 'Aquino', '808 Session Rd, Baguio City'),
(12, 'Christine', 'Gutierrez', '909 J.P. Laurel St, Iloilo City'),
(13, 'Nathan', 'Villanueva', '111 Osmeña Blvd, Cebu City'),
(14, 'Faith', 'Domingo', '222 Roxas Ave, Quezon City'),
(15, 'Adrian', 'Cruz', '333 Mabuhay St, Taguig City'),
(16, 'Samantha', 'Marquez', '444 Del Pilar St, Manila'),
(17, 'Gabriel', 'Navarro', '555 Quezon Ave, San Fernando'),
(18, 'Nicole', 'De Leon', '666 Panganiban Dr, Naga City'),
(19, 'Ryan', 'Flores', '777 P. Gomez St, Zamboanga City'),
(20, 'Elaine', 'Rosales', '888 P. Del Rosario St, Cagayan de Oro');

--Employees
INSERT INTO Employees (employee_id, first_name, last_name, employee_home_address, start_date, manager_id)
VALUES
(1, 'Roberto', 'Santos', '12 Ayala Ave, Makati City', '2015-06-01', NULL),
(2, 'Cynthia', 'Reyes', '34 Rizal St, Quezon City', '2018-03-15', 1),
(3, 'Patrick', 'Garcia', '56 Bonifacio St, Manila', '2020-01-20', 1),
(4, 'Angela', 'Torres', '78 Osmeña Blvd, Cebu City', '2017-09-10', 1),
(5, 'Francis', 'Lopez', '90 Mabini St, Davao City', '2019-12-05', 1),
(6, 'Janelle', 'Cruz', '101 Lacson St, Bacolod City', '2016-04-25', 2),
(7, 'Miguel', 'Domingo', '102 Panganiban Dr, Naga City', '2018-07-18', 2),
(8, 'Rowena', 'Mendoza', '103 Roxas Ave, Iloilo City', '2021-02-10', 3),
(9, 'Edgar', 'Villanueva', '104 Abad Santos St, Quezon City', '2019-08-12', 4),
(10, 'Bea', 'De Leon', '105 Session Rd, Baguio City', '2020-11-05', 5),
(11, 'Dennis', 'Aquino', '106 Gen. Luna St, Manila', '2021-01-15', 2),
(12, 'Grace', 'Marquez', '107 J.P. Laurel St, Davao City', '2021-02-20', 3),
(13, 'Lorenzo', 'Navarro', '108 Del Pilar St, Iloilo City', '2020-03-30', 4),
(14, 'Katrina', 'Ramos', '109 Legaspi St, Makati City', '2019-05-10', 5),
(15, 'Allan', 'Gutierrez', '110 Lacson St, Bacolod City', '2021-06-25', 6),
(16, 'Fiona', 'Dela Cruz', '111 Real St, Cavite City', '2022-07-01', 7),
(17, 'Victor', 'Rosales', '112 P. Gomez St, Zamboanga City', '2022-08-12', 8),
(18, 'Clarisse', 'Morales', '113 Aguinaldo Hwy, Imus City', '2020-09-15', 9),
(19, 'Nathan', 'Flores', '114 Maginhawa St, Quezon City', '2021-10-20', 10),
(20, 'Isabel', 'Fernandez', '115 P. Del Rosario St, Cebu City', '2022-11-11', 11);

--Location
INSERT INTO Location (location_id, location_type, branch_name)
VALUES
(1, 'Branch', 'MainBranch'),
(2, 'Office', 'MakatiBranch'),
(3, 'Branch', 'QuezonBranch'),
(4, 'Office', 'CebuBranch'),
(5, 'Branch', 'DavaoBranch'),
(6, 'Office', 'IloiloBranch'),
(7, 'Branch', 'BaguioBranch'),
(8, 'Office', 'BacolodBranch'),
(9, 'Branch', 'CagayanBranch'),
(10, 'Office', 'GeneralSantosBranch'),
(11, 'Office', 'MainBranch'),
(12, 'Branch', 'MakatiBranch'),
(13, 'Office', 'QuezonBranch'),
(14, 'Branch', 'CebuBranch'),
(15, 'Office', 'DavaoBranch'),
(16, 'Branch', 'TaclobanBranch'),
(17, 'Office', 'ZamboangaBranch'),
(18, 'Branch', 'TaguigBranch'),
(19, 'Office', 'PasigBranch'),
(20, 'Branch', 'CaviteBranch');

--Chequing Accounts
INSERT INTO ChequingAccount (account_number, balance)
VALUES
(1001, 50000.00),
(1002, 35000.00),
(1003, 42000.00),
(1004, 15000.00),
(1005, 28000.00),
(1006, 60000.00),
(1007, 33000.00),
(1008, 47000.00),
(1009, 52000.00),
(1010, 41000.00),
(1011, 39000.00),
(1012, 45000.00),
(1013, 38000.00),
(1014, 55000.00),
(1015, 61000.00),
(1016, 30000.00),
(1017, 36000.00),
(1018, 49000.00),
(1019, 53000.00),
(1020, 40000.00);

--Customer Chequing
INSERT INTO CustomerChequing (customer_id, account_number)
VALUES 
(1, 1001), (2, 1002), (3, 1003), (4, 1004), 
(5, 1005), (6, 1006), (7, 1007), (8, 1008),
(9, 1009), (10, 1010), (11, 1011), (12, 1012), 
(13, 1013), (14, 1014), (15, 1015), (16, 1016), 
(17, 1017), (18, 1018), (19, 1019), (20, 1020);

--Savings Account
INSERT INTO SavingsAccount (account_number, balance)
VALUES 
(2001, 150000.00), (2002, 120000.00), (2003, 135000.00), (2004, 80000.00), (2005, 95000.00),
(2006, 170000.00), (2007, 110000.00), (2008, 125000.00), (2009, 140000.00), (2010, 100000.00),
(2011, 130000.00), (2012, 115000.00), (2013, 90000.00), (2014, 160000.00), (2015, 180000.00),
(2016, 85000.00), (2017, 105000.00), (2018, 145000.00), (2019, 155000.00), (2020, 99000.00);

--Customer Savings
INSERT INTO CustomerSavings (customer_id, account_number)
VALUES 
(1, 2001), (2, 2002), (3, 2003), (4, 2004), (5, 2005),
(6, 2006), (7, 2007), (8, 2008), (9, 2009), (10, 2010),
(11, 2011), (12, 2012), (13, 2013), (14, 2014), (15, 2015),
(16, 2016), (17, 2017), (18, 2018), (19, 2019), (20, 2020);

--Overdraft
INSERT INTO Overdraft (account_number, overdraft_date, amount, check_number)
VALUES 
(1001, '2023-01-10', 5000.00, 1),
(1002, '2023-01-12', 3000.00, 1),
(1003, '2023-02-05', 4000.00, 1),
(1004, '2023-03-01', 2000.00, 1),
(1005, '2023-03-15', 3500.00, 1),
(1006, '2023-04-10', 4500.00, 1),
(1007, '2023-04-20', 3200.00, 1),
(1008, '2023-05-05', 3800.00, 1),
(1009, '2023-05-15', 4200.00, 1),
(1010, '2023-06-01', 3000.00, 1),
(1011, '2023-06-10', 3900.00, 1),
(1012, '2023-06-20', 4100.00, 1),
(1013, '2023-07-01', 3700.00, 1),
(1014, '2023-07-10', 4500.00, 1),
(1015, '2023-07-20', 5000.00, 1),
(1016, '2023-08-01', 2800.00, 1),
(1017, '2023-08-10', 3600.00, 1),
(1018, '2023-08-20', 4800.00, 1),
(1019, '2023-09-01', 5200.00, 1),
(1020, '2023-09-10', 4000.00, 1);

--Loans
INSERT INTO Loan (loan_id, branch_name, loan_amount)
VALUES
(3001, 'MainBranch', 500000.00),
(3002, 'MakatiBranch', 350000.00),
(3003, 'QuezonBranch', 420000.00),
(3004, 'CebuBranch', 150000.00),
(3005, 'DavaoBranch', 280000.00),
(3006, 'IloiloBranch', 600000.00),
(3007, 'BaguioBranch', 330000.00),
(3008, 'BacolodBranch', 470000.00),
(3009, 'CagayanBranch', 520000.00),
(3010, 'GeneralSantosBranch', 410000.00),
(3011, 'TaclobanBranch', 390000.00),
(3012, 'ZamboangaBranch', 450000.00),
(3013, 'TaguigBranch', 380000.00),
(3014, 'PasigBranch', 550000.00),
(3015, 'CaviteBranch', 610000.00),
(3016, 'MainBranch', 300000.00),
(3017, 'MakatiBranch', 360000.00),
(3018, 'QuezonBranch', 490000.00),
(3019, 'CebuBranch', 530000.00),
(3020, 'DavaoBranch', 400000.00);

--Customer Loans
INSERT INTO CustomerLoan (customer_id, loan_id)
VALUES 
(1, 3001), (2, 3002), (3, 3003), (4, 3004),
(5, 3005), (6, 3006), (7, 3007), (8, 3008),
(9, 3009), (10, 3010), (11, 3011), (12, 3012),
(13, 3013), (14, 3014), (15, 3015), (16, 3016), 
(17, 3017), (18, 3018), (19, 3019), (20, 3020);

--Loan Payments
INSERT INTO LoanPayment (loan_id, payment_id, payment_date, amount)
VALUES
(3001, 1, '2023-01-15', 50000.00),
(3002, 1, '2023-01-20', 35000.00),
(3003, 1, '2023-01-25', 42000.00),
(3004, 1, '2023-02-01', 15000.00),
(3005, 1, '2023-02-10', 28000.00),
(3006, 1, '2023-02-15', 60000.00),
(3007, 1, '2023-02-20', 33000.00),
(3008, 1, '2023-03-01', 47000.00),
(3009, 1, '2023-03-05', 52000.00),
(3010, 1, '2023-03-10', 41000.00),
(3011, 1, '2023-03-15', 39000.00),
(3012, 1, '2023-03-20', 45000.00),
(3013, 1, '2023-03-25', 38000.00),
(3014, 1, '2023-04-01', 55000.00),
(3015, 1, '2023-04-05', 61000.00),
(3016, 1, '2023-04-10', 30000.00),
(3017, 1, '2023-04-15', 36000.00),
(3018, 1, '2023-04-20', 49000.00),
(3019, 1, '2023-04-25', 53000.00),
(3020, 1, '2023-05-01', 40000.00);

SELECT * FROM Branch;
SELECT * FROM ChequingAccount;
SELECT * FROM CustomerChequing;
SELECT * FROM CustomerLoan;
SELECT * FROM Customers;
SELECT * FROM CustomerSavings;
SELECT * FROM Employees;
SELECT * FROM Loan;
SELECT * FROM LoanPayment;
SELECT * FROM Location;
SELECT * FROM Overdraft;
SELECT * FROM SavingsAccount;


