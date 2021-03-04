--1. `non_usa_customers.sql`: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select FirstName, LastName, CustomerId, Country
From Customer c
WHERE country != 'USA'

--brazil_customers.sql: Provide a query only showing the Customers from Brazil.
select FirstName, LastName, CustomerId, Country
From Customer c
WHERE country = 'Brazil'

--Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
select c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
From customer c
	join invoice i
		on i.invoiceid = c.CustomerId
WHERE c.country = 'Brazil'

select *
FROM Employee
WHere Title Like '%Sales%'

select distinct(BillingCountry)
From Invoice

--Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
select e.FirstName, e.LastName, i.*
From employee e
	join Invoice i
		on i.InvoiceId = e.EmployeeId
group by e.EmployeeId


-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
select i.Total, c.FirstName, c.LastName, c.Country, e.FirstName, e.LastName
From Invoice i
	join customer c
		on i.CustomerId = c.CustomerId
		join Employee e
			on c.SupportRepId = e.EmployeeId

--How many Invoices were there in 2009 and 2011?
select *
from Invoice i
where i.InvoiceDate > '2009-01-01 00:00:00'
AND i.InvoiceDate < '2011-01-01 00:00:00'