USE Manufacturing_Operations_DB;
GO

-- Product Performance
SELECT
    Product,
    SUM(Planned_Units) AS Planned_Units,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    SUM(Defective_Units) AS Defective_Units,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent,
    SUM(Production_Cost) AS Production_Cost,
    CAST(SUM(Production_Cost) / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Cost_Per_Unit
FROM dbo.Manufacturing_Operations
GROUP BY Product
ORDER BY Production_Achievement_Percent DESC;
