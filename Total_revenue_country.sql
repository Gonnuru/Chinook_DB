SELECT invoices.BillingCountry, round(sum(invoice_items.UnitPrice) * 100 / (SELECT sum(invoice_items.UnitPrice)FROM invoice_items), 2) as '% of Total Revenue for each country' 
FROM invoices
join invoice_items
	on invoices.InvoiceId = invoice_items.InvoiceId
GROUP BY invoices.BillingCountry
ORDER BY round(sum(invoice_items.UnitPrice) * 100 / (SELECT sum(invoice_items.UnitPrice)FROM invoice_items), 2) DESC;