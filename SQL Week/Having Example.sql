/*
Lets find out how many orders and how much freight is being shipped by city
*/

SELECT COUNT([OrderID]) AS "number_of_orders"
      ,SUM([Freight]) AS "freight_volume"
      ,[ShipCity]

  FROM [Northwind].[dbo].[Orders]
GROUP BY [ShipCity];

/*
Interesting but lets put the most orders at the top
*/

SELECT COUNT([OrderID]) AS "number_of_orders"
      ,SUM([Freight]) AS "freight_volume"
      ,[ShipCity]

  FROM [Northwind].[dbo].[Orders]
GROUP BY [ShipCity]
ORDER BY 1 DESC;


/*
We're high rollers so we really only care about cities making 10 or more orders
We know about the where clause so lets try that...
*/

SELECT COUNT([OrderID]) AS "number_of_orders"
      ,SUM([Freight]) AS "freight_volume"
      ,[ShipCity]

  FROM [Northwind].[dbo].[Orders]
WHERE COUNT([OrderID]) >= 10
GROUP BY [ShipCity]
ORDER BY 1 DESC;

/*
Huh... SQL doesn't understand the COUNT of orders before it's finished grouping them together...
Makes sense!
WHERE clauses have to come before GROUP BY so I guess we'll have to use something else...

HAVING!
*/

SELECT COUNT([OrderID]) AS "number_of_orders"
      ,SUM([Freight]) AS "freight_volume"
      ,[ShipCity]

  FROM [Northwind].[dbo].[Orders]
GROUP BY [ShipCity]
HAVING COUNT([OrderID]) >= 10
ORDER BY 1 DESC;

/*
HAVING works here because it's like WHERE, it can ask a question of the data and filter on it
But it comes after the GROUP BY clause and can therefore refer to aggregated data in it's statement 
*/
