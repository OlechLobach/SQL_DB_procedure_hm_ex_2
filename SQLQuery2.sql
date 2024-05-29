USE SalesDB;
GO

INSERT INTO Sellers (SellerID, FullName, OtherDetails) VALUES
(1, 'John Doe', 'Details about John Doe'),
(2, 'Jane Smith', 'Details about Jane Smith'),
(3, 'Jim Brown', 'Details about Jim Brown');
GO

INSERT INTO Buyers (BuyerID, FullName, OtherDetails) VALUES
(1, 'Alice Johnson', 'Details about Alice Johnson'),
(2, 'Bob Lee', 'Details about Bob Lee'),
(3, 'Charlie White', 'Details about Charlie White');
GO

INSERT INTO Sales (SaleID, SellerID, BuyerID, SaleDate, SaleAmount, SalePrice) VALUES
(1, 1, 1, '2023-05-01', 10, 100.00),
(2, 2, 2, '2023-05-02', 20, 200.00),
(3, 3, 3, '2023-05-03', 30, 300.00),
(4, 1, 2, '2023-06-01', 15, 150.00),
(5, 2, 3, '2023-06-02', 25, 250.00);