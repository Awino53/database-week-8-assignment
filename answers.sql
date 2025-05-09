-- This SQL script creates a simple e-commerce database schema with tables for categories, suppliers, products, orders, and order details.
-- The schema is designed to manage an inventory system for an online store.
-- The script includes the creation of tables, their relationships, and constraints.
-- The database is named InventoryDB and includes the following tables:
-- 1. Category: Stores product categories.
-- 2. Supplier: Stores supplier information.
-- 3. Product: Stores product details, including category and supplier references.
-- 4. Order: Stores order information.
-- 5. OrderDetails: Stores details of each order, linking products to orders.
-- The script also includes foreign key constraints to maintain referential integrity between the tables.

CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;
-- Create the Category Table
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Create the Supplier Table
CREATE TABLE Supplier (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT
);

-- Create the Product Table
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    SupplierID INT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE SET NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) ON DELETE SET NULL
);

-- Create the Order Table
CREATE TABLE Order (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(100),
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- Create the OrderDetails Table (Many-to-Many relationship between Order and Product)
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Order(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

