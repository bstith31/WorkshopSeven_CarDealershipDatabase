-- The Process of adding or dropping the dealership database

DROP DATABASE IF EXISTS dealership_db;
CREATE DATABASE IF NOT EXISTS dealership_db;
USE dealership_db;

-- The Process of creating the necessary tables

CREATE TABLE dealerships (

dealership_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
address VARCHAR(150),
phone_Number VARCHAR(15)

);

CREATE TABLE vehicles (

vin VARCHAR(17) PRIMARY KEY NOT NULL,
make VARCHAR(100) NOT NULL,
model VARCHAR(100) NOT NULL,
year INT NOT NULL,
color VARCHAR(25)

);

CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    vin VARCHAR(17) NOT NULL,
    PRIMARY KEY (dealership_id, vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE CASCADE
);

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_name VARCHAR(150) NOT NULL,
    vin VARCHAR(17),
    contract_date DATE NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE SET NULL
);

CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lessee_name VARCHAR(150),
    vin VARCHAR(17),
	lease_start_date DATE NOT NULL,
    lease_end_date DATE NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE SET NULL
);

-- Populating database tables (Test)

INSERT INTO dealerships (name, address, phone_number) VALUES
('Auto World', '123 Main St, Springfield, IL', '555-1234'),
('Car Emporium', '456 Elm St, Shelbyville, IL', '555-5678'),
('Motor City', '789 Oak St, Capital City, IL', '555-8765');

INSERT INTO vehicles (vin, make, model, year, color) VALUES
('1HGCM82633A123456', 'Honda', 'Civic', 2022, 'Blue'),
('2HGCM82633A123457', 'Toyota', 'Corolla', 2021, 'Red'),
('3HGCM82633A123458', 'Ford', 'Mustang', 2020, 'Black'),
('4HGCM82633A123459', 'Chevrolet', 'Camaro', 2019, 'Black'),
('5HGCM82633A123460', 'BMW', 'X5', 2023, 'White');

INSERT INTO inventory (dealership_id, vin) VALUES
(1, '1HGCM82633A123456'),
(1, '2HGCM82633A123457'),
(2, '3HGCM82633A123458'),
(2, '4HGCM82633A123459'),
(3, '5HGCM82633A123460');

INSERT INTO sales_contracts (buyer_name, vin, contract_date) VALUES
('John Doe', '1HGCM82633A123456', '2023-05-01'),
('Jane Smith', '2HGCM82633A123457', '2023-06-15'),
('Alice Johnson', '3HGCM82633A123458', '2023-07-20');

INSERT INTO lease_contracts (lessee_name, vin, lease_start_date, lease_end_date) VALUES
('Bob Brown', '4HGCM82633A123459', '2023-01-01', '2025-01-01'),
('Charlie Davis', '5HGCM82633A123460', '2023-03-01', '2026-03-01');


