/* Which track generated the most revenue? which album? which genre? */

SELECT tracks.TrackId, tracks.name as Track_Name, genres.name as Genre_Name, 
	    albums.Title as Album_Name, sum(invoice_items.UnitPrice * invoice_items.Quantity) as Revenue
from tracks

join albums
	on tracks.AlbumId = albums.AlbumId

join invoice_items
	on tracks.TrackId = invoice_items.TrackId

join genres
	on tracks.GenreId = genres.GenreId
	
GROUP BY invoice_items.TrackId, albums.AlbumId, genres.GenreId
ORDER BY sum(invoice_items.UnitPrice) DESC
limit 100;
