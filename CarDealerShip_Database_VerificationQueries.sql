-- 01_get_all_dealerships.sql
-- ----------------------------------------------------------------------
SELECT 
	* 
FROM 
	`dealerships`;
-- ----------------------------------------------------------------------


-- 02_find_vehicles_by_dealership.sql
-- ----------------------------------------------------------------------
SELECT 
	v.*
FROM 
	`vehicles` v
JOIN 
	`inventory` i ON v.VIN = i.VIN
WHERE 
	i.DealershipID = 1;
-- ----------------------------------------------------------------------


-- 03_find_vehicle_by_vin.sql
-- ----------------------------------------------------------------------
SELECT 
	* 
FROM 
	`vehicles`
WHERE 
	VIN = 'WP0AB2A94MS123456';
-- ----------------------------------------------------------------------


-- 04_find_dealership_by_vin.sql
-- ----------------------------------------------------------------------
SELECT 
	d.*
FROM 
	`dealerships` d
JOIN 
	`inventory` i ON d.DealershipID = i.DealershipID
WHERE 
	i.VIN = '1HGCM82633A004352';
-- ----------------------------------------------------------------------


-- 05_find_dealerships_by_vehicle_type.sql
-- ----------------------------------------------------------------------
SELECT 
	DISTINCT d.*
FROM 
	`dealerships` d
JOIN 
	`inventory` i ON d.DealershipID = i.DealershipID
JOIN 
	`vehicles` v ON i.VIN = v.VIN
WHERE 
	v.make = 'Ford' 
AND v.model = 'Mustang'
AND v.color = 'Red';
-- ----------------------------------------------------------------------


-- 06_get_sales_by_dealer_date_range.sql
-- ----------------------------------------------------------------------
SELECT 
	sc.*
FROM 
	`salescontracts` sc
JOIN 
	`inventory` i ON sc.VIN = i.VIN
WHERE 
	i.DealershipID = 1
  AND sc.SaleDate 
  BETWEEN '2024-01-01' 
  AND '2024-12-31';
-- ----------------------------------------------------------------------
