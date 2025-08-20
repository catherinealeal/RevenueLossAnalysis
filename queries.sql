-- Break datatable into sub-tables for demonstrative purposes 
CREATE TABLE Users AS 
	SELECT User_ID AS ID, 
		   Purchase_Date AS Date
 	FROM ecomm;

CREATE TABLE Products AS 
	SELECT Product_ID as ID, 
		   Category
	FROM ecomm;
		   
CREATE TABLE Prices AS 
	SELECT Product_ID, 
		   Price, 
		   Discount, 
		   Final_Price 
	FROM ecomm;

CREATE TABLE Payments AS
	SELECT User_ID, 
		   Product_ID, 
		   Purchase_Date, 
		   Payment_Method AS Method 
	FROM ecomm;
	
-- Exploratory analysis 
SELECT COUNT(*) AS TotalTransactions, -- total transactions + revenue 
	   SUM(Final_Price) as TotalRevenue
FROM Payments 
LEFT JOIN Prices ON Payments.Product_ID = Prices.Product_ID 

SELECT SUBSTR(Pa.Purchase_Date, 4, 2) AS Month, -- revenue+transactions per month 
	   SUM(Pr.Final_Price) AS Revenue, 
	   COUNT(*) AS NumTransactions
FROM Payments Pa 
JOIN Prices Pr ON Pa.Product_ID = Pr.Product_ID 
GROUP BY Month

SELECT AVG(Price) AS AvgPrice, -- price + discount stats 
       AVG(Discount) AS AvgDiscount,
       AVG(Final_Price) AS AvgFinalPrice
FROM Prices;

SELECT COUNT(*) AS NumTransactions, -- sales per discount 
	   SUM(Final_Price) AS Revenue, 
       Discount 
FROM Prices 
GROUP BY Discount 
ORDER BY 3 ASC

-- Which product categories contributed the most to revenue? 
SELECT SUM(Prices.Final_Price) AS Revenue, -- revenue per category
	   Count(*) AS NumTransactions, -- transactiosn per category 
	   Products.Category
FROM Prices 
LEFT JOIN Products 
ON Prices.Product_ID = Products.ID
GROUP BY Products.Category 
ORDER BY 1 DESC

-- How did discounting affect revenue, and are these effects specific to 
-- particular products or discount levels?
SELECT SUM(Price - Final_Price) -- total lost revenue 
FROM Prices

SELECT Products.Category, -- lost revenue per category 
	   SUM(Prices.Price) - SUM(Prices.Final_Price) AS LostRevenue
FROM Prices 
LEFT JOIN Products 
       ON Prices.Product_ID = Products.ID
GROUP BY Products.Category 
ORDER BY 2 DESC

SELECT Discount, -- lost revenue per discount 
	   SUM(Price) - SUM(Final_Price) AS LostRevenue
FROM Prices 
GROUP BY Discount
ORDER BY 1 ASC

SELECT AVG(CASE WHEN Discount > 0 THEN 1 ELSE 0 END) 
     AS PropDiscounted -- proportion of sales with a discount 
FROM Prices;

-- Insights in Action 
SELECT SUM((Price * 0.7) - Final_Price) AS Revenue30, 
	   SUM((Price * 0.85) - Final_Price) AS Revenue15,
	   SUM(Price - Final_Price) AS RevenueFull
FROM Prices 
LEFT JOIN Products ON Products.ID = Prices.Product_ID
WHERE Products.Category IN ('Books', 'Home & Kitchen') AND 
	Discount = 50

SELECT SUM(Price - Final_Price)
FROM Prices 
LEFT JOIN Products ON Products.ID = Prices.Product_ID
WHERE Products.Category IN ('Books', 'Home & Kitchen')