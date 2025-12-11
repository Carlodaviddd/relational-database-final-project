--GROUP MEMBER NAMES:
--Joy Francisco
--Carlo David
--Ivan Herrera

--Switch to newly created database
USE SKSNationalBankDB;
GO

--------------1. Add JSON colomn--------------
ALTER TABLE Customers
ADD	customer_details NVARCHAR(MAX);

--Sample JSON data
UPDATE Customers
SET customer_details = JSON_QUERY('{
	"phone_number": "0912-345-6789",
	"email": "juan_delacruz@sample.com",
	"preferred_contact": "email"
	}')
WHERE customer_id = 1;

UPDATE Customers
SET customer_details = JSON_QUERY('{
	"phone_number": "0913-214-5215",
	"email": "maria_santos@sample.com",
	"preferred_contact": "sms"
	}')
WHERE customer_id = 2;

UPDATE Customers
SET customer_details = JSON_QUERY('{
	"phone_number": "0922-555-1111",
	"email": "jose_reyes@sample.com",
	"preferred_contact": "email"
	}')
WHERE customer_id = 3;

SELECT * FROM Customers




--------------2. Spatial Column to Branch--------------
ALTER TABLE Branch
ADD spatial_location GEOGRAPHY;

--Manila Branch
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(14.5995, 120.9842, 4326)
WHERE city = 'Manila';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Manila';

--Quezon City Branch
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(14.6760, 121.0437, 4326)
WHERE city = 'Quezon City';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Quezon City';

--Makati Branch
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(14.5547, 121.0244, 4326)
WHERE city = 'Makati';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Makati';

--Cebu City
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(10.3157, 123.8854, 4326)
WHERE city = 'Cebu City';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Cebu City';

--Davao City
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(7.1907, 125.4553, 4326)
WHERE city = 'Davao City';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Davao City';

--Pasig
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(14.5546, 121.0244, 4326)
WHERE city = 'Pasig';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Pasig';

--Taguig
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(14.5176, 121.0509, 4326)
WHERE city = 'Taguig';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Taguig';

--Baguio
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(16.4023, 120.5960, 4326)
WHERE city = 'Baguio';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Baguio';

--Iloilo
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(16.4023, 120.5960, 4326)
WHERE city = 'Iloilo';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Iloilo';

--Cagayan De Oro
UPDATE Branch
SET spatial_location = GEOGRAPHY::Point(8.4542, 124.6319, 4326)
WHERE city = 'Cagayan De Oro';

--Get readable text
SELECT
    spatial_location.STAsText() AS LongLat
FROM Branch
WHERE city = 'Cagayan De Oro';

SELECT * FROM Branch;