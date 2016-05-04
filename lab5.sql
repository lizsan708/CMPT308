
--Lizeth Sanchez
--CMPT_308L_200_16S
--Professor Rivas
--25 February 2016

--1. Show the cities of agents booking an order for a customer whose ID is 'c002'. 
--Use joins; no subqueries.
SELECT a.city
FROM Orders o, Agents a
WHERE o.aid = a.aid
AND o.cid = 'c002';


--2. Show the IDs of products ordered through any agent who makes at least one order for a
--customer in Dallas, sorted by pid from highest to lowest. Use joins; no subqueries.
SELECT DISTINCT o.pid
FROM Orders o, Customers c
WHERE o.cid = c.cid
AND c.city = 'Dallas'
ORDER BY pid DESC;


--3. Show the names of customers who have never placed an order. Use a subquery.
SELECT name
FROM Customers
WHERE cid NOT IN ( SELECT cid
		FROM Orders);

--4. Show the names of customers who have never placed an order. Use an outer join.
SELECT c.name
FROM Customers c
LEFT OUTER JOIN Orders o
ON o.cid = c.cid
WHERE o.ordno IS NULL;


--5. Show the names of customers who placed at least one order through an agent in their 
--own city, along with those agent(s') names.
SELECT DISTINCT c.name, a.name
FROM Orders o
INNER JOIN Agents a ON a.aid = o.aid
INNER JOIN Customers c ON o.cid = c.cid
WHERE a.city = c.city;


--6. Show the names of customers and agents living in the same city, along with the name
--of the shared city, regardless of whether or not the customer has ever palced an order
--with that agent.
 SELECT c.name, a.name, c.city
 FROM Customers c, Agents a
 WHERE c.city = a.city;

--7. Show the name and city of customers who live in the city that makes the fewest
--different kinds of products. (Hint: Use count and group by on the Products table.)
SELECT c.name,c.city
FROM Customers c
WHERE c.city IN(SELECT 	city
		FROM Products
		GROUP BY city
		ORDER BY count(pid)ASC
		LIMIT 1);
