-- We have a database about Seattle Airbnb Data
-- We will take a look at our data

SELECT * 
FROM calendar

SELECT * 
FROM listings

SELECT * 
FROM reviews

-- We are going to list all listings with prices below $100

SELECT id, name, neighbourhood, price
FROM listings
WHERE price < 100
ORDER BY price

-- We will count the total number of listings per room type

SELECT room_type, COUNT(room_type) AS Total_listings
FROM listings
GROUP BY room_type
ORDER BY Total_listings DESC

-- Let's calculate the average price by neighborhood

SELECT neighbourhood, AVG(price) AS Avg_price
FROM listings
GROUP BY neighbourhood
ORDER BY Avg_price DESC

-- We select the listings that are available on a 01-09-2024

SELECT l.id, l.name, l.price, c.date
FROM listings l
JOIN calendar c ON l.id = c.listing_id
WHERE c.date = '2024-09-01' AND c.available = 't'
ORDER BY l.price DESC;

-- We are going to count the reviews per listing

SELECT listing_id, COUNT(id) AS Total_reviews
FROM reviews 
GROUP BY listing_id
ORDER BY Total_reviews DESC;

-- We now find hosts with multiple listings

SELECT host_name, host_id, COUNT(id) AS Total_listings
FROM listings
GROUP BY host_name, host_id
HAVING COUNT(id) > 1
ORDER BY Total_listings DESC

-- The top 5 most expensive listings

SELECT TOP 5 id, name, neighbourhood, price
FROM listings
ORDER BY price DESC

-- We now want to see the average number of reviews by neighborhood

SELECT neighbourhood, AVG(number_of_reviews) AS Avg_reviews
FROM listings
GROUP BY neighbourhood
ORDER BY Avg_reviews DESC

-- We calculate the total listings and average price by room type and neighborhood

SELECT neighbourhood, room_type, COUNT(id) AS Total_listings, AVG(price) AS Avg_price
FROM listings
GROUP BY neighbourhood, room_type 
ORDER BY neighbourhood ,room_type 

-- We find the hosts with the most reviews in total

SELECT host_id, host_name, SUM(number_of_reviews) AS Total_reviews
FROM listings
GROUP BY host_id, host_name
ORDER BY Total_reviews DESC

-- Now we count the the cumulative reviews over time

WITH ReviewCTE AS (
SELECT listing_id, date, COUNT(id) OVER (PARTITION BY listing_id ORDER BY date) AS Cumulative_reviews
FROM reviews
)
SELECT listing_id, date, cumulative_reviews
FROM ReviewCTE
ORDER BY listing_id, date;

-- We find hosts who have listings in multiple neighborhoods

SELECT host_id, host_name, COUNT(DISTINCT neighbourhood) AS Num_neighborhoods
FROM listings
GROUP BY host_id, host_name
HAVING COUNT(DISTINCT neighbourhood) > 1
ORDER BY Num_neighborhoods DESC;

-- Lets rank listings by price within each neighborhood

WITH PriceRankCTE AS(
SELECT id, name, neighbourhood, price, ROW_NUMBER() OVER (PARTITION BY neighbourhood ORDER BY price DESC) AS Price_rank
FROM listings
)
SELECT *
FROM PriceRankCTE
WHERE Price_rank = 1 