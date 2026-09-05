USE Manufacturing_Operations_DB;
GO

-- Overall Manufacturing KPIs
SELECT
    SUM(Planned_Units) AS Total_Planned_Units,
    SUM(Produced_Units) AS Total_Produced_Units,
    SUM(Defective_Units) AS Total_Defective_Units,
    SUM(Downtime_Minutes) AS Total_Downtime_Minutes,
    SUM(Overtime_Hours) AS Total_Overtime_Hours,
    SUM(Production_Cost) AS Total_Production_Cost,
    CAST(SUM(Produced_Units) * 100.0 / NULLIF(SUM(Planned_Units), 0) AS DECIMAL(10,2)) AS Production_Achievement_Percent,
    CAST(SUM(Defective_Units) * 100.0 / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Defect_Rate_Percent,
    CAST(SUM(Production_Cost) / NULLIF(SUM(Produced_Units), 0) AS DECIMAL(10,2)) AS Cost_Per_Unit
FROM dbo.Manufacturing_Operations;
