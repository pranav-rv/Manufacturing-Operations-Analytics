USE Manufacturing_Operations_DB;
GO

-- Shift-wise Performance
SELECT
    Shift,
    SUM(Planned_Units) AS Planned_Units,
    SUM(Produced_Units) AS Produced_Units,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    SUM(Defective_Units) AS Defective_Units,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent,
    SUM(Downtime_Minutes) AS Downtime_Minutes,
    SUM(Overtime_Hours) AS Overtime_Hours
FROM dbo.Manufacturing_Operations
GROUP BY Shift
ORDER BY Production_Achievement_Percent DESC;
