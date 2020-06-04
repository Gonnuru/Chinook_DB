/* number of Customers supported per Employee */

select employees.FirstName, employees.LastName,customers.SupportRepId, employees.EmployeeId, COUNT(DISTINCT customers.CustomerId) 'Customers Supported',
	   sum(invoices.Total) / count(DISTINCT customers.CustomerId) as 'Average Revenue',
	   sum(invoices.Total) as 'Total Revenue'
FROM customers

join employees
	on employees.EmployeeId = customers.SupportRepId
	
JOIN invoices
	on invoices.CustomerId = customers.CustomerId
	
GROUP BY customers.SupportRepId;
