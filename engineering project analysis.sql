-- =================================================================================
--                         Engineering project analysis
-- =================================================================================

-- Total no of projects

SELECT COUNT(*) AS total_projects
FROM engineering_projects;

-- Types of projects we have

SELECT DISTINCT Project_Type
FROM engineering_projects;

-- How many projects are there in each category

SELECT Project_Type,
COUNT(*) AS project_count
FROM engineering_projects
GROUP BY Project_Type
ORDER BY project_count DESC;

-- different feasibility outcome

SELECT Feasibility_Label,
COUNT(*) AS project_count
FROM engineering_projects
GROUP BY Feasibility_Label
ORDER BY project_count DESC;

-- which project types are the moat expensive on average

SELECT Project_Type,
COUNT(*) AS project_count,
ROUND(AVG(Estimated_Cost_USD), 2) AS average_cost,
ROUND(SUM(Estimated_Cost_USD), 2) AS total_cost
FROM engineering_projects
GROUP BY Project_Type
ORDER BY average_cost DESC;

-- 10 most expensive projects

SELECT Project_ID,
Project_Name,
Project_Type,
Estimated_Cost_USD,
Feasibility_Label
FROM engineering_projects
ORDER BY Estimated_Cost_USD DESC
LIMIT 10;

-- How many projects fall into each risk category

SELECT
    CASE
        WHEN Risk_Assessment_Score >= 80 THEN 'High Risk'
        WHEN Risk_Assessment_Score >= 50 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category,
COUNT(*) AS Project_Count
FROM engineering_projects
GROUP BY Risk_Category
ORDER BY Project_Count DESC;

-- which project types have the hihest average risk?

SELECT Project_Type,
COUNT(*) AS Project_Count,
ROUND(AVG(Risk_Assessment_Score), 2) AS Average_Risk
FROM engineering_projects
GROUP BY Project_Type
ORDER BY Average_Risk DESC;

-- Feasibility vs Risk

SELECT Feasibility_Label,
COUNT(*) AS Project_Count,
ROUND(AVG(Risk_Assessment_Score), 2) AS Average_Risk
FROM engineering_projects
GROUP BY Feasibility_Label
ORDER BY Average_Risk DESC;

-- project types having risk above 60

SELECT Project_Type,
COUNT(*) AS Project_Count,
ROUND(AVG(Risk_Assessment_Score), 2) AS Average_Risk
FROM engineering_projects
GROUP BY Project_Type
HAVING AVG(Risk_Assessment_Score) > 60
ORDER BY Average_Risk DESC;

-- Projects that are more expensive than overall average

WITH Average_Cost AS (
    SELECT
        AVG(Estimated_Cost_USD) AS Avg_Cost
    FROM engineering_projects
)

SELECT Project_ID,
Project_Name,
Project_Type,
Estimated_Cost_USD,
ROUND(Average_Cost.Avg_Cost, 2) AS Overall_Average_Cost
FROM engineering_projects
CROSS JOIN Average_Cost
WHERE Estimated_Cost_USD > Average_Cost.Avg_Cost
ORDER BY Estimated_Cost_USD DESC;

-- Money attached to each feasibility outcome

SELECT Feasibility_Label,
COUNT(*) AS Total_Projects,
ROUND(SUM(Estimated_Cost_USD), 2) AS Total_Estimated_Cost,
ROUND(AVG(Estimated_Cost_USD), 2) AS Average_Project_Cost
FROM engineering_projects
GROUP BY Feasibility_Label
ORDER BY Total_Estimated_Cost DESC;

-- How does resource allocation differ by feasibility

SELECT Feasibility_Label,
COUNT(*) AS Total_Projects,
ROUND(AVG(Resource_Allocation_Score), 2) AS Average_Resource_Score,
ROUND(MIN(Resource_Allocation_Score), 2) AS Minimum_Resource_Score,
ROUND(MAX(Resource_Allocation_Score), 2) AS Maximum_Resource_Score
FROM engineering_projects
GROUP BY Feasibility_Label
ORDER BY Average_Resource_Score DESC;

-- environmental impact

SELECT Feasibility_Label,
COUNT(*) AS Total_Projects,
ROUND(AVG(Environmental_Impact_Score), 2) AS Average_Environmental_Impact,
ROUND(MIN(Environmental_Impact_Score), 2) AS Minimum_Environmental_Impact,
ROUND(MAX(Environmental_Impact_Score), 2) AS Maximum_Environmental_Impact
FROM engineering_projects
GROUP BY Feasibility_Label
ORDER BY Average_Environmental_Impact DESC;

-- How much cost is exposed to multiple risk factors?

SELECT COUNT(*) AS Flagged_Projects,
ROUND(SUM(Estimated_Cost_USD), 2) AS Total_Cost_Exposure,
ROUND(AVG(Estimated_Cost_USD), 2) AS Average_Flagged_Project_Cost
FROM engineering_projects
WHERE Risk_Assessment_Score >= 80
  AND Environmental_Impact_Score >= 75
  AND Historical_Cost_Deviation >= 7.5;
  
-- overall cost deviation 

SELECT ROUND(AVG(Historical_Cost_Deviation), 2) AS Average_Deviation,
ROUND(MIN(Historical_Cost_Deviation), 2) AS Minimum_Deviation,
ROUND(MAX(Historical_Cost_Deviation), 2) AS Maximum_Deviation
FROM engineering_projects;

-- cost deviation by project types

SELECT Project_Type,
COUNT(*) AS Project_Count,
ROUND(AVG(Historical_Cost_Deviation), 2) AS Average_Deviation,
ROUND(MIN(Historical_Cost_Deviation), 2) AS Minimum_Deviation,
ROUND(MAX(Historical_Cost_Deviation), 2) AS Maximum_Deviation
FROM engineering_projects
GROUP BY Project_Type
ORDER BY Average_Deviation DESC;

-- which project types have the highest proportion of projects with high historical deviation

SELECT
    Project_Type,
    COUNT(*) AS Total_Projects,

    SUM(
        CASE
            WHEN Historical_Cost_Deviation >= 7.5 THEN 1
            ELSE 0
        END
    ) AS High_Deviation_Projects,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN Historical_Cost_Deviation >= 7.5 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS High_Deviation_Percentage

FROM engineering_projects
GROUP BY Project_Type
ORDER BY High_Deviation_Percentage DESC;

-- Management KPI by feasibility

SELECT Feasibility_Label,
COUNT(*) AS Flagged_Projects,
ROUND(SUM(Estimated_Cost_USD), 2) AS Cost_Exposure
FROM engineering_projects
WHERE Risk_Assessment_Score >= 80
  AND Environmental_Impact_Score >= 75
  AND Historical_Cost_Deviation >= 7.5
GROUP BY Feasibility_Label
ORDER BY Cost_Exposure DESC;

-- ===================================================================================
-- ===================================================================================



