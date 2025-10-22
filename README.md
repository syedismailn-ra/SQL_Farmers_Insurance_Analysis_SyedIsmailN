PREREQUISITES:

MySQL Workbench, Structured Query Language (SQL)



PROBLEM STATEMENT & OBJECTIVE:

The Pradhan Mantri Fasal Bima Yojana (PMFBY) scheme provides insurance protection to farmers against crop losses. The key objective of our project was to analyze the effectiveness and implementation of this scheme by using structured SQL queries. The focus was to extract actionable insights from multi-year data regarding insurance units, premiums, and demographic coverage.


The goal was to develop database skills such as performing JOINs, GROUP BY, subqueries, filtering, aggregation, and reporting using SQL. Our analysis supports government and insurance providers in evaluating the success and outreach of the scheme.
 
KEY INSIGHTS:
This analysis of Farmers Insurance data under the PMFBY scheme reveals state and district-level patterns in coverage, premiums, and policy reach. The dataset covers 25 states and 2 Union Territories, with premiums reported in lakh INR and land area in hectares.
Based on the analysis of the PMFBY insurance data, here are the key insights:
•	Top Performing States: The analysis consistently identified states like Madhya Pradesh, Maharashtra, and Uttar Pradesh as top performers in the total number of farmers covered and sum insured. In contrast, Punjab, Goa and Gujarat reported lowest performance and minimal participation, covering only a few hundred farmers.

•	Effective Insurance Penetration: When comparing the number of insured farmers to the total population, Chhattisgarh (in 2021) and Tripura (in both 2020 and 2021) demonstrated the highest ratios, indicating highly effective scheme implementation and outreach in those periods.

•	High-Value Premium Districts: While many districts contributed to the scheme, only a select few generated exceptionally high premium amounts. At the district level, Ujjain (Madhya Pradesh) ranked highest in farmer premiums, while Karnataka districts showed zero contributions, suggesting subsidy dependence or gaps. Anomalies like Karnataka’s low insured sums warrant data checks.

•	Population vs. Coverage Gaps: Population analysis shows the most populous districts, such as Bengaluru Urban, Pune, and Thane, were not always the ones with the highest number of insured farmers, suggesting potential gaps in insurance outreach in densely populated areas.

•	Insurance Coverage Trends: The average insured land area for each year showed an increasing trend from 2018 to 2020, peaking in 2020 with average insured land reaching 46.92 hectares. This metric may warrant further investigation into cropping patterns or policy changes.
 
ASSUMPTIONS:

•	All monetary figures (e.g., SumInsured, FarmersPremiumAmount) are scaled up by 100,000 (from lakh INR) to report in standard Indian Rupees (INR).

•	Land area is measured and reported directly in hectares.

•	Premium funding figures combine farmer, state, and government contributions accurately from reported columns.

•	Population figures used are consistent across years unless stated otherwise.

•	District-level population counts are treated as it is (raw population values).

•	Missing or NULL values in the dataset were either excluded from calculations or treated as zero to maintain data integrity during aggregations.


CONCLUSION:

The PMFBY scheme has made significant strides in reaching farmers, but clear disparities exist across states and districts. SQL-based data analysis helped us uncover gaps in coverage, highlight high-performing areas, and recommend areas for improvement. This approach enables data- driven decision-making for policy enhancement, improved resource allocation, and greater financial protection for farmers.


RECOMMENDATIONS:

To improve reach, the scheme should focus on underperforming states, replicate successful models from Chhattisgarh and Tripura, and ensure better data accuracy. Sustaining gains in high-performing states will further strengthen agricultural risk coverage nationwide.
