CREATE TABLE DimCustomerSegment (
    CustomerID VARCHAR(50) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    Segment VARCHAR(20), -- High / Medium / Low
    TotalSales DECIMAL(18,2),
    OrdersCount INT
);

CREATE TABLE FactSalesPerformance (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    SalesAmount DECIMAL(18,2),
    ProductRank VARCHAR(20), -- Top Performer / Low Performer
    Year INT,
    Month INT,
    Quarter INT
);

CREATE TABLE DimRegionSegment (
    Region VARCHAR(50) PRIMARY KEY,
    TotalSales DECIMAL(18,2),
    OrdersCount INT,
    Segment VARCHAR(20) -- High / Medium / Low
);


SELECT ProductRank, COUNT(*) AS ProductCount
FROM FactSalesPerformance
GROUP BY ProductRank;

SELECT TOP 10 * FROM FactSalesPerformance;

SELECT Region, 
       SUM(TotalSales) AS RegionSales, 
       COUNT(*) AS CustomerCount
FROM DimCustomerSegment
GROUP BY Region;
