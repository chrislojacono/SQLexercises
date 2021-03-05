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

select sum(i.total) as '2009'
from Invoice i
where i.InvoiceDate > '2009-01-01 00:00:00'
AND i.InvoiceDate < '2010-01-01 00:00:00'

select sum(i.total) as '2010'
from Invoice i
where i.InvoiceDate > '2010-01-01 00:00:00'
AND i.InvoiceDate < '2011-01-01 00:00:00'

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(*) as NumberOf37Invoices
From InvoiceLine
where InvoiceLine.InvoiceId = 37

--Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
select count(*)
from InvoiceLine il
group by il.InvoiceId

--12. Provide a query that includes the purchased track name with each invoice line item.
select t.name, il.Quantity
from InvoiceLine il
		join Track t
		on il.TrackId = t.TrackId

--13  Provide a query that includes the purchased track name AND artist name with each invoice line item.
select t.name, ar.Name, il.* 
from InvoiceLine il
		join Track t
		on il.TrackId = t.TrackId
		join Album A
		on t.AlbumId = a.AlbumId
		join Artist Ar
		on a.ArtistId = ar.ArtistId


--Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT count(*) as numOfInvoices, Invoice.BillingCountry
FROM Invoice
Group by Invoice.BillingCountry

-- 15  Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
select P.Name, count(pt.TrackId) as NumOfTracks 
from PlaylistTrack PT
	join Track T
		on T.TrackId = PT.TrackId
	join Playlist P
		on P.PlaylistId = PT.PlaylistId
Group By p.Name

--16.  Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
SELECT T.Name, A.Title as ALbum, MT.Name as MediaType, G.Name as Genre
FROM Track T
	JOIN Album A
		on A.AlbumId = T.AlbumId
	JOIN MediaType MT
		on MT.MediaTypeId = T.MediaTypeId
	JOIN Genre G
		on G.GenreId = T.GenreId

-- Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT i.InvoiceId, count(il.InvoiceLineId) as NumOfInvoiceLines
FROM Invoice I
	JOIN InvoiceLine IL
		on Il.InvoiceId = I.InvoiceId
group by i.InvoiceId

--18.  Provide a query that shows total sales made by each sales agent.
select e.FirstName, e.LastName, sum(il.UnitPrice * il.Quantity) as totalSales
from InvoiceLine IL
	JOIN Invoice  I
		on i.InvoiceId = il.InvoiceId
	JOIN Customer C
		on I.CustomerId = c.CustomerId
	JOIN Employee E
		on c.SupportRepId = e.EmployeeId
group by e.FirstName, e.LastName

-- 19  Which sales agent made the most in sales in 2009?
select top 1 e.FirstName, e.LastName, sum(il.UnitPrice * il.Quantity) as totalSales
from InvoiceLine IL
	JOIN Invoice  I
		on i.InvoiceId = il.InvoiceId
	JOIN Customer C
		on I.CustomerId = c.CustomerId
	JOIN Employee E
		on c.SupportRepId = e.EmployeeId
where i.InvoiceDate > '2009-01-01 00:00:00'
AND i.InvoiceDate < '2010-01-01 00:00:00'
group by e.FirstName, e.LastName

--20 : Which sales agent made the most in sales over all?
select top 1 e.FirstName, e.LastName, sum(il.UnitPrice * il.Quantity) as totalSales
from InvoiceLine IL
	JOIN Invoice  I
		on i.InvoiceId = il.InvoiceId
	JOIN Customer C
		on I.CustomerId = c.CustomerId
	JOIN Employee E
		on c.SupportRepId = e.EmployeeId
group by e.FirstName, e.LastName