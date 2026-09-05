USE Manufacturing_Operations_DB;
GO

-- Plant Cost and Efficiency
SELECT
    Plant,
    SUM(Production_Cost) AS Production_Cost,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Production_Cost) / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Cost_Per_Unit,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Efficiency_Percent,
    SUM(Overtime_Hours) AS Overtime_Hours
FROM dbo.Manufacturing_Operations
GROUP BY Plant
ORDER BY Cost_Per_Unit DESC;

-- Production Cost by Product
SELECT
    Product,
    SUM(Production_Cost) AS Production_Cost,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Production_Cost) / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Cost_Per_Unit
FROM dbo.Manufacturing_Operations
GROUP BY Product
ORDER BY Production_Cost DESC;

-- Production Cost by Production Line
SELECT
    Production_Line,
    SUM(Production_Cost) AS Production_Cost,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Production_Cost) / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Cost_Per_Unit
FROM dbo.Manufacturing_Operations
GROUP BY Production_Line
ORDER BY Production_Cost DESC;
