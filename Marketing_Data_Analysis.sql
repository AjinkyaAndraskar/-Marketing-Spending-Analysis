use Marketing;

select * from Marketing_Data;

select distinct campaign_name from Marketing_Data;

select distinct category from Marketing_Data;

---- Overall ROMI

select (sum(revenue)- sum(mark_spent))/sum(mark_spent) AS ROMI
from Marketing_Data; 

-- ROMI by campaigns

select Campaign_Name,(sum(revenue)- sum(mark_spent))/sum(mark_spent) AS ROMI
from Marketing_Data
GROUP BY Campaign_Name;

-- Campaign Effectiveness:
-- Find campaigns with the highest and lowest ROMI:

SELECT TOP 1 Campaign_Name, ((Revenue - Mark_spent) / Mark_spent) AS ROMI
FROM Marketing_Data
ORDER BY ROMI DESC;

SELECT TOP 1 Campaign_Name, ((Revenue - Mark_spent) / Mark_spent) AS ROMI
FROM Marketing_Data
ORDER BY ROMI ASC;

-- Conversion Rates and Engagement:
-- Analysis of conversion rates and average order value

SELECT
    c_Date,
    AVG(Leads * 1.0 / NULLIF(Clicks,0)) AS AvgConversionRate1,
    AVG(Orders * 1.0 / NULLIF(Leads,0)) AS AvgConversionRate2,
    AVG(Revenue * 1.0 / NULLIF(Orders,0)) AS AvgOrderValue
FROM Marketing_Data
GROUP BY c_Date;

-- Cost Efficiency:
-- Cost per click (CPC), Cost per lead (CPL), Customer acquisition cost (CAC)
SELECT
    c_Date,
    SUM(Mark_spent) / SUM(Clicks) AS CPC,
    SUM(Mark_spent) / SUM(Leads) AS CPL,
    SUM(Mark_spent) / SUM(Orders) AS CAC
FROM Marketing_Data
GROUP BY c_Date;

-- Find campaigns with the highest and lowest CPC, CPL, and CAC:

SELECT TOP 1 Campaign_Name, mark_spent * 1.0 / Clicks AS CPC
FROM Marketing_Data
ORDER BY CPC DESC;

SELECT TOP 1 Campaign_Name, mark_spent * 1.0 / Clicks AS CPC
FROM Marketing_Data
ORDER BY CPC ASC;

SELECT TOP 1 Campaign_Name, mark_spent * 1.0 / NULLIF(Leads, 0) AS CPL
FROM Marketing_Data
ORDER BY CPL DESC;

SELECT TOP 1 Campaign_Name, mark_spent * 1.0 / NULLIF(Leads, 0) AS CPL
FROM Marketing_Data
ORDER BY CPL ASC;

SELECT TOP 1 Campaign_Name, mark_spent * 1.0 / NULLIF(Orders,0) AS CAC
FROM Marketing_Data
ORDER BY CAC DESC;

SELECT TOP 1 Campaign_Name, mark_spent * 1.0 / NULLIF(Orders,0) AS CAC
FROM Marketing_Data
ORDER BY CAC ASC;

-- Customer Behavior:
-- Analysis of campaign types
SELECT
    Category,
    AVG(Revenue) AS AvgRevenue
FROM Marketing_Data
GROUP BY Category;

-- Calculate average order value by campaign type:
 SELECT Category, AVG(Revenue * 1.0 / NULLIF(Orders,0)) AS AvgOrderValue
 FROM Marketing_Data
 GROUP BY Category;

--Geographical Insights:
-- Analysis of geo locations
-- Geo Location Revenue Ranking Analysis
SELECT
    Geo_Type_Name AS Location,
    SUM(Revenue) AS TotalRevenue,
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS RevenueRank
FROM Marketing_Data
GROUP BY Geo_Type_Name
ORDER BY RevenueRank;

-- Location-Based Conversion Rate Analysis:
SELECT
    Geo_Type_Name AS Location,
    AVG(Orders * 1.0 / NULLIF(Leads, 0)) AS AvgConversionRate
FROM Marketing_Data
GROUP BY Geo_Type_Name;

-- Geo Location Comparison:
SELECT
    Geo_Type_Name AS Location,
    AVG(Revenue) AS AvgRevenue,
    AVG(Orders) AS AvgOrders,
    AVG(Revenue * 1.0 / NULLIF(Orders, 0)) AS AvgConversionRate
FROM Marketing_Data
GROUP BY Geo_Type_Name
ORDER BY AvgRevenue DESC;

-- Geo Location Advertising Effectiveness(campaign performance by location):
SELECT Category, Geo_Type_Name,
             AVG(Revenue) AS AvgRevenue,
             AVG(Orders) AS AvgOrders
FROM Marketing_Data
GROUP BY Category, Geo_Type_Name;

-- Time-Centric Marketing Insights:
--Time-based Analysis - Revenue on Weekdays and Weekends:

SELECT
    CASE
        WHEN DATEPART(WEEKDAY, c_Date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS DayType,
    AVG(Revenue) AS AvgRevenue
FROM Marketing_Data
GROUP BY
    CASE
        WHEN DATEPART(WEEKDAY, c_Date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END;

--Day of the Week Analysis:

SELECT
    DATEPART(WEEKDAY, c_Date) AS DayOfWeek,
    AVG(Revenue) AS AvgRevenue,
    AVG(Clicks) AS AvgClicks,
    AVG(Leads) AS AvgLeads,
    AVG(Orders) AS AvgOrders
FROM Marketing_Data
GROUP BY DATEPART(WEEKDAY, c_Date)
ORDER BY DayOfWeek;

-- Performance analysis by date
SELECT
    c_Date,
    SUM(Mark_spent) AS TotalSpending,
    SUM(Revenue) AS TotalRevenue,
    MAX(Clicks) AS MaxClicks,
    MAX(Leads) AS MaxLeads,
    MAX(Orders) AS MaxOrders,
    MAX(Revenue) AS MaxSingleDayRevenue
FROM Marketing_Data
GROUP BY c_Date
ORDER BY TotalSpending DESC;

 -- Calculate the 75th percentile of spending values within the same month
DECLARE @Month INT = 2; -- Replace with the desired month (e.g., August)
DECLARE @Year INT = 2021; -- Replace with the desired year

SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Mark_Spent) OVER() AS Percentile_75
FROM Marketing_Data
WHERE MONTH(c_Date) = @Month AND YEAR(c_Date) = @Year;

-- For high spending days leading to higher revenue
DECLARE @ThresholdSpending DECIMAL(18, 2) = 129372.25;  -- Set your threshold here
SELECT c_date, SUM(mark_spent) AS TotalSpending, SUM(Revenue) AS TotalRevenue
FROM Marketing_Data
GROUP BY c_date
HAVING SUM(mark_spent) > @ThresholdSpending
ORDER BY TotalRevenue DESC;