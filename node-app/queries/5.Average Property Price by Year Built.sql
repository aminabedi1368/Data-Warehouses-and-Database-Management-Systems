SELECT Year_Built, AVG(Price) AS Average_Price
FROM Property
GROUP BY Year_Built
ORDER BY Year_Built;
