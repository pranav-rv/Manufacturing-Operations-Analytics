USE Manufacturing_Operations_DB;
GO

-- Daily Performance
SELECT
    Date,
    SUM(Planned_Units) AS Planned_Units,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    SUM(Defective_Units) AS Defective_Units,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent,
    SUM(Downtime_Minutes) AS Downtime_Minutes
FROM dbo.Manufacturing_Operations
GROUP BY Date
ORDER BY Date;

-- Monthly Performance
SELECT
    YEAR(Date) AS Production_Year,
    MONTH(Date) AS Production_Month,
    SUM(Planned_Units) AS Planned_Units,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    SUM(Defective_Units) AS Defective_Units,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent
FROM dbo.Manufacturing_Operations
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Production_Year, Production_Month;

-- Lowest-performing Production Days
SELECT TOP 5
    Date,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent,
    SUM(Downtime_Minutes) AS Downtime_Minutes
FROM dbo.Manufacturing_Operations
GROUP BY Date
ORDER BY Production_Achievement_Percent ASC;
