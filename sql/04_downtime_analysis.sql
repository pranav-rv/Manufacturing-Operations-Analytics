USE Manufacturing_Operations_DB;
GO

-- Downtime by Reason
SELECT
    Downtime_Reason,
    SUM(Downtime_Minutes) AS Total_Downtime_Minutes,
    CAST(SUM(Downtime_Minutes) * 100.0 /
         NULLIF((SELECT SUM(Downtime_Minutes) FROM dbo.Manufacturing_Operations), 0)
         AS DECIMAL(10,2)) AS Downtime_Share_Percent
FROM dbo.Manufacturing_Operations
GROUP BY Downtime_Reason
ORDER BY Total_Downtime_Minutes DESC;

-- Downtime by Plant and Reason
SELECT
    Plant,
    Downtime_Reason,
    SUM(Downtime_Minutes) AS Total_Downtime_Minutes
FROM dbo.Manufacturing_Operations
GROUP BY Plant, Downtime_Reason
ORDER BY Plant, Total_Downtime_Minutes DESC;

-- Downtime per 1,000 Produced Units by Plant
SELECT
    Plant,
    SUM(Downtime_Minutes) AS Total_Downtime_Minutes,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Downtime_Minutes) * 1000.0 / NULLIF(SUM(Produced_Units), 0)
         AS DECIMAL(10,2)) AS Downtime_Per_1000_Units
FROM dbo.Manufacturing_Operations
GROUP BY Plant
ORDER BY Downtime_Per_1000_Units DESC;

-- Highest Downtime Events
SELECT TOP 10
    Date,
    Plant,
    Production_Line,
    Product,
    Shift,
    Downtime_Reason,
    Downtime_Minutes,
    Defective_Units,
    Produced_Units
FROM dbo.Manufacturing_Operations
ORDER BY Downtime_Minutes DESC;
