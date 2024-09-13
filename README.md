# SQL Portfolio

Welcome to my SQL Portfolio! This repository showcases a collection of SQL-based projects demonstrating my skills in database management, data manipulation, and analysis. Each project utilizes SQL queries to extract, clean, and analyze data from various datasets, offering practical insights and solutions for real-world scenarios.

Projects Overview

- **Project 1: Stars Database**
   
    In this project, I focused on creating and managing a database of stars that are closest to our solar system. Initially, I set up two tables: STARS and STARSINFO. The STARS table 
    includes columns for the star's ID, name, and mass, while the STARSINFO table contains columns for ID, star color, distance from Earth, and magnitude.

    I started by populating the STARS table with data on various stars, including their names and masses. For example, stars like Proxima Centauri and Sirius A were added with their 
    respective masses. Following this, I inserted data into the STARSINFO table, detailing the color, distance, and magnitude of each star. This included adding information such as 
    Proxima Centauri being a red star with a distance of 4.24 light years.

    With the tables filled, I performed several queries to analyze the data. I began by counting the number of stars by their color, revealing a total of 26 red stars, 9 yellow stars, 
    5 orange stars, 2 brown stars, 2 blue stars, and 2 white stars in our dataset. I then ordered the stars by their mass, identifying Sirius A as the largest star with a mass of 2.063 
    times that of the Sun and WISE 1049-5319 as the smallest.

    Next, I ordered the stars by their distance from Earth, joining the STARS and STARSINFO tables to combine the relevant data. This revealed that Proxima Centauri is the closest star 
    at 4.24 light years, while WISE 1506+7027 is the farthest at 16.85 light years. I also focused specifically on orange stars, determining that Proxima Centauri B is the closest 
    orange star and Epsilon Indi is the farthest.

    I retrieved detailed information about a particular star, Procyon A, finding that it is a white star with a mass of 1.499 times the Sun's mass, a distance of 11.4 light years, and 
    a magnitude of 0.34. Furthermore, I identified stars with masses greater than the Sun's, such as Sirius A and Procyon A, and ordered them by their mass.

    I then looked for the yellow star with the largest magnitude and found that GI 234 B had the largest magnitude of 14.23 among yellow stars. During my review, I discovered a mistake 
    where GI 437 B should have been GI 473 B. I corrected this error by updating the STARS table.

    The project demonstrated how to manage and query a star database effectively, highlighting key stars and correcting data inaccuracies to maintain the integrity of the information.

- **Project 2: Covid 19 Database**

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
  
- **Project 3: Nashville Housing DB Cleaning**
  
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

- **Project 4: Football Database**
    
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

- **Project 5:** In the lab, stay tuned!

- **Project 6:** Brewing up some data, watch this space!
    
## Each project contains the following:

- **SQL** files with the queries used for the analysis.

If you have any questions or feedback, feel free to reach out!
