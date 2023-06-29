# Marketing-Spending-Analysis
- Title: Marketing Spending Analysis
- Created by: Ajinkya Andraskar
- Date: 29-06-2023
- Tool used: Microsoft SQL Server Management Studio

# Introduction:

- In this project, we will analyze marketing spending data to gain insights into the effectiveness of various campaigns. 
- We will utilize SQL to extract, transform, and analyze the data.
- The analysis will help us understand the factors influencing campaign performance and provide recommendations for improvement.
- We will examine the relationship between different variables such as campaign date, revenue, conversion rates, and average order values and geographic targeting.

# Data:

We will use the 'marketing' database, which contains information on marketing campaigns. The dataset includes the following columns:

- Date: Date of spending of the marketing budget
- Campaign name: Description of the campaign
- Category: Type of marketing source
- Campaign id: Unique identifier for the campaign
- Impressions: Number of times the ad has been shown
- Mark. budget: Money spent on this campaign on this day
- Clicks: How many people clicked on a banner (=visited website)
- Leads: How many people signed up and left their credentials
- Orders: How many people paid for the product
- Revenue: How much money we earned
- Geotype: Type of geographic location (e.g., Borough, CD, Citywide, UHF42)
- Geo join id: Unique identifier for the geographic location
- Geo place name: Name of the geographic location.

# Approach:

- Acquire the marketing spending data from the 'marketing' database.
- Import the data into a SQL database.
- Use SQL queries to clean the data, removing duplicate records, handling missing values, and standardizing data formats.
- Utilize SQL to extract relevant information from the data, such as total spending, revenue, impressions, clicks, leads, and orders.
- Analyze the datasets using advanced SQL queries and functions to calculate various marketing metrics.
- Calculate metrics such as Return on Marketing Investment (ROMI), Cost per Click (CPC), Cost per Lead (CPL), Customer Acquisition Cost (CAC), Average Order Value (AOV), Conversion Rate 1, and Conversion Rate 2.
- Examine the performance of campaigns based on the date, identifying the dates with the highest spending, highest revenue, and varying conversion rates. Calculate average order values for different dates.
- Analyze buyer activity, comparing average revenue on weekdays and weekends.
- Evaluate the effectiveness of different types of campaigns, such as social, banner, influencer, or search.
- Determine the better geographic locations for targeting, comparing boroughs, CDs, citywide, and UHF42.
- Interpret the results and provide recommendations for improving campaign effectiveness.
- Use the insights gained from the analysis to make data-driven decisions and drive business improvements.

# SQL Functions Used:

- DDL (Data Definition Language)
- DML (Data Manipulation Language)
- Joins (including multiple joins)
- Subqueries (including nested subqueries)
- Case statements
- Logical conditions
- Window functions

# Metrics Analyzed:

- Return on Marketing Investment (ROMI):
   > Return on marketing investments, how effective is marketing campaign, one metric that shows effectiveness of every rupee spent. It is calculated  It is calculated ( Total earning (Revenue) - Marketing cost ) / Marketing cost ).
- Cost per Click (CPC):
   > How much does it cost us to attract 1 click (on average) (Marketing spending/Clicks).
- Cost per Lead (CPL):
   > How much does it cost us to attract 1 lead (on average) (Marketing spending/Leads).
- Customer Acquisition Cost (CAC):
   > How much does it cost us to attract 1 order (on average)(marketing spend/ orders).
- Average Order Value (AOV):
   > Average order value for this campaign (Revenue/Number of Orders).
- Conversion Rate 1:
   > Conversion from visitors to leads for this campaign (Leads/Click).
- Conversion Rate 2:
   > Conversion rate from leads to sales (Orders/Leads).
- Click-through Rate (CTR):
   > Percentage of people who clicked at banner (Clicks/ Impressions).
- Gross Profit
   > Profit or loss after deducting marketing cost (Revenue-Marketing spending).

These metrics provide actionable insights for evaluating campaign effectiveness and making informed business decisions.
