/*
Can you tell me how many customers we have by CompanyName, Region and Country. 
And can you sum that up for me by Region and Country?
Please give this to me in a table.
*/

USE Northwind

SELECT 
      CompanyName
      ,Region
      ,Country
      ,COUNT(CustomerID) AS "Customers"
  FROM Customers
GROUP BY Region
      ,Country

/*
This won't work as it's asking 2 questions
Can I have the customer numbers grouped by 3 things and also only 2 things
SQL gets confused and will throw an error

Column 'Customers.CompanyName' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

We can fix this by ensuring that all of the non-aggregated columns (ones we're not summing, averaging etc) are in the group by
*/

/* 
One way is to get rid of the Company name in the initial select
*/

USE Northwind

SELECT 
      Region
      ,Country
      ,COUNT(CustomerID) AS "Customers"
  FROM Customers
GROUP BY Region
      ,Country

/* 
Or we can add company name into the group by

As long as every column not having stuff done to it in both, it's good!
*/

USE Northwind

SELECT
      CompanyName
      ,Region
      ,Country
      ,COUNT(CustomerID) AS "Customers"
  FROM Customers
GROUP BY CompanyName
      ,Region
      ,Country

