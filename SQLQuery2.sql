USE SalesDB;
GO

EXEC GetAllSellers;
GO

EXEC GetAllBuyers;
GO

EXEC GetAllSales;
GO

EXEC GetSalesByDate @SaleDate = '2023-05-01';
GO

EXEC GetSalesByDateRange @StartDate = '2023-05-01', @EndDate = '2023-06-01';
GO

EXEC GetSalesBySeller @SellerName = 'John Doe';
GO

EXEC GetAverageSalePriceByYear @Year = 2023;