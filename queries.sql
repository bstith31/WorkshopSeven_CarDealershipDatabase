-- 1. Get all dealerships:

SELECT 
    *
FROM
    dealerships;

-- 2. Find all vehicles for a specific dealership:

SELECT 
    v.*, d.*
FROM
    vehicles v
        JOIN
    inventory i ON v.vin = i.vin
        JOIN
    dealerships d ON i.dealership_id = d.dealership_id
WHERE
    i.dealership_id = '1';
    
-- 3. Find a car by VIN:

SELECT 
    *
FROM
    vehicles
WHERE
    vin = '1HGCM82633A123456';
    
-- 4. Find the dealership where a certain car is located by VIN:

SELECT 
    d.*
FROM
    dealerships d
        JOIN
    inventory i ON d.dealership_id = i.dealership_id
WHERE
    i.vin = '1HGCM82633A123456';
    
-- 5. Find all dealerships that have a certain car in stock:

SELECT 
    d.*, v.make, v.model
FROM
    dealerships d
        JOIN
    inventory i ON d.dealership_id = i.dealership_id
        LEFT JOIN
    vehicles v ON i.vin = v.vin
WHERE
    v.color = 'Black';
    
-- 6. Get all sales information for a dealership over a specific date range:

SELECT 
    s.*
FROM
    sales_contracts s
        JOIN
    vehicles v ON s.vin = v.vin
        JOIN
    inventory i ON v.vin = i.vin
WHERE
    i.dealership_id = '2'
        AND s.contract_date BETWEEN '2023-01-01' AND '2025-01-01';