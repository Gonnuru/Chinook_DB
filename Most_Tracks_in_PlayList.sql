select tracks.Name, count(*) as number_of_playlists
from tracks
LEFT JOIN playlist_track
	on tracks.TrackId = playlist_track.TrackId
GROUP BY playlist_track.TrackId
order BY count(playlist_track.PlaylistId) DESC
limit 100;

