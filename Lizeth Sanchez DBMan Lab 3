
--1. List the ordno and dollars of all orders.
SELECT ordno, dollars
FROM Orders;
 
--2. List the name and city of agents named Smith.
SELECT name, city
FROM Agents
WHERE Agents.name='Smith';
 

--3. List the pid, name, and priceUSD of products with quantity more than 208,000
SELECT pid, name, priceUSD
FROM Products
WHERE quantity > 208000;
 

--4. List the names and cities of customers in Dallas.
SELECT name, city
FROM Customers
WHERE Customers.city='Dallas';
 

--5. List the names of agents not in New York and not in Tokyo.
SELECT name
FROM Agents
WHERE Agents.city not In('New York') or Agents.city not In('Tokyo');
 
 

--6. List all data for products not in Dallas or Duluth that cost US$1 or more. 
SELECT *
FROM Products
WHERE Products.city not In('Dallas') and Products.city not In('Duluth') and Products.priceUSD >= 1.00;
 


--7. List all data for orders in January or March.
SELECT *
FROM Orders
WHERE Orders.mon = 'jan' or Orders.mon = 'mar';
 

--8. List all the data for orders in February less than US$500.
SELECT *
FROM Orders
WHERE Orders.mon = 'feb' and dollars <500;
 

--9. 	List all orders from the customers whose cid is C005.
SELECT *
FROM Orders
WHERE Orders.cid = 'c005';

