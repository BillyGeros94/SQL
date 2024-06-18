--FOR THIS PROJECT WE USED DATA FROM 
--https://github.com/owid/covid-19-data/tree/master/public/data
--FOR THE COVID-19 PANDEMIC

--LET'S SEE OUR DATA FIRST

SELECT *
FROM Covid_Data

--TOTAL COVID-19 CASES PER COUNTRY

SELECT location, population, max(total_cases) AS Total_Cases
FROM Covid_Data
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY Total_Cases DESC

--AS WE CAN SEE THE TOP 5 COUNTRIES WITH THE MOST COVID-19 CASES UP TO DATE ARE
--(UNITED STATES - 103436832), (CHINA - 99359000), (INDIA - 45039512), (FRANCE - 38997488) AND (GERMANY - 38437756)

--BUT AS WE CAN SEE BELOW THOSE COUNTRIES ALSO HAVE HIGH POPULATION NUMBERS, SO THE TOTAL CASES ISN'T A GOOD METRIC TO CALCULATE
--IF WE WANT CHECK THE EFFICIENCY OF THE MEASURES TAKEN BY THE GOVERMENTS 

SELECT location, population
FROM Covid_Data
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY population DESC

--TOTAL COVID-19 CASES PER POPULATION IS A BETTER METRIC TO USE 

SELECT location, population, max(total_cases) AS Total_Cases, max(total_cases)/ population * 100 AS Total_Cases_Percentage
FROM Covid_Data
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY Total_Cases_Percentage DESC

--NOW WE CAN SEE THAT COUNTRIES LIKE 
--(CYPRUS - 77.1%), (BRUNEI - 76.7%), (SAN MARINO - 75%), (AUSTRIA - 68%) AND (SOUTH KOREA - 66.7%)
--ARE THE ONES WITH THE MOST COVID-19 CASES ACCORDING TO THEIR POPULATION NUMBERS

--TOTAL COVID-19 CASES FOR (GREECE)

SELECT location, population, max(total_cases) AS Total_Cases, max(total_cases)/ population * 100 AS Total_Cases_Percentage
FROM Covid_Data
WHERE continent IS NOT NULL AND location = 'Greece'
GROUP BY location, population

--(GREECE) WITH A POPULATION OF (10384972) PEOPLE HAS HAD A TOTAL OF (5635901) CASES
--THAT IS A (54.2%) PERCENTAGE OF THE POPULATION WITH COVID-19

--COVID-19 DEATHS

SELECT location, population, max(total_cases) AS Total_Cases, max(total_deaths) AS Total_Deaths
FROM Covid_Data
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY Total_Deaths DESC

--THE TOP 5 COUNTRIES WITH THE MOST DEATHS ARE
--(UNITED STATES - 1188195), (BRAZIL - 702116), (INDIA - 533612), (RUSSIA - 402926) AND (MEXICO - 335011)

--COVID-19 DEATHS PER CASES

SELECT location, population, max(total_cases) AS Total_Cases, max(total_deaths) AS Total_Deaths, max(total_deaths)/ max(total_cases) * 100 as Death_Rate
FROM Covid_Data
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY Death_Rate DESC

--TOP 5 COUNTRIES WITH THE HIGHEST DEATH RATE
--(YEMEN - 18%), (SUDAN 7.8%), (SYRIA - 5.5%) , (SOMALIA - 4.9%) and (PERU - 4.8%)

--COVID-19 DEATHS DATA FOR (GREECE)

SELECT location, population, max(total_cases) AS Total_Cases, max(total_deaths) AS Total_Deaths, max(total_deaths)/ max(total_cases) * 100 as Death_Rate
FROM Covid_Data
WHERE continent IS NOT NULL AND location = 'Greece'
GROUP BY location, population
ORDER BY Death_Rate DESC

--(GREECE) HAS HAD A TOTAL OF (39019) DEATHS OUT OF (5635901) COVID-19 CASES OR A (O.69%) DEATH RATE

--MORTALITY RATE 

SELECT location, population, max(total_cases) AS Total_Cases, max(total_deaths) AS Total_Deaths, max(total_deaths)/ population * 100 as Mortality_Rate
FROM Covid_Data
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY Mortality_Rate DESC

--TOP 5 COUNTRIES WITH THE HIGHEST MORTALITY RATE
--(PERU - 0.64%) , (BULGARIA - 0.57%), (BOSNIA AND HERZEGOVINA - 0.5%), (HUNGARY - 0.49%) AND (NORTH MACEDONIA - 0.47%)

--(GREECE) HAS A MORTALITY RATE OF (0.37%)

--TOTAL CASES, TOTAL DEATHS AND DEATH RATE PER CONTINENT

SELECT continent, max (total_cases) as Total_Cases, max(total_deaths) as Total_Deaths, max(total_deaths) / max (total_cases) * 100 as Death_Rate
FROM Covid_Data
WHERE continent IS NOT NULL
GROUP BY continent 
ORDER BY Death_Rate DESC

--AS WE CAN SEE, AFRICA IS THE CONTINENT WITH THE HIGHEST DEATH RATE (2.5%) 
--IT HAS (102595) DEATHS WITH (4072705) CASES

--(SOUTH AMERICA - 1.8%), (NORTH AMERICA - 1.1%), (EUROPE - 1%), (ASIA - 0.5%) AND (OCEANIA - 0.2%)


--FROM NOW ON WE WILL FOCUS ON (GREECE)

SELECT *
FROM Covid_Data
WHERE location = 'Greece'

--COVID-19 IN (GREECE)

SELECT location, date, total_cases
FROM Covid_Data
WHERE location = 'Greece' AND total_cases IS NOT NULL

--WE CAN SEE THE FIRST SIGNALS OF COVID-19 IN GREECE AT (01-03-2020) WITH (6) CASES

SELECT location, date, total_deaths
FROM Covid_Data
WHERE location = 'Greece' AND total_deaths IS NOT NULL

--AT (15-03-2020) THE FIRST (4) PEOPLE DIED BECAUSE OF COVID-19

--DEATH RATE BEFORE AND AFTER VACCINATIONS

SELECT location, date, total_vaccinations
FROM Covid_Data
WHERE location = 'Greece' AND total_vaccinations IS NOT NULL

--THE FIRTS VACCINATIONS IN (GREECE) TOOK PLACE AT (28-12-2020 ) WITH (447) PEOPLE GETTING VACCINATED

--TOTAL CASES AND DEATHS BEFORE AND AFTER VACCINATIONS

SELECT location, sum(new_cases) AS Total_Cases, sum(new_deaths) AS Total_Deaths
FROM Covid_Data
WHERE location = 'Greece' AND total_vaccinations IS NULL  
GROUP BY location

--BEFORE THE VACCINATIONS (GREECE) HAD A TOTAL OF (12214) DEATHS OUT OF (521502) CASES

--TOTAL CASES AND DEATHS AFTER VACCINATIONS

SELECT location, sum(new_cases) AS Total_Cases, sum(new_deaths) AS Total_Deaths
FROM Covid_Data
WHERE location = 'Greece' AND total_vaccinations IS NOT NULL
GROUP BY location

--AFTER THE VACCINATIONS (GREECE) HAD A TOTAL OF (26805) DEATHS OUT OF (5114399) CASES

--DEATH RATE BEFORE AND AFTER VACCINATIONS

SELECT location, sum(new_cases) AS Total_Cases, sum(new_deaths) AS Total_Deaths, sum(new_deaths)/sum(new_cases)*100 AS Death_Rate
FROM Covid_Data
WHERE location = 'Greece' AND total_vaccinations IS NULL  
GROUP BY location

--BEFORE THE VACCINATIONS (GREECE) HAS HAD A DEATH RATE OF (2.3%)

SELECT location, sum(new_cases) AS Total_Cases, sum(new_deaths) AS Total_Deaths, sum(new_deaths)/sum(new_cases)*100 AS Death_Rate
FROM Covid_Data
WHERE location = 'Greece' AND total_vaccinations IS NOT NULL
GROUP BY location

--AFTER THE VACCINATIONS (GREECE) HAS HAD A DEATH RATE OF (0.5%)

--*PLACEHOLDER FOR FUTURE QUERIES*
