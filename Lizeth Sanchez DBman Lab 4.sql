--Lizeth Sanchez
--CMPT_308L_200_16S
--Professor Rivas
--18 February 2016


--1. Get the cities of agents booking an order for a customer whose cid is 'c002'.

SELECT city
FROM Agents
WHERE aid IN(	SELECT aid
		FROM Orders
		WHERE Orders.cid='c002');

--2. Get the ids of products ordered through any agent who takes at least one order from a customer in Dallas, sorted by pid from highest to lowest.

SELECT DISTINCT pid
FROM Orders
WHERE aid IN(	SELECT aid
		FROM Orders
		WHERE cid IN(	SELECT cid
				FROM Customers
				WHERE Customers.city='Dallas'))
ORDER BY pid DESC;

--3. Get the ids and names of customers who did not place an order through agent a01.

SELECT cid, name
FROM Customers
WHERE cid in(	SELECT cid
		FROM Orders
		WHERE cid NOT IN(	SELECT cid
					FROM Orders
					WHERE aid = 'a01'));

--4. Get the ids of customers who ordered both product p01 and p07.

SELECT cid
FROM Customers
WHERE cid IN( 	SELECT cid
		FROM Orders
		WHERE pid= 'p01' AND cid IN( 	SELECT cid
						FROM Orders
						WHERE pid='p07'));

--5. Get the ids of products not ordered by any customers who placed any order through agent a07 in pid order from highest to lowest.

SELECT pid
FROM Products
WHERE pid IN (	SELECT pid
		FROM Orders
		WHERE aid NOT IN ('a07'))
ORDER BY pid DESC;

--6. Get the name, discounts, and city for all customers who place orders through agents in London or New York.

SELECT name, discount, city
FROM Customers
WHERE cid IN( 	SELECT cid
		FROM Orders
		WHERE aid IN(		SELECT aid
					FROM Agents
					WHERE Agents.city = 'London' OR Agents.city = 'New York'));

--7. Get all customers who have the same discount as that of any customers in Dallas or London. 

SELECT *
FROM Customers
WHERE discount IN(	SELECT discount
			FROM Customers
			WHERE city IN( 	'Dallas' , 'London'))
			AND city NOT IN ('Dallas', 'London');
--8. SEE PDF FILE.