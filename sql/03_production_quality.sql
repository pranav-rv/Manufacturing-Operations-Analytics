USE Manufacturing_Operations_DB;
GO

-- Production Line Performance
SELECT
    Production_Line,
    SUM(Planned_Units) AS Planned_Units,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    SUM(Defective_Units) AS Defective_Units,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent
FROM dbo.Manufacturing_Operations
GROUP BY Production_Line
ORDER BY Production_Achievement_Percent DESC;

-- Product-wise Production and Quality
SELECT
    Product,
    SUM(Planned_Units) AS Planned_Units,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    SUM(Defective_Units) AS Defective_Units,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent
FROM dbo.Manufacturing_Operations
GROUP BY Product
ORDER BY Production_Achievement_Percent DESC;
