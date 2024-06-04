use rhydham;
select * from project;

-- Total Value by Location
SELECT LOCATION, SUM(Value) AS TotalValue
FROM project
GROUP BY LOCATION;
-- Insight: This query provides the total value of all records grouped by location. It helps in understanding the distribution
-- of values across different locations.

-- Average Value by Indicator
SELECT INDICATOR, AVG(Value) AS AverageValue
FROM project
GROUP BY INDICATOR;
-- Insight: This query calculates the average value for each indicator. It's useful for analyzing the performance or status of different indicators.

-- Maximum Value by Subject and Measure
SELECT SUBJECT, MEASURE, MAX(Value)
FROM project
GROUP BY SUBJECT, MEASURE;
-- Insight: This query finds the maximum value for each combination of subject and measure, providing insights into the peak values observed.

-- Monthly Value Trends for a Specific Location
SELECT TIME, Value
FROM project
WHERE LOCATION = 'AUS'
AND FREQUENCY = 'A'
ORDER BY TIME;
-- Insight: This query retrieves the monthly values for a specific location, allowing analysis of trends over time for that location.

-- Count of Records by Frequency and Time Period
SELECT FREQUENCY, TIME, COUNT(*) AS RecordCount
FROM project
GROUP BY FREQUENCY, TIME;
-- Insight: This query counts the number of records for each combination of frequency and time period, which helps in understanding 
-- the data distribution over time.

-- Value Distribution by Measure
SELECT MEASURE, Value
FROM project
ORDER BY MEASURE, Value;
-- Insight: This query lists all values sorted by measure, providing a detailed look at how values are distributed across different measures.

-- Yearly Average Value by Location
SELECT LOCATION, YEAR(TIME) AS Year, AVG(Value) AS AverageValue
FROM project
WHERE FREQUENCY = 'A'
GROUP BY LOCATION, YEAR(TIME);
-- Insight: This query calculates the yearly average value for each location, helping in year-over-year comparison.

-- Top 5 Locations by Total Value
SELECT LOCATION, SUM(Value) AS TotalValue
FROM project
GROUP BY LOCATION
ORDER BY TotalValue DESC
LIMIT 5;
-- Insight: This query identifies the top 5 locations with the highest total values, highlighting the key locations.

-- Monthly Value Change for a Specific Indicator
SELECT TIME, (Value - LAG(Value) OVER (ORDER BY TIME)) AS ValueChange
FROM project
WHERE INDICATOR = 'MEATCONSUMP'
AND FREQUENCY = 'A';
-- Insight: This query calculates the month-over-month change in value for a specific indicator, useful for tracking performance changes.

-- Total Value by Subject Over a Specific Time Period
SELECT SUBJECT, SUM(Value) AS TotalValue
FROM project
WHERE TIME BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY SUBJECT;
-- Insight: This query sums up the values for each subject within a specified time period, providing insights into the subject-specific totals for that period.
