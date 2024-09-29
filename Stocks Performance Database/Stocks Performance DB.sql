-- We created a database that contains stock performance data
-- First we get a grasp of our data 

SELECT *
FROM Stock_Prices

-- We are going to retrieve stock data for a specific date range

SELECT *
FROM Stock_Prices
WHERE Date BETWEEN '2023-01-01' AND '2023-12-31'

-- Now we get all records for a specific stock ticker

SELECT *
FROM Stock_Prices
WHERE Ticker = 'AAPL'

-- Let's combine now a specific ticker and a date

SELECT *
FROM Stock_Prices
WHERE Ticker = 'MSFT' AND Date BETWEEN '2023-01-01' AND '2024-09-27'

-- Next we will write a querry to find all stocks from a specific industry and country

SELECT *
FROM Stock_Prices
WHERE Industry_Tag = 'technology' AND Country = 'usa'

-- Now we are going to make some calculations
-- We calculate the  daily percentage change (Daily Returns) for a stock

SELECT Date, Ticker, (([Close] - [Open]) / [Open]) * 100 AS Daily_return
FROM Stock_Prices
WHERE Ticker = 'GOOGL'

-- We also calculate a moving average of stock prices 

SELECT Date, Brand_Name, Ticker, [Close], 
AVG([Close]) OVER(PARTITION BY Ticker ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS Moving_avg_7day
FROM Stock_Prices
WHERE Ticker = 'LOGI'

SELECT Date, Brand_Name, Ticker, [Close], 
AVG([Close]) OVER(PARTITION BY Ticker ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS Moving_avg_7day
FROM Stock_Prices
WHERE Ticker = 'UBSFY'

-- Now we find the top 5 stocks with the highest trading volume over a specific time period

SELECT TOP 5 Ticker, SUM(VOLUME) AS Total_volume
FROM Stock_Prices
WHERE Date BETWEEN '2024-01-01' AND '2024-09-27'
GROUP BY Ticker
ORDER BY Total_volume DESC

-- 1) NVIDIA, 2) TESLA, 3) APPLE, 4) AMD, 5) AMAZON

-- We calculate dividend yield for a specific stock

SELECT Date, Dividends, Ticker, (Dividends/ [Close]) * 100 AS Dividend_yield
FROM Stock_Prices
WHERE Ticker = 'LVMUY'

-- Now we find stocks that have undergone stock splits and calculate the post-split price

SELECT Date, Brand_Name, Ticker, [Close], Stock_Splits,
CASE 
    WHEN Stock_Splits > 0 THEN [Close] / Stock_Splits
    ELSE [Close]
END AS post_split_price
FROM Stock_Prices
WHERE Stock_Splits > 0

-- We are going to calculate capital gains for each stock between two dates

SELECT Brand_Name, Ticker, (MAX([Close]) - MIN([Close])) As Capital_gains
FROM Stock_Prices
WHERE Date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY Brand_Name, Ticker

-- We calculate the average closing Price for each stock over a specific date range

SELECT Brand_Name, Ticker, AVG([Close]) AS Avg_close
FROM Stock_Prices
WHERE Date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY Brand_Name, Ticker

-- We find the highest and lowest prices for each stock

SELECT Brand_Name, Ticker, MAX(High) AS Highest_price, MAX(Low) AS Lowest_price
FROM Stock_Prices
GROUP BY Brand_Name, Ticker

-- Let's calculate monthly average closing prices

SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, Brand_Name, Ticker, AVG([Close]) AS Avg_monthly_close
FROM Stock_Prices
GROUP BY YEAR(Date), MONTH(Date), Brand_Name, Ticker
ORDER BY Year, Month, Ticker

-- Now we identify stocks with consistent growth

SELECT Date, Brand_Name, Ticker,
       (([Close] - [Open]) / [Open]) * 100 AS Daily_return
FROM Stock_Prices
WHERE (([Close] - [Open]) / [Open]) * 100 > 2

-- Stocks that have not paid dividends

SELECT DISTINCT Brand_Name, Ticker
FROM Stock_Prices
WHERE Dividends = 0;

-- We calculate total trading volume for each stock by month

SELECT Year(Date) AS Year, MONTH(Date) AS Month, Brand_Name, Ticker, SUM(Volume) AS Total_Volume
FROM Stock_Prices
GROUP BY YEAR(Date), MONTH(Date), Brand_Name, Ticker
ORDER BY Year, Month, Ticker

-- We identify the stock with the highest percentage gain in 2023 

WITH stock_gains AS (
    SELECT Brand_Name, Ticker, 
           ((MAX([Close]) - MIN([Close])) / MIN([Close])) * 100 AS Percentage_gain
    FROM Stock_Prices
    WHERE Date BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY Brand_Name, Ticker
)
SELECT TOP 1*
FROM stock_gains
ORDER BY Percentage_gain DESC

-- That would be NVIDIA with a percentage gain of 1124% in 2023 

--Let's compare performance of stocks by industry over the last year

SELECT TOP 5 Industry_Tag, AVG((([Close] - [Open]) / [Open]) * 100) AS Avg_return
FROM Stock_Prices
WHERE Date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY Industry_Tag
ORDER BY Avg_return DESC

-- 1) Cryptocurrency, 2) Music, 3) Fitness, 4) E-Commerce, 5) Financial Services

-- Let's create a view to simplify things a little bit 

CREATE VIEW Stock_Performance AS 
SELECT Date, Ticker, [Close], (([Close] - [Open]) / [Open]) * 100 AS Daily_return
FROM Stock_Prices

SELECT * 
FROM Stock_Performance
WHERE Ticker = 'NTDOY'

SELECT * 
FROM Stock_Performance
WHERE Ticker = 'ADDYY'

SELECT * 
FROM Stock_Performance
WHERE Ticker = 'PHG'


-- We could do the same with a stored precedure

CREATE PROCEDURE CalculateDailyReturn @ticker NVARCHAR(10)
AS
BEGIN
    SELECT Date, Ticker, (([Close] - [Open]) / [Open]) * 100 AS Daily_return
    FROM Stock_Prices
    WHERE Ticker = @ticker;
END;

EXEC CalculateDailyReturn 'NTDOY'

EXEC CalculateDailyReturn 'ADDYY'

EXEC CalculateDailyReturn 'PHG'

-- *Placeholder for future queries*
