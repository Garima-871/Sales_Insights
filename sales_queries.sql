SELECT * FROM sales.transactions;
SELECT * FROM sales.customers;
SELECT * FROM sales.date;

-- ----------------------------------------------------------------------------------------------------------
-- --------------- Keypoints/problems to face while data cleaning/transforming in PowerBI -------------------
-- 1. The focus of the 'X' hardware company is preferred around India and not around New York and Paris.
-- 2. sales transaction values which are zero or in negative values needs data cleaning.
-- 3. Currency is different for some records. Every sales amount should follow 'INR' currency.


-- ----------------------------------------------------------------------------------------------------------
-- ---------------------- Queries for Data Exploration ------------------------------------------------------

-- What are the total sale transactions for year 2020?
SELECT sales.transactions.* , sales.date.* from sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;

-- What is the total sales revenue for year 2019?
SELECT sum(sales.transactions.sales_amount) as revenue FROM sales.transactions
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
Where sales.date.year = 2019;

-- What is the total sales revenue for year 2020?
SELECT sum(sales.transactions.sales_amount) as revenue from sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020 AND sales.transactions.currency = 'INR\r' 
OR sales.transactions.currency = 'USD\r';

-- What is the total sales revenue for year 2020 in state Chennai?
SELECT sum(sales.transactions.sales_amount) as revenue FROM sales.transactions
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
Where sales.date.year = 2020 AND sales.transactions.market_code = 'Mark001';

-- What is the total sales revenue in month january of 2019?
SELECT sum(sales.transactions.sales_amount) as revenue from sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2019  AND sales.transactions.currency = 'INR\r' 
OR sales.transactions.currency = 'USD\r';


-- What are the different products that were sold in Chennai?
SELECT DISTINCT product_code FROM sales.transactions WHERE market_code = 'Mark001' ;


-- ----------------------------------------------------------------------------------------------------------
-- -------------------------------data exploration related to currency --------------------------------------

SELECT distinct(transactions.currency) from transactions;
SELECT *  from transactions where transactions.sales_amount = 0 or transactions.sales_amount = -1 ;

-- difference currency patterns that are used 'INR','INR\r','USD','USD\r'.
SELECT count(*) from transactions where currency = 'INR\r';
SELECT count(*) from transactions where currency = 'INR';
SELECT * from transactions where currency = 'USD' or currency = 'USD\r';

