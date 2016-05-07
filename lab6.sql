--Lizeth Sanchez
--CMPT_308L_200_16S
--Professor Rivas
--3 March 2016


--1. Display the name and city of customers who live in any city that makes the most 
--different kinds of products. (There are two cities that make the most different products.
--Return the name and city of customers from either one of those.)

SELECT c.name, c.city
FROM customers c
WHERE city in (SELECT city
               from products p 
               GROUP BY p.city
               order by count(p.city) desc
               limit 1);

--2.Display the names of products whose priceUSD is strictly above the average priceUSD, 
--in reverse-alphabetical order.

select p.name
from products p
where p.priceUSD > (SELECT avg(p.priceUSD)
                    FROM products p)
order BY p.name desc;

--3. Display the customer name, pid ordered, and the total for all orders, sorted by total
--from high to low.

select c.name, o.pid, o.dollars
from orders o
inner join customers c on c.cid = o.cid
ORDER BY o.dollars DESC;

--4. Display all customer names (in alphabetical order) and their total $ ordered, and
--nothing more. Use coalesce to avoid showing NULLs.

select c.name, coalesce(SUM(o.dollars),0) as totalOrdered
from orders o
right outer join customers c on c.cid = o.cid
group by c.name
order by c.name asc;

--5. Display the names of all customers who bought products from agents based in Tokyo
--along with the names of the products they ordered, and the names of agents who sold it 
--to them.

select c.name, p.name, a.name
from orders o
inner join agents a on a.aid = o.aid
inner join customers c on c.cid = o.cid
inner join products p on p.pid = o.pid
where a.city = 'Tokyo';

--6. Write a query to check the accuracy of the dollars column in the Orders table. This
--means calculating Orders.totalUSD from data in other tables and comparing those values
--to the values in Orders.dollars. Display all rows in Orders where Orders.dollars is
--incorrect, if any. 

Select *
From (Select o.*, o.qty*p.priceusd*(1-(discount/100)) as truedollars
      from orders o
      inner join products p on o.pid = p.pid
      inner join customers c on o.cid = c.cid) as tmptable
Where dollars != truedollars;

--7. What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example
--queries in SQL to demonstrate. Feel free to use the CAP2 database to make your points 
--here.

/* The difference of LEFT OUTER JOINS and RIGHT OUTER JOINS is which table takes
precedence in terms of how many rows are output and which values, if any, are NULL.
For example, if you use the Orders table with a LEFT OUTER JOIN on the Customers table,
then the orders from the Orders table are matched to the customers who made them. That
means that customers who did not place any orders will not appear in the output. On the
other hand, if you use the Orders table with a RIGHT OUTER JOIN on the Customers table, 
then the customers from the Customers table will be matched to the orders they made. If a
customer has not placed an order, then the Order table will output NULL unless COALESCE
is used.
*/ 
