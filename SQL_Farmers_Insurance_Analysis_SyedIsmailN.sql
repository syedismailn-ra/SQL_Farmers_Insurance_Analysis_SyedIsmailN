SET GLOBAL local_infile=1;

CREATE SCHEMA IF NOT EXISTS ndap;

USE ndap;

CREATE TABLE IF NOT EXISTS FarmersInsuranceData (
    rowID INT PRIMARY KEY,
    srcYear INT,
    srcStateName VARCHAR(255),
    srcDistrictName VARCHAR(255),
    InsuranceUnits INT,
    TotalFarmersCovered INT,
    ApplicationsLoaneeFarmers INT,
    ApplicationsNonLoaneeFarmers INT,
    InsuredLandArea FLOAT,
    FarmersPremiumAmount FLOAT,
    StatePremiumAmount FLOAT,
    GOVPremiumAmount FLOAT,
    GrossPremiumAmountToBePaid FLOAT,
    SumInsured FLOAT,
    PercentageMaleFarmersCovered FLOAT,
    PercentageFemaleFarmersCovered FLOAT,
    PercentageOthersCovered FLOAT,
    PercentageSCFarmersCovered FLOAT,
    PercentageSTFarmersCovered FLOAT,
    PercentageOBCFarmersCovered FLOAT,
    PercentageGeneralFarmersCovered FLOAT,
    PercentageMarginalFarmers FLOAT,
    PercentageSmallFarmers FLOAT,
    PercentageOtherFarmers FLOAT,
    YearCode INT,
    Year_ VARCHAR(255),
    Country VARCHAR(255),
    StateCode INT,
    DistrictCode INT,
    TotalPopulation INT,
    TotalPopulationUrban INT,
    TotalPopulationRural INT,
    TotalPopulationMale INT,
    TotalPopulationMaleUrban INT,
    TotalPopulationMaleRural INT,
    TotalPopulationFemale INT,
    TotalPopulationFemaleUrban INT,
    TotalPopulationFemaleRural INT,
    NumberOfHouseholds INT,
    NumberOfHouseholdsUrban INT,
    NumberOfHouseholdsRural INT,
    LandAreaUrban FLOAT,
    LandAreaRural FLOAT,
    LandArea FLOAT
);


LOAD DATA LOCAL INFILE "C:\\Users\\syedi\\Downloads\\data.csv"
INTO TABLE FarmersInsuranceData
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'          
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

use ndap;
select * from FarmersInsuranceData;

-- ----------------------------------------------------------------------------------------------
-- SECTION 1. 
-- SELECT Queries [5 Marks]

-- 	Q1.	Retrieve the names of all states (srcStateName) from the dataset.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT DISTINCT srcStateName FROM FarmersInsuranceData;

###

-- 	Q2.	Retrieve the total number of farmers covered (TotalFarmersCovered) 
-- 		and the sum insured (SumInsured) for each state (srcStateName), ordered by TotalFarmersCovered in descending order.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, SUM(TotalFarmersCovered) AS TotalFarmersCovered, SUM(SumInsured) AS TotalSumInsured FROM FarmersInsuranceData
GROUP BY srcStateName 
ORDER BY TotalFarmersCovered DESC;

-- ###

-- --------------------------------------------------------------------------------------
-- SECTION 2. 
-- Filtering Data (WHERE) [15 Marks]

-- 	Q3.	Retrieve all records where Year is '2020'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT * FROM FarmersInsuranceData 
WHERE srcYear = 2020;

-- ###

-- 	Q4.	Retrieve all rows where the TotalPopulationRural is greater than 1 million and the srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT * FROM FarmersInsuranceData 
WHERE TotalPopulationRural > 1000000 AND srcStateName = 'HIMACHAL PRADESH';

-- ###

-- 	Q5.	Retrieve the srcStateName, srcDistrictName, and the sum of FarmersPremiumAmount for each district in the year 2018, 
-- 		and display the results ordered by FarmersPremiumAmount in ascending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, srcDistrictName, SUM(FarmersPremiumAmount) AS TotalFarmersPremium FROM FarmersInsuranceData 
WHERE srcYear = 2018 
GROUP BY srcStateName, srcDistrictName 
ORDER BY TotalFarmersPremium ASC;

-- ###

-- 	Q6.	Retrieve the total number of farmers covered (TotalFarmersCovered) and the sum of premiums (GrossPremiumAmountToBePaid) for each state (srcStateName) 
-- 		where the insured land area (InsuredLandArea) is greater than 5.0 and the Year is 2018.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, SUM(TotalFarmersCovered) AS TotalFarmersCovered, SUM(GrossPremiumAmountToBePaid) AS SumOfPremiums FROM FarmersInsuranceData 
WHERE InsuredLandArea > 5.0 AND srcYear = 2018 
GROUP BY srcStateName;
	  
-- ###
-- ------------------------------------------------------------------------------------------------

-- SECTION 3.
-- Aggregation (GROUP BY) [10 marks]

-- 	Q7. 	Calculate the average insured land area (InsuredLandArea) for each year (srcYear).
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcYear, AVG(InsuredLandArea) AS AvgInsuredLandArea FROM FarmersInsuranceData 
GROUP BY srcYear ORDER BY srcYear;

-- ###

-- 	Q8. 	Calculate the total number of farmers covered (TotalFarmersCovered) for each district (srcDistrictName) where Insurance units is greater than 0.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcDistrictName, SUM(TotalFarmersCovered) AS TotalFarmersCovered FROM FarmersInsuranceData 
WHERE InsuranceUnits > 0 
GROUP BY srcDistrictName;

-- ###

-- 	Q9.	For each state (srcStateName), calculate the total premium amounts (FarmersPremiumAmount, StatePremiumAmount, GOVPremiumAmount) 
-- 		and the total number of farmers covered (TotalFarmersCovered). Only include records where the sum insured (SumInsured) is greater than 500,000 (remember to check for scaling).
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, SUM(FarmersPremiumAmount) AS TotalFarmersPremium, SUM(StatePremiumAmount) AS TotalStatePremium, 
SUM(GOVPremiumAmount) AS TotalGOVPremium, SUM(TotalFarmersCovered) AS TotalFarmersCovered FROM FarmersInsuranceData
WHERE SumInsured > 5
GROUP BY srcStateName;

-- Since Scaling_Factor for SumInsured is 100,000; therefore 500,000 / 100,000 = 5.

-- ###

-- -------------------------------------------------------------------------------------------------
-- SECTION 4.
-- Sorting Data (ORDER BY) [10 Marks]

-- 	Q10.	Retrieve the top 5 districts (srcDistrictName) with the highest TotalPopulation in the year 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcDistrictName, TotalPopulation FROM FarmersInsuranceData
WHERE srcYear = 2020
ORDER BY TotalPopulation DESC
LIMIT 5;

-- ###

-- 	Q11.	Retrieve the srcStateName, srcDistrictName, and SumInsured for the 10 districts with the lowest non-zero FarmersPremiumAmount, 
-- 		ordered by insured sum and then the FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, srcDistrictName, SumInsured, FarmersPremiumAmount FROM FarmersInsuranceData
WHERE FarmersPremiumAmount > 0
ORDER BY FarmersPremiumAmount ASC, SumInsured ASC
LIMIT 10;

###

-- 	Q12. 	Retrieve the top 3 states (srcStateName) along with the year (srcYear) where the ratio of insured farmers (TotalFarmersCovered) to the total population (TotalPopulation) is highest. 
-- 		Sort the results by the ratio in descending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, srcYear, SUM(TotalFarmersCovered) AS TotalFarmersCovered, SUM(TotalPopulation) AS TotalPopulation, 
SUM(TotalFarmersCovered) * 1.0 / SUM(TotalPopulation) AS Ratio FROM FarmersInsuranceData
GROUP BY srcStateName, srcYear
ORDER BY Ratio DESC
LIMIT 3;

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 5.
-- String Functions [6 Marks]

-- 	Q13. 	Create StateShortName by retrieving the first 3 characters of the srcStateName for each unique state.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT DISTINCT srcStateName, SUBSTRING(srcStateName, 1, 3) AS StateShortName FROM FarmersInsuranceData;

-- ###

-- 	Q14. 	Retrieve the srcDistrictName where the district name starts with 'B'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT DISTINCT srcDistrictName FROM FarmersInsuranceData
WHERE srcDistrictName LIKE 'B%';

-- ###

-- 	Q15. 	Retrieve the srcStateName and srcDistrictName where the district name contains the word 'pur' at the end.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT DISTINCT srcStateName, srcDistrictName FROM FarmersInsuranceData
WHERE srcDistrictName LIKE '%pur';

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 6.
-- Joins [14 Marks]

-- 	Q16. 	Perform an INNER JOIN between the srcStateName and srcDistrictName columns to retrieve the aggregated FarmersPremiumAmount for districts where the district’s Insurance units for an individual year are greater than 10.
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT d1.srcStateName, d1.srcDistrictName, SUM(d1.FarmersPremiumAmount) AS TotalPremium FROM Farmersinsurancedata AS d1
INNER JOIN Farmersinsurancedata AS d2 ON d1.rowId = d2.rowId
WHERE d1.InsuranceUnits > 10
GROUP BY d1.srcStateName, d1.srcDistrictName
ORDER BY TotalPremium DESC;

-- ###

-- 	Q17.	Write a query that retrieves srcStateName, srcDistrictName, Year, TotalPopulation for each district 
--      and the the highest recorded FarmersPremiumAmount for that district over all available years
-- 		Return only those districts where the highest FarmersPremiumAmount exceeds 20 crores.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT d.srcStateName, d.srcDistrictName, d.srcYear, d.TotalPopulation, d.FarmersPremiumAmount AS HighestPremium FROM FarmersInsuranceData AS d
INNER JOIN ( SELECT srcDistrictName, MAX(FarmersPremiumAmount) AS max_premium FROM FarmersInsuranceData GROUP BY srcDistrictName) AS district_maxes 
ON d.FarmersPremiumAmount = district_maxes.max_premium
WHERE d.FarmersPremiumAmount > 2000
ORDER BY HighestPremium DESC;
-- Since Scaling_Factor for FarmersPremiumAmount is 100,000; therefore 20,00,00,000 / 100,000 = 2000.

-- ###

-- 	Q18.	Perform a LEFT JOIN to combine the total population statistics with the 
--      farmers’ data (TotalFarmersCovered, SumInsured) for each district and state. 
-- 		Return the total premium amount (FarmersPremiumAmount) and the average population count for each district aggregated over the years, 
--      where the total FarmersPremiumAmount is greater than 100 crores.
-- 		Sort the results by total farmers' premium amount, highest first.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT fid.srcStateName, fid.srcDistrictName, SUM(fid.FarmersPremiumAmount) AS TotalPremium, AVG(fid.TotalPopulation) AS AveragePopulation
FROM FarmersInsuranceData AS fid
LEFT JOIN FarmersInsuranceData AS fid2 ON fid.rowId = fid2.rowId
GROUP BY fid.srcStateName, fid.srcDistrictName
HAVING SUM(fid.FarmersPremiumAmount) > 10000
ORDER BY TotalPremium DESC;
-- Since Scaling_Factor for FarmersPremiumAmount is 100,000; therefore 100,00,00,000 / 100,000 = 10,000.

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 7.
-- Subqueries [10 Marks]

-- 	Q19.	Write a query to find the districts (srcDistrictName) where the TotalFarmersCovered is greater than the 
--       average TotalFarmersCovered across all records.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT DISTINCT srcDistrictName FROM FarmersInsuranceData
WHERE TotalFarmersCovered > (SELECT AVG(TotalFarmersCovered) FROM FarmersInsuranceData)
ORDER BY srcDistrictName;

-- ###

-- 	Q20.	Write a query to find the srcStateName where the SumInsured is higher than the SumInsured of the district with the highest FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName FROM FarmersInsuranceData
GROUP BY srcStateName
HAVING SUM(SumInsured) > (
    SELECT SUM(SumInsured)
    FROM FarmersInsuranceData
    GROUP BY srcdistrictName
    ORDER BY SUM(FarmersPremiumAmount) DESC
    LIMIT 1
)
ORDER BY srcStateName;

-- ###

-- 	Q21.	Write a query to find the srcDistrictName where the FarmersPremiumAmount is higher than the 
--       average FarmersPremiumAmount of the state that has the highest TotalPopulation.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT DISTINCT srcDistrictName
FROM FarmersInsuranceData
WHERE FarmersPremiumAmount > (
    SELECT AVG(FarmersPremiumAmount)
    FROM FarmersInsuranceData
    WHERE srcStateName = (
        SELECT srcStateName
        FROM FarmersInsuranceData
        GROUP BY srcStateName
        ORDER BY SUM(TotalPopulation) DESC
        LIMIT 1
    )
);

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 8.
-- Advanced SQL Functions (Window Functions) [10 Marks]

-- 	Q22.	Use the ROW_NUMBER() function to assign a row number to each record in the dataset ordered by total farmers covered in descending order.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT TotalFarmersCovered, ROW_NUMBER() OVER (ORDER BY TotalFarmersCovered DESC) AS RowNum 
FROM FarmersInsuranceData;

-- ###

-- 	Q23.	Use the RANK() function to rank the districts (srcDistrictName) based on the SumInsured (descending) and 
--       partition by alphabetical srcStateName.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

-- SELECT srcStateName, srcDistrictName, SumInsured, RANK() OVER (PARTITION BY srcStateName ORDER BY SumInsured DESC) AS DistrictRankInState 
-- FROM FarmersInsuranceData;

SELECT srcStateName, srcDistrictName, SUM(SumInsured) AS TotalSumInsured, RANK() OVER (PARTITION BY srcStateName ORDER BY SUM(SumInsured) DESC) AS DistrictRank 
FROM FarmersInsuranceData
GROUP BY srcStateName, srcDistrictName
ORDER BY srcStateName ASC, DistrictRank ASC;

-- ###

-- 	Q24.	Use the SUM() window function to calculate a cumulative sum of FarmersPremiumAmount for each district (srcDistrictName), 
--       ordered ascending by the srcYear, partitioned by srcStateName.
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, srcDistrictName, srcYear, FarmersPremiumAmount, 
SUM(FarmersPremiumAmount) OVER (PARTITION BY srcStateName, srcDistrictName ORDER BY srcYear ASC) AS CumulativeSumOfPremium
FROM FarmersInsuranceData;

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 9.
-- Data Integrity (Constraints, Foreign Keys) [4 Marks]

-- 	Q25.	Create a table 'districts' with DistrictCode as the primary key and columns for DistrictName and StateCode. 
-- 		Create another table 'states' with StateCode as primary key and column for StateName.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

CREATE TABLE States (
StateCode INT PRIMARY KEY,
StateName VARCHAR(255)
);

CREATE TABLE Districts (
DistrictCode INT PRIMARY KEY,
DistrictName VARCHAR(255),
StateCode INT
);

-- ###

-- 	Q26.	Add a foreign key constraint to the districts table that references the StateCode column from a states table.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

ALTER TABLE Districts
ADD CONSTRAINT
FOREIGN KEY (StateCode)
REFERENCES States(StateCode);

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 10.
-- UPDATE and DELETE [6 Marks]

-- 	Q27.	Update the FarmersPremiumAmount to 500.0 for the record where rowID is 1.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

UPDATE FarmersInsuranceData
SET FarmersPremiumAmount = 500.0
WHERE rowID = 1;

-- ###

-- 	Q28.	Update the Year to '2021' for all records where srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SET SQL_SAFE_UPDATES = 0;

UPDATE FarmersInsuranceData
SET srcYear = 2021
WHERE srcStateName = 'HIMACHAL PRADESH';

-- ###

-- 	Q29.	Delete all records where the TotalFarmersCovered is less than 10000 and Year is 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
DELETE FROM FarmersInsuranceData
WHERE TotalFarmersCovered < 10000 AND srcYear = 2020;

-- ###