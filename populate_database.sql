USE SKSNationalBankDB;
GO

--Branch
INSERT INTO Branch (branch_name, city, deposits, loans)
VALUES
('Manila Central', 'Manila', 5200000.00, 2100000.00),
('Quezon City Main', 'Quezon City', 4600000.00, 1800000.00),
('Cebu Downtown', 'Cebu City', 3900000.00, 1500000.00),
('Davao Central', 'Davao City', 3700000.00, 1600000.00),
('Baguio Highlands', 'Baguio City', 2100000.00, 900000.00),
('Makati Financial', 'Makati City', 4800000.00, 2000000.00),
('Iloilo Central', 'Iloilo City', 2500000.00, 1100000.00),
('Cagayan Gateway', 'Cagayan de Oro', 2700000.00, 1200000.00),
('Bacolod Metro', 'Bacolod City', 2400000.00, 1000000.00),
('Zamboanga West', 'Zamboanga City', 1900000.00, 800000.00),
('Taguig Uptown', 'Taguig City', 3100000.00, 1300000.00),
('Pasig Riverfront', 'Pasig City', 2800000.00, 1200000.00),
('Cavite South', 'Cavite City', 2000000.00, 900000.00),
('Laguna East', 'Calamba City', 2200000.00, 950000.00),
('Naga Center', 'Naga City', 1800000.00, 750000.00),
('San Fernando Hub', 'San Fernando', 2100000.00, 900000.00),
('Tarlac North', 'Tarlac City', 1900000.00, 800000.00),
('Batangas Bay', 'Batangas City', 2300000.00, 950000.00),
('General Santos', 'General Santos City', 2000000.00, 870000.00),
('Dumaguete Branch', 'Dumaguete City', 1700000.00, 700000.00);

--Address
INSERT INTO Address (address_id, house_number, street, city, province, postal_code)
VALUES
(1, 12, 1, 'Manila', 'Metro Manila', '1000'),
(2, 45, 2, 'Quezon City', 'Metro Manila', '1100'),
(3, 78, 3, 'Cebu City', 'Cebu', '6000'),
(4, 90, 4, 'Davao City', 'Davao del Sur', '8000'),
(5, 15, 5, 'Baguio City', 'Benguet', '2600'),
(6, 18, 6, 'Makati City', 'Metro Manila', '1200'),
(7, 22, 7, 'Iloilo City', 'Iloilo', '5000'),
(8, 31, 8, 'Cagayan de Oro', 'Misamis Oriental', '9000'),
(9, 41, 9, 'Bacolod City', 'Negros Occidental', '6100'),
(10, 55, 10, 'Zamboanga City', 'Zamboanga del Sur', '7000'),
(11, 60, 11, 'Taguig City', 'Metro Manila', '1630'),
(12, 65, 12, 'Pasig City', 'Metro Manila', '1600'),
(13, 70, 13, 'Cavite City', 'Cavite', '4100'),
(14, 72, 14, 'Calamba City', 'Laguna', '4027'),
(15, 75, 15, 'Naga City', 'Camarines Sur', '4400'),
(16, 78, 16, 'San Fernando', 'Pampanga', '2000'),
(17, 81, 17, 'Tarlac City', 'Tarlac', '2300'),
(18, 85, 18, 'Batangas City', 'Batangas', '4200'),
(19, 88, 19, 'General Santos City', 'South Cotabato', '9500'),
(20, 90, 20, 'Dumaguete City', 'Negros Oriental', '6200');

--Employees
INSERT INTO Employees (employee_id, first_name, last_name, address_id, employee_home_address, start_date, manager_id, position)
VALUES
(1, 'Ramon', 'Dela Cruz', 1, 'Manila', '2015-06-01', NULL, 'Branch Manager'),
(2, 'Maria', 'Santos', 2, 'Quezon City', '2018-03-15', 1, 'Loan Officer'),
(3, 'Jose', 'Reyes', 3, 'Cebu City', '2020-01-20', 1, 'Personal Banker'),
(4, 'Liza', 'Mendoza', 4, 'Davao City', '2017-09-10', 1, 'Teller'),
(5, 'Carlo', 'Torres', 5, 'Baguio City', '2019-12-05', 1, 'Account Officer'),
(6, 'Angela', 'Fernandez', 6, 'Makati City', '2016-04-25', 2, 'Loan Officer'),
(7, 'Mark', 'Castillo', 7, 'Iloilo City', '2018-07-18', 2, 'Teller'),
(8, 'Patricia', 'Ramos', 8, 'Cagayan de Oro', '2021-02-10', 3, 'Account Officer'),
(9, 'Jerome', 'Aquino', 9, 'Bacolod City', '2019-08-12', 4, 'Teller'),
(10, 'Christine', 'Gutierrez', 10, 'Zamboanga City', '2020-11-05', 5, 'Loan Officer'),
(11, 'Nathan', 'Villanueva', 11, 'Taguig City', '2018-04-11', 5, 'Branch Clerk'),
(12, 'Faith', 'Domingo', 12, 'Pasig City', '2019-03-09', 5, 'Account Officer'),
(13, 'Adrian', 'Cruz', 13, 'Cavite City', '2020-07-14', 6, 'Personal Banker'),
(14, 'Samantha', 'Marquez', 14, 'Calamba City', '2021-08-20', 6, 'Loan Officer'),
(15, 'Gabriel', 'Navarro', 15, 'Naga City', '2022-02-28', 7, 'Teller'),
(16, 'Nicole', 'De Leon', 16, 'San Fernando', '2022-09-05', 7, 'Account Officer'),
(17, 'Ryan', 'Flores', 17, 'Tarlac City', '2021-12-15', 8, 'Branch Clerk'),
(18, 'Elaine', 'Rosales', 18, 'Batangas City', '2022-06-21', 8, 'Loan Officer'),
(19, 'Miguel', 'Lopez', 19, 'General Santos City', '2023-01-10', 9, 'Personal Banker'),
(20, 'Jessica', 'Bautista', 20, 'Dumaguete City', '2023-03-05', 9, 'Teller');

--Customers
INSERT INTO Customers (customer_id, address_id, first_name, last_name, customer_home_address)
VALUES
(1, 1, 'Juan', 'Dela Cruz', '123 Mabini St, Manila'),
(2, 2, 'Maria', 'Santos', '456 Rizal Ave, Quezon City'),
(3, 3, 'Jose', 'Reyes', '789 Bonifacio St, Makati'),
(4, 4, 'Ana', 'Garcia', '101 Maginhawa St, Quezon City'),
(5, 5, 'Ramon', 'Lopez', '202 Katipunan Ave, Pasig City'),
(6, 6, 'Liza', 'Mendoza', '303 P. Burgos St, Cebu City'),
(7, 7, 'Carlo', 'Torres', '404 Lacson St, Bacolod City'),
(8, 8, 'Angela', 'Fernandez', '505 Real St, Calamba City'),
(9, 9, 'Mark', 'Castillo', '606 Aguinaldo Hwy, Cavite City'),
(10, 10, 'Patricia', 'Ramos', '707 Abad Santos St, Davao City'),
(11, 11, 'Jerome', 'Aquino', '808 Session Rd, Baguio City'),
(12, 12, 'Christine', 'Gutierrez', '909 J.P. Laurel St, Iloilo City'),
(13, 13, 'Nathan', 'Villanueva', '111 Osmeña Blvd, Cebu City'),
(14, 14, 'Faith', 'Domingo', '222 Roxas Ave, Quezon City'),
(15, 15, 'Adrian', 'Cruz', '333 Mabuhay St, Taguig City'),
(16, 16, 'Samantha', 'Marquez', '444 Del Pilar St, Manila'),
(17, 17, 'Gabriel', 'Navarro', '555 Quezon Ave, San Fernando'),
(18, 18, 'Nicole', 'De Leon', '666 Panganiban Dr, Naga City'),
(19, 19, 'Ryan', 'Flores', '777 P. Gomez St, Zamboanga City'),
(20, 20, 'Elaine', 'Rosales', '888 P. Del Rosario St, Cagayan de Oro');

--Customer Employee
INSERT INTO CustomerEmployee (customer_id, employee_id, position)
VALUES
(1, 2, 'Personal Banker'),
(2, 3, 'Loan Officer'),
(3, 6, 'Teller'),
(4, 5, 'Account Officer'),
(5, 4, 'Loan Officer'),
(6, 8, 'Personal Banker'),
(7, 9, 'Branch Clerk'),
(8, 10, 'Loan Officer'),
(9, 11, 'Personal Banker'),
(10, 12, 'Loan Officer'),
(11, 13, 'Branch Clerk'),
(12, 14, 'Account Officer'),
(13, 15, 'Personal Banker'),
(14, 16, 'Teller'),
(15, 17, 'Loan Officer'),
(16, 18, 'Personal Banker'),
(17, 19, 'Branch Clerk'),
(18, 20, 'Loan Officer'),
(19, 7, 'Teller'),
(20, 5, 'Account Officer');

--Location
INSERT INTO Location (location_id, location_type, branch_name)
VALUES
(1, 'Branch', 'Manila Central'),
(2, 'Office', 'Quezon City Main'),
(3, 'Branch', 'Cebu Downtown'),
(4, 'Office', 'Davao Central'),
(5, 'Branch', 'Baguio Highlands'),
(6, 'Office', 'Makati Financial'),
(7, 'Branch', 'Iloilo Central'),
(8, 'Office', 'Cagayan Gateway'),
(9, 'Branch', 'Bacolod Metro'),
(10, 'Branch', 'Zamboanga West'),
(11, 'Office', 'Taguig Uptown'),
(12, 'Branch', 'Pasig Riverfront'),
(13, 'Office', 'Cavite South'),
(14, 'Branch', 'Laguna East'),
(15, 'Office', 'Naga Center'),
(16, 'Branch', 'San Fernando Hub'),
(17, 'Office', 'Tarlac North'),
(18, 'Branch', 'Batangas Bay'),
(19, 'Office', 'General Santos'),
(20, 'Branch', 'Dumaguete Branch');

--Chequing Account
INSERT INTO ChequingAccount (account_number, balance)
VALUES
(1, 52000.50),
(2, 43000.00),
(3, 15000.75),
(4, 68000.20),
(5, 75000.00),
(6, 87000.00),
(7, 91000.50),
(8, 24000.30),
(9, 56000.10),
(10, 33000.80),
(11, 12000.00),
(12, 98000.00),
(13, 64000.20),
(14, 75000.40),
(15, 87000.10),
(16, 15000.30),
(17, 52000.80),
(18, 92000.00),
(19, 43000.20),
(20, 65000.00);

--Customer Chequing
INSERT INTO CustomerChequing (customer_id, account_number, last_access)
VALUES
(1, 1, '2025-01-15'),
(2, 2, '2025-01-12'),
(3, 3, '2025-01-10'),
(4, 4, '2025-01-08'),
(5, 5, '2025-01-20'),
(6, 6, '2025-01-18'),
(7, 7, '2025-01-05'),
(8, 8, '2025-01-22'),
(9, 9, '2025-01-11'),
(10, 10, '2025-01-25'),
(11, 11, '2025-01-15'),
(12, 12, '2025-01-19'),
(13, 13, '2025-01-21'),
(14, 14, '2025-01-07'),
(15, 15, '2025-01-09'),
(16, 16, '2025-01-10'),
(17, 17, '2025-01-20'),
(18, 18, '2025-01-18'),
(19, 19, '2025-01-17'),
(20, 20, '2025-01-16');

--Savings Account
INSERT INTO SavingsAccount (account_number, balance, interest_rate, last_access)
VALUES
(1, 50000.00, 1.2, '2025-01-05'),
(2, 20000.00, 0.9, '2025-01-06'),
(3, 30000.00, 1.0, '2025-01-07'),
(4, 40000.00, 1.1, '2025-01-08'),
(5, 25000.00, 1.3, '2025-01-09'),
(6, 35000.00, 1.2, '2025-01-10'),
(7, 27000.00, 1.1, '2025-01-11'),
(8, 60000.00, 1.5, '2025-01-12'),
(9, 15000.00, 0.8, '2025-01-13'),
(10, 5000.00, 0.7, '2025-01-14'),
(11, 47000.00, 1.0, '2025-01-15'),
(12, 33000.00, 1.2, '2025-01-16'),
(13, 90000.00, 1.5, '2025-01-17'),
(14, 75000.00, 1.4, '2025-01-18'),
(15, 66000.00, 1.2, '2025-01-19'),
(16, 24000.00, 1.0, '2025-01-20'),
(17, 31000.00, 0.9, '2025-01-21'),
(18, 88000.00, 1.4, '2025-01-22'),
(19, 56000.00, 1.3, '2025-01-23'),
(20, 77000.00, 1.5, '2025-01-24');

--Customer Savings
INSERT INTO CustomerSavings (customer_id, account_number)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

--Overdraft
INSERT INTO Overdraft (account_number, overdraft_date, amount, check_number)
VALUES
(1,  '2025-01-05',  500.00, 1001),
(2,  '2025-01-06',  300.00, 1002),
(3,  '2025-01-07',  450.00, 1003),
(4,  '2025-01-08',  600.00, 1004),
(5,  '2025-01-09',  250.00, 1005),
(6,  '2025-01-10',  800.00, 1006),
(7,  '2025-01-11',  700.00, 1007),
(8,  '2025-01-12',  550.00, 1008),
(9,  '2025-01-13',  620.00, 1009),
(10, '2025-01-14',  480.00, 1010),
(11, '2025-01-15',  530.00, 1011),
(12, '2025-01-16',  410.00, 1012),
(13, '2025-01-17',  470.00, 1013),
(14, '2025-01-18',  690.00, 1014),
(15, '2025-01-19',  720.00, 1015),
(16, '2025-01-20',  340.00, 1016),
(17, '2025-01-21',  580.00, 1017),
(18, '2025-01-22',  760.00, 1018),
(19, '2025-01-23',  495.00, 1019),
(20, '2025-01-24',  615.00, 1020);

--Loan
INSERT INTO Loan (loan_id, branch_name, loan_amount)
VALUES
(3001, 'Manila Central',   250000.00),
(3002, 'Quezon City Main', 180000.00),
(3003, 'Cebu Downtown',    220000.00),
(3004, 'Davao Central',    150000.00),
(3005, 'Baguio Highlands', 120000.00),
(3006, 'Makati Financial', 300000.00),
(3007, 'Iloilo Central',   140000.00),
(3008, 'Cagayan Gateway',  160000.00),
(3009, 'Bacolod Metro',    130000.00),
(3010, 'Zamboanga West',   175000.00),
(3011, 'Taguig Uptown',    210000.00),
(3012, 'Pasig Riverfront', 195000.00),
(3013, 'Cavite South',     115000.00),
(3014, 'Laguna East',      125000.00),
(3015, 'Naga Center',      110000.00),
(3016, 'San Fernando Hub', 145000.00),
(3017, 'Tarlac North',     100000.00),
(3018, 'Batangas Bay',     155000.00),
(3019, 'General Santos',   135000.00),
(3020, 'Dumaguete Branch',  95000.00);

--CustomerLoan
INSERT INTO CustomerLoan (customer_id, loan_id)
VALUES
(1, 3001),
(2, 3002),
(3, 3003),
(4, 3004),
(5, 3005),
(6, 3006),
(7, 3007),
(8, 3008),
(9, 3009),
(10, 3010),
(11, 3011),
(12, 3012),
(13, 3013),
(14, 3014),
(15, 3015),
(16, 3016),
(17, 3017),
(18, 3018),
(19, 3019),
(20, 3020);

--Loan Payment
INSERT INTO LoanPayment (loan_id, payment_id, payment_date, amount)
VALUES
(3001, 1, '2025-02-01', 25000.00),
(3002, 1, '2025-02-03', 18000.00),
(3003, 1, '2025-02-05', 22000.00),
(3004, 1, '2025-02-07', 15000.00),
(3005, 1, '2025-02-09', 12000.00),
(3006, 1, '2025-02-11', 30000.00),
(3007, 1, '2025-02-13', 14000.00),
(3008, 1, '2025-02-15', 16000.00),
(3009, 1, '2025-02-17', 13000.00),
(3010, 1, '2025-02-19', 17500.00),
(3011, 1, '2025-02-21', 21000.00),
(3012, 1, '2025-02-23', 19500.00),
(3013, 1, '2025-02-25', 11500.00),
(3014, 1, '2025-02-27', 12500.00),
(3015, 1, '2025-03-01', 11000.00),
(3016, 1, '2025-03-03', 14500.00),
(3017, 1, '2025-03-05', 10000.00),
(3018, 1, '2025-03-07', 15500.00),
(3019, 1, '2025-03-09', 13500.00),
(3020, 1, '2025-03-11',  9500.00);