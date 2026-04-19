
SELECT 
    DATE_FORMAT(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg'), 'yyyy-MM') AS Year_Month,
    Channel2 As Channel_Name,
    COALESCE(B.Province, 'Unknown') AS Province,
    COALESCE(B.Gender, 'Unknown') AS Gender,
    COALESCE(B.Race, 'Unknown') AS Race,

    CASE 
        WHEN HOUR(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg')) BETWEEN 0 AND 5 THEN 'Late Night'
        WHEN HOUR(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg')) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Hour_Of_Day,

    CASE 
        WHEN B.Age IS NULL THEN 'Unknown'
        WHEN B.Age BETWEEN 0 AND 17 THEN 'Kids'
        WHEN B.Age BETWEEN 18 AND 24 THEN 'Teenagers'
        WHEN B.Age BETWEEN 25 AND 34 THEN 'Youth'
        WHEN B.Age BETWEEN 35 AND 44 THEN 'Adult'
        WHEN B.Age BETWEEN 45 AND 54 THEN 'Mature Adult'
        ELSE 'Retired'
    END AS Age_Group,

    COUNT(*) AS Total_Views,
    COUNT(DISTINCT A.UserID) AS Unique_Users,
    AVG(A.`Duration 2`) AS Avg_View_Duration,
    SUM(A.`Duration 2`) AS Total_View_Time

FROM workspace.default.viewership A
LEFT JOIN workspace.default.user_profiles B 
    ON A.UserID = B.UserID

GROUP BY 
    DATE_FORMAT(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg'), 'yyyy-MM'),
    Channel2,
    COALESCE(B.Province, 'Unknown'),
    COALESCE(B.Gender, 'Unknown'),
    COALESCE(B.Race, 'Unknown'),

    CASE 
        WHEN HOUR(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg')) BETWEEN 0 AND 5 THEN 'Late Night'
        WHEN HOUR(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg')) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(from_utc_timestamp(to_timestamp(A.RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END,

    CASE 
        WHEN B.Age IS NULL THEN 'Unknown'
        WHEN B.Age BETWEEN 0 AND 17 THEN 'Kids'
        WHEN B.Age BETWEEN 18 AND 24 THEN 'Teenagers'
        WHEN B.Age BETWEEN 25 AND 34 THEN 'Youth'
        WHEN B.Age BETWEEN 35 AND 44 THEN 'Adult'
        WHEN B.Age BETWEEN 45 AND 54 THEN 'Mature Adult'
        ELSE 'Retired'
    END

ORDER BY 
    Year_Month,
    Hour_Of_Day,
    Province,
    Gender,
    Race,
    Age_Group;
