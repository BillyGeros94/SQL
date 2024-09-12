# SQL Portfolio

Welcome to my SQL Portfolio! This repository showcases a collection of SQL-based projects demonstrating my skills in database management, data manipulation, and analysis. Each project utilizes SQL queries to extract, clean, and analyze data from various datasets, offering practical insights and solutions for real-world scenarios.

Projects Overview

- **Project 1: Stars Database**
   
    In this project, I created a basic SQL database containing information about the stars closest to our solar system. The project began with the creation of two tables: one named stars, which held the id, the names of the stars and their mass relative to the sun, and another called starsinfo, which included additional details such as the star’s id, color, distance from the solar system, and magnitude. Each column was assigned the appropriate data format to ensure accuracy and easy manipulation.

    After defining the structure, I manually inserted the star data into both tables and used SQL queries to display the data as tables for visual representation and to ensure correctness. Once the data was in place, I started exploring it using basic queries. One of the first queries involved counting the number of stars by their color using the COUNT() aggregate function, returning the result as colournumber. Next, I ordered the stars by their mass in descending order, which allowed me to quickly identify both the largest and smallest stars near our solar system.

    To analyze distance, I joined the stars and starsinfo tables on their id column, returning the name, color, and distance of each star. By ordering this data in ascending order, I was able to determine which star was the closest to our solar system and which one was the furthest. Following this, I applied a filter to the same query to return only orange stars, allowing for a deeper exploration of stars of a specific color.

    To gather information on a particular star, I joined the two tables again and filtered the results by the star’s name. I also ran a query to return the names and masses of stars with a mass greater than the sun, ordering them by mass in descending order to see which stars were most massive. Another query focused on identifying the yellow star with the largest magnitude by filtering for yellow-colored stars and ordering the results by magnitude in descending order.

    During the data analysis, I noticed an error in the star names, where one star had been incorrectly labeled. Using the UPDATE statement, I corrected the name and wrote a query to verify that the change had been successfully made, ensuring the database now reflected the correct information.

    Overall, this project involved basic database operations like table creation, data insertion, JOINs, filtering, and data updates, offering a simple yet insightful exploration of the closest stars to our solar system using SQL.

- **Project 2: Covid 19 Database**

    In this project, I imported a COVID-19 database and began by writing a query to visualize and get a glimpse of the available data. I then extracted data about COVID-19 cases per country by selecting the location and population, using the MAX() aggregate function to calculate the total number of cases, labeled as total_cases. I also filtered out data for continents by ensuring the continent column was NULL. The results were grouped by location and population to allow the aggregate function to work properly, and the output was ordered by total cases in descending order.

    Next, I wrote a similar query to retrieve countries and their populations, this time ordering the results by population in descending order. After observing that countries with the highest number of COVID-19 cases generally had large populations, I decided that a more meaningful metric would be the proportion of cases relative to the population. In the following query, I used the MAX() function again to get the total cases, then divided it by the population and multiplied the result by 100 to calculate the percentage of total cases relative to the population. This result, labeled as total_cases_percentage, was also ordered in descending order, providing deeper insights into how COVID-19 affected different countries. I replicated this query but filtered specifically for Greece to focus on the country's data.

    To gain further insights, I used the MAX() function to calculate the total deaths for each country and then wrote a query to calculate the death rate (deaths per case) for all countries. This allowed me to see how many people died relative to the number of cases. I repeated this analysis specifically for Greece. Additionally, I calculated the mortality rate for each country, which represented the number of deaths per population, and conducted the same analysis on a continental level to see how the continents compared.

    Shifting my focus entirely to Greece, I extracted all COVID-19 data related to the country. I identified the date when the first COVID-19 case appeared in Greece and how many cases were reported on that day. I applied the same approach to find the date and number of the first reported deaths. Similarly, I queried the data to determine when vaccinations began and how many were administered on the first day.

    Finally, I wrote a series of queries θsing the SUM() aggregate function to compare the number of cases, deaths, and the death rate in Greece before and after vaccinations. This comparison allowed me to evaluate the impact of vaccinations on the spread of the virus and the overall death rate, providing valuable insights into the effectiveness of the vaccination campaign and the pandemic's progression over time.
  
- **Project 3: Nashville Housing DB Cleaning**
  
    This project involved cleaning and formatting a Nashville housing dataset using various SQL techniques. Here's a breakdown of the steps taken:

    First, I explored the data to get a general understanding of its structure. Then, I standardized the date format using the CONVERT() function to ensure consistency across all entries.

    Next, I addressed missing values in the PropertyAddress column. Some properties with the same ParcelID had a PropertyAddress, while others were missing it. To fill in these missing addresses, I used a self-join on the table, matching rows with the same ParcelID but different UniqueID. By filtering the rows with missing addresses, I was able to pull the correct PropertyAddress from those with the same ParcelID and update the PropertyAddress column using the ISNULL() function.

    After that, I split the PropertyAddress into separate columns for Address, City, and State. Using the SUBSTRING(), CHARINDEX(), and LEN() functions, I extracted the relevant parts of the address and updated the table with these new values.

    For the OwnerAddress column, I took a different approach. I used the PARSENAME() function to split the string based on periods, but since the address data used commas, I first replaced commas with periods using the REPLACE() function. This allowed me to efficiently split the data and insert it into newly created columns.

    In the SoldAsVacant column, where 0 and 1 were used to represent "No" and "Yes," I changed the data type from BIT to NVARCHAR() and used a CASE statement to replace 0 with "No" and 1 with "Yes" for better readability.

    To remove duplicate records, I used the ROW_NUMBER() function. This function assigned a unique number to each row, partitioned by key columns like ParcelID, PropertyAddress, SaleDate, and others. Rows with the same partition values were considered duplicates, and I kept only the first occurrence by deleting rows where the row number was greater than 1.

    Finally, I cleaned up the dataset by deleting unused columns, streamlining the data for future analysis. A final SELECT query was run to verify the results and ensure all changes had been applied correctly.

    This comprehensive cleaning process enhanced the overall quality and usability of the Nashville housing data.

- **Project 4: Football Database**
    
    In this project, I utilized a comprehensive football database from Transfermarkt to extract and analyze football data. The database, which includes tables on clubs, players, games, and player valuations, provided a robust framework for my analysis.

    I started by querying basic data from key tables like appearances, club games, clubs, and players to get an overview of the dataset. Using SELECT, I retrieved all columns from these tables to understand their structure and content.

    My focus then shifted to Chelsea Football Club. By joining the clubs and players tables on club_id, I gathered information about the team’s average player age, stadium details, and player positions for the 2023 season. I filtered the data to focus on Chelsea and their manager, Mauricio Pochettino, and sorted players by position using ORDER BY.

    To evaluate Chelsea’s performance in the 2023/24 season, I joined the clubs and club_games tables and used SUM to aggregate goals scored and conceded, grouping the results by club name. This analysis provided a clear picture of the team's overall performance.

    I examined Chelsea’s Premier League home games by joining clubs, club_games, and games tables. I calculated average goals scored and conceded using COUNT and SUM, and analyzed formations and performance metrics with GROUP BY.

    For player statistics, I aggregated yellow cards, red cards, goals, assists, and minutes played using SUM. I paid special attention to Michael Olise, compiling his performance data with GROUP BY and SUM.

    In analyzing El Clasico matches, I joined relevant tables and used WHERE clauses to filter for games between Real Madrid and FC Barcelona. This provided insights into game results, player stats, and formations for these high-profile matches.

    Lastly, I identified the top 5 most valuable Bundesliga players by joining clubs, player_valuations, and players tables. I sorted players by market value and filtered for the 2023 season, highlighting the top valuations as of May 29, 2024.

    This project allowed me to perform a thorough analysis of team and player performance, tactical approaches, and market valuations in football, using SQL queries to derive valuable insights.

- **Project 5:** In the lab, stay tuned!

- **Project 6:** Brewing up some data, watch this space!
    
## Each project contains the following:

- **SQL** files with the queries used for the analysis.

If you have any questions or feedback, feel free to reach out!
