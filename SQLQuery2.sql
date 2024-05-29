CREATE DATABASE SalesDB;
GO

USE SalesDB;
GO

CREATE TABLE Sellers (
    SellerID INT PRIMARY KEY,
    FullName VARCHAR(255),
    OtherDetails VARCHAR(255)
);
GO

CREATE TABLE Buyers (
    BuyerID INT PRIMARY KEY,
    FullName VARCHAR(255),
    OtherDetails VARCHAR(255)
);
GO

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SellerID INT FOREIGN KEY REFERENCES Sellers(SellerID),
    BuyerID INT FOREIGN KEY REFERENCES Buyers(BuyerID),
    SaleDate DATE,
    SaleAmount DECIMAL,
    SalePrice DECIMAL
);
GO


CREATE PROCEDURE GetAllSellers
AS
BEGIN
    SELECT * FROM Sellers;
END;
GO

CREATE PROCEDURE GetAllBuyers
AS
BEGIN
    SELECT * FROM Buyers;
END;
GO

CREATE PROCEDURE GetAllSales
AS
BEGIN
    SELECT Sales.SaleID, Sellers.FullName AS Seller, Buyers.FullName AS Buyer, Sales.SaleDate, Sales.SaleAmount, Sales.SalePrice
    FROM Sales
    JOIN Sellers ON Sales.SellerID = Sellers.SellerID
    JOIN Buyers ON Sales.BuyerID = Buyers.BuyerID;
END;
GO

CREATE PROCEDURE GetSalesByDate @SaleDate DATE
AS
BEGIN
    SELECT Sales.SaleID, Sellers.FullName AS Seller, Buyers.FullName AS Buyer, Sales.SaleDate, Sales.SaleAmount, Sales.SalePrice
    FROM Sales
    JOIN Sellers ON Sales.SellerID = Sellers.SellerID
    JOIN Buyers ON Sales.BuyerID = Buyers.BuyerID
    WHERE Sales.SaleDate = @SaleDate;
END;
GO

CREATE PROCEDURE GetSalesByDateRange @StartDate DATE, @EndDate DATE
AS
BEGIN
    SELECT Sales.SaleID, Sellers.FullName AS Seller, Buyers.FullName AS Buyer, Sales.SaleDate, Sales.SaleAmount, Sales.SalePrice
    FROM Sales
    JOIN Sellers ON Sales.SellerID = Sellers.SellerID
    JOIN Buyers ON Sales.BuyerID = Buyers.BuyerID
    WHERE Sales.SaleDate BETWEEN @StartDate AND @EndDate;
END;
GO

CREATE PROCEDURE GetSalesBySeller @SellerName VARCHAR(255)
AS
BEGIN
    SELECT Sales.SaleID, Sellers.FullName AS Seller, Buyers.FullName AS Buyer, Sales.SaleDate, Sales.SaleAmount, Sales.SalePrice
    FROM Sales
    JOIN Sellers ON Sales.SellerID = Sellers.SellerID
    JOIN Buyers ON Sales.BuyerID = Buyers.BuyerID
    WHERE Sellers.FullName = @SellerName;
END;
GO

CREATE PROCEDURE GetAverageSalePriceByYear @Year INT
AS
BEGIN
    SELECT AVG(SalePrice) AS AverageSalePrice
    FROM Sales
    WHERE YEAR(SaleDate) = @Year;
END;