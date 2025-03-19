-- Chech data size 
SELECT COUNT(*) AS Total_Records FROM [dbo].[anxiety_attack_dataset]

-- Check for duplicate records
SELECT ID, COUNT(*)  
FROM anxiety_attack_dataset  
GROUP BY ID  
HAVING COUNT(*) > 1;

-- There are 10 levels of stress
-- Stress level distribution
SELECT Stress_Level, COUNT(*) AS Count  
FROM [dbo].[anxiety_attack_dataset]
GROUP BY Stress_Level  
ORDER BY Stress_Level;

-- Average sleep hours for each stress level:
SELECT Stress_Level, ROUND(AVG(Sleep_Hours),2) AS Avg_Sleep_Hours  
FROM anxiety_attack_dataset 
GROUP BY Stress_Level  
ORDER BY Stress_Level;

-- Impact of caffeine intake on stress levels
SELECT Stress_Level, AVG(Caffeine_Intake) AS Avg_Caffeine  
FROM anxiety_attack_dataset
GROUP BY Stress_Level  
ORDER BY Stress_Level;

-- Let's find whether physical activity reduced stress
SELECT Stress_Level, AVG(Physical_Activity) AS Avg_Physical_Activity  
FROM anxiety_attack_dataset
GROUP BY Stress_Level  
ORDER BY Stress_Level;

-- People with high stress level (Stress_Level > 6) seem to have 
-- some common traits. Let's find out:
SELECT Occupation, ROUND(AVG(Sleep_Hours),2) AS Avg_Sleep, ROUND(AVG(Physical_Activity),2) AS Avg_Activity,  
       AVG(Caffeine_Intake) AS Avg_Caffeine, AVG(Alcohol_Consumption) AS Avg_Alcohol  
FROM anxiety_attack_dataset 
WHERE Stress_Level > 6  
GROUP BY Occupation  
ORDER BY Avg_Sleep;
-- Although they have different occupation, they seem to in the same ranges of
-- sleep hours, caffeine intake and alcohol consumption

-- Most stressed occupations:
SELECT Occupation, SUM(Stress_Level) AS Sum_Stress, AVG(Stress_Level) AS Avg_Stress  
FROM anxiety_attack_dataset  
GROUP BY Occupation  
ORDER BY Sum_Stress DESC  
-- We could see that people who don't have jobs might have higher total stress levels

-- Heart Rate and Breathing Rate vs Stress Level
SELECT Stress_Level, 
       AVG(Heart_Rate) AS Avg_Heart_Rate, 
       AVG(Breathing_Rate) AS Avg_Breathing_Rate
FROM dbo.anxiety_attack_dataset
GROUP BY Stress_Level
ORDER BY Stress_Level;

-- Check if therapy sessions help reduce stress levels
SELECT Therapy_Sessions, AVG(Stress_Level) AS Avg_Stress_Level
FROM dbo.anxiety_attack_dataset
GROUP BY Therapy_Sessions
ORDER BY Therapy_Sessions;

-- Identify people who might be at high risk due to lack of sleep
SELECT *
FROM dbo.anxiety_attack_dataset
WHERE Stress_Level >= 7 AND Sleep_Hours < 5;

-- Identify people with severe anxiety and extreme stress
SELECT * 
FROM dbo.anxiety_attack_dataset
WHERE Stress_Level >= 8 
AND Severity_of_Anxiety_Attack >= 3;




