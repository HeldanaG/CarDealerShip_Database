-- Drop and recreate the database
-- ----------------------------------------------------------------------
DROP DATABASE IF EXISTS CarDealerShip;
CREATE DATABASE CarDealerShip;
USE CarDealerShip;
-- ----------------------------------------------------------------------


-- Table 1: Dealerships
-- ---------------------------------------------------------------------- 
CREATE TABLE `dealerships` (
    `DealershipID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50),
    `address` VARCHAR(50),
    `phone` VARCHAR(12),
    PRIMARY KEY (`DealershipID`)
);
-- ----------------------------------------------------------------------


-- Table 2: Vehicles
-- ---------------------------------------------------------------------- 
CREATE TABLE `vehicles` (
    `VIN` VARCHAR(17) NOT NULL,
    `year` INT NOT NULL,
    `make` VARCHAR(30)NOT NULL,
    `model` VARCHAR(30) NOT NULL,
    `type` VARCHAR(30) ,
    `color` VARCHAR(20) ,
    `odometer` INT,
    `price` DECIMAL(10,2) NOT NULL,
     `sold` DECIMAL(10,2),
    PRIMARY KEY (`VIN`)
);
-- ----------------------------------------------------------------------


-- Table 3: Inventory
-- ---------------------------------------------------------------------- 
CREATE TABLE `inventory` (
    `InventoryID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `DealershipID` INT UNSIGNED NOT NULL,
    `VIN` VARCHAR(17) NOT NULL,
    PRIMARY KEY (`InventoryID`)
);
-- ----------------------------------------------------------------------


-- Table: SalesContracts
-- ---------------------------------------------------------------------- 
CREATE TABLE `SalesContracts` (
    `ContractID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `VIN` VARCHAR(17) NOT NULL,
    `SaleDate` DATE NOT NULL,
    `CustomerName` VARCHAR(100),
    `CustomerEmail` VARCHAR(100),
    `SalesTaxAmount` DECIMAL(10,2),
    `RecordingFee` DECIMAL(10,2),
    `ProcessingFee` DECIMAL(10,2),
    `VehiclePrice` DECIMAL(10,2),
    `Finance` BOOLEAN DEFAULT FALSE,
    `TermMonths` INT,                        
    `MonthlyPayment` DECIMAL(10,2),          
    PRIMARY KEY (`ContractID`),
    FOREIGN KEY (`VIN`) REFERENCES `vehicles`(`VIN`)
);

-- ----------------------------------------------------------------------


-- Table 5: LeaseContracts
-- ---------------------------------------------------------------------- 
CREATE TABLE `lease_contracts` (
    `ContractID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `VIN` VARCHAR(17) NOT NULL,
    `ContractDate` DATE NOT NULL,
    `CustomerName` VARCHAR(100),
    `CustomerEmail` VARCHAR(100),
    `ExpectedEndingValue` DECIMAL(10,2),
    `LeaseFee` DECIMAL(10,2),
    `TotalPrice` DECIMAL(10,2),
    `MonthlyPayment` DECIMAL(10,2),
    `TermMonths` INT DEFAULT 36,             
    `IsLeased` BOOLEAN DEFAULT TRUE,         
    PRIMARY KEY (`ContractID`),
    FOREIGN KEY (`VIN`) REFERENCES `vehicles`(`VIN`)
);

-- ----------------------------------------------------------------------


-- Sample Data: Dealerships
-- ----------------------------------------------------------------------
INSERT INTO `dealerships` (`name`, `address`, `phone`) VALUES
('Heldana Auto Center', '123 Main St', '555-123-4567'),
('Fast Track Motors', '456 Oak Ave', '555-987-6543'),
('City Drive Autos', '789 Ridge Rd', '555-222-1111'),
('Sunset Cars & Trucks', '321 Urban Blvd', '555-333-2222'),
('Mountain View Motors', '654 Sunset Dr', '555-444-3333');
-- ----------------------------------------------------------------------


-- Sample Data: Vehicles
-- ----------------------------------------------------------------------
INSERT INTO `vehicles` (`VIN`, `year`, `make`, `model`, `type`, `color`, `odometer`, `price`, `sold`) VALUES
('1HGCM82633A004352', 2021, 'Honda', 'Civic', 'Sedan', 'Blue', 30000, 19500.00, 0.00),
('1FTRX12W37FA12345', 2022, 'Ford', 'F-150', 'Truck', 'Black', 12000, 34000.00, 0.00),
('2T1BU4EE9DC000001', 2020, 'Toyota', 'Corolla', 'Sedan', 'White', 45000, 15000.00, 15000.00),
('WBS8M9C58J5L12345', 2022, 'BMW', 'M8', 'Coupe', 'Gray', 8000, 165000.00, 0.00),
('WP0AB2A94MS123456', 2023, 'Porsche', '911 Turbo', 'Coupe', 'Silver', 5000, 220000.00, 0.00);
-- ----------------------------------------------------------------------


-- Sample Data: Inventory
-- ----------------------------------------------------------------------
INSERT INTO `inventory` (`DealershipID`, `VIN`) VALUES
(1, '1HGCM82633A004352'),
(1, '2T1BU4EE9DC000001'),
(2, '1FTRX12W37FA12345'),
(3, 'WBS8M9C58J5L12345'),
(4, 'WP0AB2A94MS123456');
-- ----------------------------------------------------------------------


-- Sample Data: SalesContracts
-- ----------------------------------------------------------------------
INSERT INTO `SalesContracts` 
(`VIN`, `SaleDate`, `CustomerName`, `CustomerEmail`, `SalesTaxAmount`, `RecordingFee`, `ProcessingFee`, `VehiclePrice`, `Finance`, `TermMonths`, `MonthlyPayment`) VALUES
('2T1BU4EE9DC000001', '2024-06-01', 'Alice Johnson', 'alice@example.com', 750.00, 100.00, 495.00, 15000.00, TRUE, 48, 365.12),
('1HGCM82633A004352', '2024-06-03', 'Brian Smith', 'brian@example.com', 975.00, 100.00, 495.00, 19500.00, FALSE, NULL, 0.00);

-- ----------------------------------------------------------------------


-- Sample Data: LeaseContracts
-- ----------------------------------------------------------------------
INSERT INTO `lease_contracts` 
(`VIN`, `ContractDate`, `CustomerName`, `CustomerEmail`, `ExpectedEndingValue`, `LeaseFee`, `TotalPrice`, `MonthlyPayment`, `TermMonths`, `IsLeased`)VALUES
('WBS8M9C58J5L12345', '2024-06-10', 'Cathy Miller', 'cathy@example.com', 85000.00, 11200.00, 171200.00, 2151.39, 36, TRUE),
('WP0AB2A94MS123456', '2024-06-08', 'David Lee', 'david@example.com', 120000.00, 16800.00, 256800.00, 3533.33, 36, TRUE);

-- ----------------------------------------------------------------------
