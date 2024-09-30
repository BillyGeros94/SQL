# SQL Portfolio

Welcome to my SQL Portfolio! This repository showcases a collection of SQL-based projects demonstrating my skills in database management, data manipulation, and analysis. Each project utilizes SQL queries to extract, clean, and analyze data from various datasets, offering practical insights and solutions for real-world scenarios.

Projects Overview

- **Project 1: Football Scout**
   
    In this project, we operated as a football scout, leveraging a comprehensive player dataset to identify potential signings that would meet the specific needs of our club. We began 
    by thoroughly exploring the data to understand the available player attributes and performance metrics. This initial step was crucial for tailoring our queries to find players who 
    not only fit within our financial constraints but also aligned with the tactical style we wished to implement on the pitch.

    For each key position we aimed to fill—Right Wing Back, two Centre Backs, a Defensive Midfielder, a Central Midfielder, a Winger, and a Forward—we established clear criteria that 
    focused on both defensive and offensive contributions. For the Right Wing Back, we prioritized players who demonstrated exceptional pace and covered significant distances, alongside 
    strong defensive metrics such as tackles won and interceptions. We also looked for good attacking output, assessing metrics like crossing accuracy and assists. The SQL query we 
    crafted enabled us to filter for candidates who excelled in these areas, ensuring we identified the best options.

    When searching for Centre Backs, we emphasized physical attributes, particularly height, requiring players to be over 6 feet tall. We also prioritized defensive solidity, looking 
    for metrics that demonstrated dominance in aerial duels, along with solid passing abilities. This systematic approach allowed us to pinpoint strong, effective defenders who could 
    not only protect the backline but also contribute to build-up play.

    For the Defensive Midfielder, our focus was on players who could cover large areas of the pitch while excelling in defensive metrics like tackles and interceptions. We required 
    strong passing abilities to ensure they could effectively distribute the ball and maintain possession. Similarly, when scouting for a Central Midfielder, we sought a creative risk- 
    taker, someone who could play vertically and provide key passes despite possibly having lower passing accuracy. This creative approach was critical for enhancing our attacking play.

    In our search for a Winger, we looked for players who could score goals and create chances through dribbling and passing. Key performance metrics such as goals, expected goals, 
    assists, and key passes guided our selection process, allowing us to find wingers who would fit seamlessly into our attacking strategy. Finally, for the Forward position, we aimed 
    to identify players with a blend of playmaking and goal-scoring abilities, ensuring they could contribute to both aspects of our attack.

    Overall, this project showcased a comprehensive methodology that integrated clear positional needs with data-driven analysis. By utilizing targeted SQL queries, we systematically 
    identified players who not only fit our financial limitations but also enhanced our tactical philosophy. This structured approach to scouting will support informed decision-making 
    in the transfer market, enabling us to build a competitive and cohesive squad for the upcoming season.

- **Project 2: Covid 19**

    For this project, I worked with COVID-19 data from Our World in Data to analyze global trends and dive deep into specific metrics for Greece. I started by looking at total cases 
    per 
    country and quickly realized that while countries like the U.S., China, and India had the highest numbers, this wasn’t a fair comparison because of population differences. So, I 
    shifted to a more insightful metric: total cases as a percentage of the population. This showed countries like Cyprus, Brunei, and Austria as having the highest case percentages.

    I then focused on Greece, where I found that 54.2% of the population had contracted COVID-19, with 5,635,901 total cases. Wanting to dig deeper, I explored global death rates, 
    identifying countries like the U.S. and Brazil as having the highest absolute numbers. But when I looked at deaths per case, countries such as Yemen and Sudan showed the highest 
    rates. For Greece, the death rate stood at 0.69%, with 39,019 deaths. I also calculated the mortality rate (deaths per population), and Greece had a rate of 0.37%, compared to more 
    severely affected countries like Peru and Bulgaria.

    Next, I examined data at the continental level, discovering that Africa had the highest death rate at 2.5%, followed by South America. From there, I zoomed in on Greece’s timeline. 
    The first cases appeared in early March 2020, and the first deaths soon followed. I was particularly interested in understanding the effect of vaccinations on Greece’s pandemic 
    response. The first vaccinations started on December 28, 2020, and before that, the death rate was 2.3%, with 12,214 deaths out of 521,502 cases. After vaccinations, even though 
    the 
    total cases surged, the death rate dropped significantly to 0.5%, proving how effective the vaccination campaign was in reducing fatalities.

    This project allowed me to see the pandemic’s impact from a global perspective but also gave me the chance to focus on Greece, my area of interest, and highlight how critical 
    interventions like vaccinations can make a huge difference in public health outcomes.
  
- **Project 3: Nashville Housing**
  
    For this project, I worked with the Nashville Housing dataset, focusing on data cleaning and standardization using SQL. I began by loading the dataset to get an initial overview. 
    The first task was to standardize the SaleDate column, converting it into a consistent Date format for future queries and analysis.

    I then addressed the issue of missing property addresses by identifying rows where the PropertyAddress column was NULL. Observing that properties with the same ParcelID often 
    shared 
    the same address, I joined the dataset on ParcelID to find rows with missing addresses but valid addresses in other rows with the same ParcelID. I updated the missing 
    PropertyAddress values by copying addresses from other rows with the same ParcelID, ensuring that all properties had complete address information.

    Next, I split the PropertyAddress column into two separate columns: Address and City. Using string manipulation functions, I extracted the part of the address before the comma as 
    Address and the part after as City. I then created these new columns and populated them with the respective data. Similarly, I broke down the OwnerAddress column into OwnAddress, 
    OwnCity, and OwnState. Since the PARSENAME function is designed to parse strings by dots, I first replaced commas with periods to allow PARSENAME to correctly split the addressinto 
    its components. I added three new columns for the separated owner address, city, and state data.

    After cleaning the addresses, I addressed the SoldAsVacant column, which contained binary values 0 and 1. I changed the column's datatype from bit to nvarchar(50) and used a CASE 
    statement to replace 0 with 'No' and 1 with 'Yes', making the data more intuitive.

    I then tackled duplicate rows in the dataset. Using the ROW_NUMBER() function, I partitioned the data by key columns such as ParcelID, PropertyAddress, SaleDate, SalePrice, and 
    LegalReference. This allowed me to identify and retain only the first occurrence of each unique row, deleting others where ROW_NUMBER() indicated duplicates. In total, 104 
    duplicate rows were identified and removed.

    Finally, I simplified the dataset by dropping columns that were no longer necessary, specifically the original PropertyAddress, OwnerAddress, and TaxDistrict columns. These columns 
    were either redundant or their data had already been transformed into new columns. This cleanup made the dataset more streamlined and manageable for further analysis or reporting.

    By the end of the project, the Nashville Housing dataset was thoroughly cleaned, standardized, and organized, ready for any subsequent analysis or reporting tasks.

- **Project 4: Football**
    
   For this project, I used a football database with data from Transfermarkt to explore key stats, trends, and make data-driven decisions. The project starts with a general overview of 
   the available data across tables like appearances, clubs, games, players, and more. I then dove into specific insights, beginning with the total number of clubs and players, 
   revealing that the database contains 426 football clubs and 29,875 players.

   I focused on Chelsea Football Club, examining its squad, stadium, and roster for the 2023 season. Chelsea’s home ground, Stamford Bridge, has a capacity of 40,853 seats, and their 
   roster includes 32 players with an average age of 23.6 years. To assess Chelsea's performance under manager Mauricio Pochettino, I analyzed their results for the 2023/24 season. 
   Chelsea scored a total of 107 goals but conceded 76, signaling strong offensive potential but defensive weaknesses. I then looked specifically at Chelsea's home games in the Premier 
   League for the 22/23 season, finding that the club used the 4-2-3-1 formation 16 times and the 3-4-2-1 formation 3 times. On average, Chelsea scored 2 goals per home game and 
   conceded 1, indicating decent home form.

   Moving on to individual player stats, Cole Palmer emerged as Chelsea's standout player with 22 goals and 11 assists, making him the team's top scorer and assist provider. Conor 
   Gallagher had the most minutes played at 3,136, while Moisés Caicedo led the squad with 12 yellow cards. Malo Gusto and Reece James were the only Chelsea players with red cards. 
   Cole 
   Palmer also had the highest market value, at €80,000,000.

   I then shifted focus to Michael Olise, examining his overall career stats. Olise has scored 30 professional goals, assisted 48, and collected 12 yellow cards with no red cards, 
   showcasing his discipline and attacking contributions.

   To add more context, I also analyzed El Clásico, the famous rivalry between Real Madrid and Barcelona, focusing on match results and player performances. Lionel Messi leads the 
   historical El Clásico stats with 26 goals and 8 assists, followed by Karim Benzema with 24 goals and 14 assists. Cristiano Ronaldo and Luis Suárez also feature prominently with 
   impressive goal tallies. Vinícius Júnior, a more recent star, has 14 goals and 8 assists.

   Finally, I explored the Bundesliga to identify the top 5 most valuable players as of May 2024. Florian Wirtz ranks as the most valuable player with a valuation of €130,000,000, 
   followed by Jamal Musiala, Harry Kane, Xavi Simons, and Leroy Sané.

   Overall, this project allowed me to examine football clubs, players, and competitions, making use of SQL to derive meaningful insights and trends from the data. It provides a solid 
   foundation for further analysis and decision-making in the world of football.

- **Project 5: Stocks Performance**

    In this SQL portfolio project, I focused on analyzing stock performance data from a database. Initially, I queried the entire stock prices table to understand its structure and 
    contents, which included attributes like date, ticker symbols, opening and closing prices, and trading volumes.

    I implemented several queries to filter data for specific use cases, such as retrieving stock data within a defined date range and focusing on individual stocks like Apple (AAPL) 
    and Microsoft (MSFT). I also examined stocks based on industry and country, allowing me to identify trends within specific sectors, particularly in the tech industry.

    Key analyses included calculating daily percentage changes, or daily returns, for individual stocks, and applying a 7-day moving average to smooth out fluctuations. I identified 
    the top five stocks with the highest trading volumes, calculated dividend yields, and analyzed stocks that underwent splits to understand their post-split prices.

    To enhance the analysis, I computed the average closing price over specific periods, identified the highest and lowest prices, and calculated monthly averages. I also examined 
    stocks with consistent growth and those that had not paid dividends.

    Using a Common Table Expression (CTE), I identified the stock with the highest percentage gain in 2023, which was NVIDIA, showing a remarkable 1124% increase. Additionally, I 
    compared stock performance by industry, revealing which sectors outperformed others.

    To streamline my queries, I created a view called Stock_Performance that encapsulated daily return calculations, making it easier to retrieve data without rewriting SQL code. 
    Finally, I demonstrated the use of stored procedures by creating one to calculate daily returns for specific tickers, allowing for quick execution without exposing the underlying 
    SQL details.

    Overall, this project showcased a comprehensive analysis of stock performance data, employing various SQL techniques to extract meaningful insights and facilitate informed 
    decision-making based on market behavior.

- **Project 6: Seattle Airbnb**
  
    This SQL portfolio project analyzes Seattle Airbnb data using a structured series of queries, progressing from basic to intermediate and a few advanced techniques. The project 
    begins with simple data exploration by selecting all data from the calendar, listings, and reviews tables to understand the dataset’s structure. From there, I perform basic queries 
    like filtering listings with prices below $100 and counting the total number of listings per room type using the GROUP BY clause, providing insights into pricing distribution and 
    room type availability.

    The analysis deepens with an average price calculation by neighborhood, highlighting which areas are more expensive. Then, I examine the availability of listings on a specific date 
    by joining the calendar and listings tables, filtering for available listings, and sorting by price to show which properties are open on that date. The review analysis involves 
    counting reviews per listing and identifying hosts with multiple listings, providing insights into both customer engagement and host activity.

    Further queries explore pricing patterns, identifying the top 5 most expensive listings, and calculating the average number of reviews per neighborhood to gauge customer interest. I 
    also break down total listings and average price by both room type and neighborhood, offering a detailed view of market distribution and pricing trends across room types in 
    different neighborhoods.

    In the intermediate and advanced sections, I calculate the total reviews for hosts across all their listings and track the cumulative number of reviews over time using a Common 
    Table Expression (CTE). Advanced queries include using CTEs and window functions to rank listings by price within each neighborhood, identifying the most expensive listing in each 
    area. Additionally, I find hosts with listings in multiple neighborhoods, showcasing those with a diverse portfolio across the city.

    Throughout the project, I balance basic SQL techniques such as filtering, grouping, and joins, with more advanced features like CTEs and window functions to extract meaningful 
    insights. The project culminates in a well-rounded analysis of Seattle’s Airbnb market, providing insights into pricing, availability, and host behaviors.
    
## Each project contains the following:

- **SQL** files with the queries used for the analysis.

If you have any questions or feedback, feel free to reach out!
