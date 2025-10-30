--Switch to newly created database
USE SKSNationalBankDB;
GO

-- Populate Branch
INSERT INTO Branch (branch_name, city, deposits, loans)
VALUES
('Branch1', 'Manila', 1000000, 500000),
('Branch2', 'Quezon City', 1200000, 600000),
('Branch3', 'Makati', 1500000, 700000),
('Branch4', 'Cebu City', 900000, 400000),
('Branch5', 'Davao City', 1100000, 550000),
('Branch6', 'Pasig', 950000, 480000),
('Branch7', 'Taguig', 1250000, 650000),
('Branch8', 'Baguio', 800000, 350000),
('Branch9', 'Iloilo', 850000, 370000),
('Branch10', 'Cagayan de Oro', 900000, 400000),
('Branch11', 'Batangas', 780000, 320000),
('Branch12', 'Bacolod', 770000, 310000),
('Branch13', 'Zamboanga', 860000, 390000),
('Branch14', 'Naga', 740000, 300000),
('Branch15', 'Tagbilaran', 720000, 290000),
('Branch16', 'Ormoc', 730000, 295000),
('Branch17', 'General Santos', 810000, 360000),
('Branch18', 'San Fernando', 790000, 330000),
('Branch19', 'Lipa', 760000, 310000),
('Branch20', 'Legazpi', 750000, 305000);

-- Populate Address
INSERT INTO Address (house_number, street, city, province, postal_code)
VALUES
(123, 'Mabini', 'Manila', 'Metro Manila', '1000'),
(456, 'Rizal', 'Quezon City', 'Metro Manila', '1100'),
(789, 'Bonifacio', 'Makati', 'Metro Manila', '1200'),
(101, 'Maginhawa', 'Quezon City', 'Metro Manila', '1101'),
(202, 'Katipunan', 'Pasig', 'Metro Manila', '1600'),
(303, 'Burgos', 'Cebu City', 'Cebu', '6000'),
(404, 'Lacson', 'Bacolod', 'Negros Occidental', '6100'),
(505, 'Real', 'Calamba', 'Laguna', '4027'),
(606, 'Aguinaldo', 'Cavite City', 'Cavite', '4100'),
(707, 'Abad Santos', 'Davao City', 'Davao del Sur', '8000'),
(808, 'Session Rd', 'Baguio', 'Benguet', '2600'),
(909, 'Laurel', 'Iloilo City', 'Iloilo', '5000'),
(111, 'Osmeña', 'Cebu City', 'Cebu', '6001'),
(222, 'Roxas', 'Quezon City', 'Metro Manila', '1102'),
(333, 'Mabuhay', 'Taguig', 'Metro Manila', '1630'),
(444, 'Del Pilar', 'Manila', 'Metro Manila', '1001'),
(555, 'Quezon', 'San Fernando', 'Pampanga', '2000'),
(666, 'Panganiban', 'Naga', 'Camarines Sur', '4400'),
(777, 'Gomez', 'Zamboanga', 'Zamboanga del Sur', '7000'),
(888, 'Del Rosario', 'Cagayan de Oro', 'Misamis Oriental', '9000');

-- Populate Customers
INSERT INTO Customers (address_id, first_name, last_name)
VALUES
(1, 'Juan', 'Dela Cruz'),
(2, 'Maria', 'Santos'),
(3, 'Jose', 'Reyes'),
(4, 'Ana', 'Garcia'),
(5, 'Ramon', 'Lopez'),
(6, 'Liza', 'Mendoza'),
(7, 'Carlo', 'Torres'),
(8, 'Angela', 'Fernandez'),
(9, 'Mark', 'Castillo'),
(10, 'Patricia', 'Ramos'),
(11, 'Jerome', 'Aquino'),
(12, 'Christine', 'Gutierrez'),
(13, 'Nathan', 'Villanueva'),
(14, 'Faith', 'Domingo'),
(15, 'Adrian', 'Cruz'),
(16, 'Samantha', 'Marquez'),
(17, 'Gabriel', 'Navarro'),
(18, 'Nicole', 'De Leon'),
(19, 'Ryan', 'Flores'),
(20, 'Elaine', 'Rosales');

-- Populate Employees
INSERT INTO Employees (address_id, manager_id, first_name, last_name, start_date, position)
VALUES
(1, NULL, 'Carlos', 'Santiago', '2015-06-01', 'Branch Manager'),
(2, 1, 'Maria', 'Reyes', '2016-03-15', 'Loan Officer'),
(3, 1, 'Luis', 'Garcia', '2017-08-10', 'Personal Banker'),
(4, 1, 'Angela', 'Torres', '2018-01-20', 'Loan Officer'),
(5, 1, 'Ramon', 'Dela Cruz', '2019-05-25', 'Personal Banker'),
(6, 2, 'Liza', 'Santos', '2020-02-11', 'Loan Officer'),
(7, 2, 'Jerome', 'Castillo', '2021-07-07', 'Personal Banker'),
(8, 3, 'Patricia', 'Mendoza', '2022-03-30', 'Loan Officer'),
(9, 3, 'Carlo', 'Ramos', '2022-06-15', 'Personal Banker'),
(10, 4, 'Nicole', 'Flores', '2022-08-20', 'Loan Officer'),
(11, 5, 'Mark', 'Navarro', '2022-10-10', 'Personal Banker'),
(12, 6, 'Christine', 'De Leon', '2022-12-05', 'Loan Officer'),
(13, 7, 'Juan', 'Lopez', '2023-01-18', 'Personal Banker'),
(14, 8, 'Faith', 'Villanueva', '2023-03-22', 'Loan Officer'),
(15, 9, 'Gabriel', 'Garcia', '2023-04-30', 'Personal Banker'),
(16, 10, 'Samantha', 'Reyes', '2023-06-11', 'Loan Officer'),
(17, 11, 'Ramon', 'Torres', '2023-07-19', 'Personal Banker'),
(18, 12, 'Angela', 'Santiago', '2023-08-05', 'Loan Officer'),
(19, 13, 'Luis', 'Dela Cruz', '2023-09-12', 'Personal Banker'),
(20, 14, 'Maria', 'Lopez', '2023-10-01', 'Loan Officer');

-- Populate CustomerEmployee
INSERT INTO CustomerEmployee (customer_id, employee_id, position)
VALUES
(1, 2, 'Personal Banker'),
(2, 3, 'Loan Officer'),
(3, 4, 'Personal Banker'),
(4, 5, 'Loan Officer'),
(5, 6, 'Personal Banker'),
(6, 7, 'Loan Officer'),
(7, 8, 'Personal Banker'),
(8, 9, 'Loan Officer'),
(9, 10, 'Personal Banker'),
(10, 11, 'Loan Officer'),
(11, 12, 'Personal Banker'),
(12, 13, 'Loan Officer'),
(13, 14, 'Personal Banker'),
(14, 15, 'Loan Officer'),
(15, 16, 'Personal Banker'),
(16, 17, 'Loan Officer'),
(17, 18, 'Personal Banker'),
(18, 19, 'Loan Officer'),
(19, 20, 'Personal Banker')

-- Populate Location
INSERT INTO Location (location_type, branch_id)
VALUES
('Branch', 1),
('Branch', 2),
('Branch', 3),
('Branch', 4),
('Branch', 5),
('Branch', 6),
('Branch', 7),
('Branch', 8),
('Branch', 9),
('Branch', 10),
('Branch', 11),
('Branch', 12),
('Branch', 13),
('Branch', 14),
('Branch', 15),
('Office', NULL),
('Office', NULL),
('Office', NULL),
('Office', NULL),
('Office', NULL);

-- Populate ChequingAccount
INSERT INTO ChequingAccount (balance)
VALUES
(1000),
(1500),
(2000),
(2500),
(3000),
(3500),
(4000),
(4500),
(5000),
(5500),
(6000),
(6500),
(7000),
(7500),
(8000),
(8500),
(9000),
(9500),
(10000),
(10500);

-- Populate CustomerChequing
INSERT INTO CustomerChequing (customer_id, account_number, last_access)
VALUES
(1, '0001', '2023-10-01'),
(2, '0002', '2023-10-02'),
(3, '0003', '2023-10-03'),
(4, '0004', '2023-10-04'),
(5, '0005', '2023-10-05'),
(6, '0006', '2023-10-06'),
(7, '0007', '2023-10-07'),
(8, '0008', '2023-10-08'),
(9, '0009', '2023-10-09'),
(10, '0010', '2023-10-10'),
(11, '0011', '2023-10-11'),
(12, '0012', '2023-10-12'),
(13, '0013', '2023-10-13'),
(14, '0014', '2023-10-14'),
(15, '0015', '2023-10-15'),
(16, '0016', '2023-10-16'),
(17, '0017', '2023-10-17'),
(18, '0018', '2023-10-18'),
(19, '0019', '2023-10-19'),
(20, '0020', '2023-10-20');

-- Populate SavingsAccount
INSERT INTO SavingsAccount (balance, interest_rate, last_access)
VALUES
(5000, 1.5, '2023-10-01'),
(6000, 1.5, '2023-10-02'),
(7000, 1.5, '2023-10-03'),
(8000, 1.5, '2023-10-04'),
(9000, 1.5, '2023-10-05'),
(10000, 1.5, '2023-10-06'),
(11000, 1.5, '2023-10-07'),
(12000, 1.5, '2023-10-08'),
(13000, 1.5, '2023-10-09'),
(14000, 1.5, '2023-10-10'),
(15000, 1.5, '2023-10-11'),
(16000, 1.5, '2023-10-12'),
(17000, 1.5, '2023-10-13'),
(18000, 1.5, '2023-10-14'),
(19000, 1.5, '2023-10-15'),
(20000, 1.5, '2023-10-16'),
(21000, 1.5, '2023-10-17'),
(22000, 1.5, '2023-10-18'),
(23000, 1.5, '2023-10-19'),
(24000, 1.5, '2023-10-20');

-- Populate CustomerSavings
INSERT INTO CustomerSavings (customer_id, account_number)
VALUES
(1, '0001'),
(2, '0002'),
(3, '0003'),
(4, '0004'),
(5, '0005'),
(6, '0006'),
(7, '0007'),
(8, '0008'),
(9, '0009'),
(10, '0010'),
(11, '0011'),
(12, '0012'),
(13, '0013'),
(14, '0014'),
(15, '0015'),
(16, '0016'),
(17, '0017'),
(18, '0018'),
(19, '0019'),
(20, '0020');

-- Populate Overdraft
INSERT INTO Overdraft (account_number, overdraft_date, amount)
VALUES
('0001', '2023-10-05', 200),
('0002', '2023-10-06', 300),
('0003', '2023-10-07', 400),
('0004', '2023-10-08', 500),
('0005', '2023-10-09', 600),
('0006', '2023-10-10', 700),
('0007', '2023-10-11', 800),
('0008', '2023-10-12', 900),
('0009', '2023-10-13', 1000),
('0010', '2023-10-14', 1100),
('0011', '2023-10-15', 1200),
('0012', '2023-10-16', 1300),
('0013', '2023-10-17', 1400),
('0014', '2023-10-18', 1500),
('0015', '2023-10-19', 1600),
('0016', '2023-10-20', 1700),
('0017', '2023-10-21', 1800),
('0018', '2023-10-22', 1900),
('0019', '2023-10-23', 2000),
('0020', '2023-10-24', 2100);

-- Populate Loan
INSERT INTO Loan (loan_amount, branch_id)
VALUES
(100000, 1),
(120000, 2),
(140000, 3),
(160000, 4),
(180000, 5),
(200000, 6),
(220000, 7),
(240000, 8),
(260000, 9),
(280000, 10),
(300000, 11),
(320000, 12),
(340000, 13),
(360000, 14),
(380000, 15),
(400000, 16),
(420000, 17),
(440000, 18),
(460000, 19),
(480000, 20);

-- Populate CustomerLoan
INSERT INTO CustomerLoan (customer_id, loan_id)
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

-- Populate LoanPayment
INSERT INTO LoanPayment (loan_id, payment_id, payment_date, amount)
VALUES
(1, 1, '2023-10-05', 5000),
(2, 1, '2023-10-06', 6000),
(3, 1, '2023-10-07', 7000),
(4, 1, '2023-10-08', 8000),
(5, 1, '2023-10-09', 9000),
(6, 1, '2023-10-10', 10000),
(7, 1, '2023-10-11', 11000),
(8, 1, '2023-10-12', 12000),
(9, 1, '2023-10-13', 13000),
(10, 1, '2023-10-14', 14000),
(11, 1, '2023-10-15', 15000),
(12, 1, '2023-10-16', 16000),
(13, 1, '2023-10-17', 17000),
(14, 1, '2023-10-18', 18000),
(15, 1, '2023-10-19', 19000),
(16, 1, '2023-10-20', 20000),
(17, 1, '2023-10-21', 21000),
(18, 1, '2023-10-22', 22000),
(19, 1, '2023-10-23', 23000),
(20, 1, '2023-10-24', 24000);
