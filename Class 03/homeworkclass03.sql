SELECT * FROM album
SELECT * FROM artist
SELECT * FROM artist_details
SELECT * FROM genre
SELECT * FROM playlist
SELECT * FROM playlists_songs
SELECT * FROM song
SELECT * FROM song_lyrics
SELECT * FROM songs_genres

-- Calculate the count of all songs in the system
SELECT COUNT(*) as total_songs
FROM song;

-- Calculate the count of all songs per artist in the system
SELECT a.id as artist, COUNT(s.id) as song_count
FROM artist a
JOIN song s ON a.id = s.artist_id
GROUP BY a.id;

-- Calculate the count of all songs per artist in the system for first 5 albums (ID <5)
SELECT a.id AS artist, COUNT(s.id) song_count
FROM artist a
JOIN song s ON a.id = s.artist_id
WHERE s.album_id <= 5
GROUP BY a.id;

-- Find the maximal duration and the average duration per song for each artist
SELECT a.id AS artist, MAX(s.duration) AS max_duration, AVG(s.duration) AS avg_duration
FROM artist a
LEFT JOIN song s ON a.id = s.artist_id
GROUP BY a.id;

-- Calculate the count of all songs per artist in the system and filter only song count greater than 4
SELECT a.id as artist, COUNT(s.id) as song_count
FROM artist a
JOIN song s ON a.id = s.artist_id
GROUP BY a.id
HAVING COUNT(s.id) > 4;

-- Calculate the count of all songs per artist in the system for first 5 albums (ID < 5) and filter artists with more than 3 song count
SELECT a.id AS artist_id, COUNT(s.id) AS song_count
FROM artist a
JOIN song s ON a.id = s.artist_id
WHERE s.album_id < 5
GROUP BY a.id
HAVING COUNT(s.id) > 3;

-- Find the song count, maximal duration, and the average duration per artist on all songs in the system. Filter only records where maximal duration is more than the average duration
SELECT a.id AS artist, COUNT(s.id) AS song_count, MAX(s.duration) AS max_duration, AVG(s.duration) AS avg_duration
FROM artist a
JOIN song s ON a.id = s.artist_id
GROUP BY a.id
HAVING MAX(s.duration) > AVG(s.duration);

-- Create a new view (vw_ArtistSongCounts) that will list all artist IDs and count of songs per artist
CREATE VIEW vw_artist_song_counts AS
SELECT a.id as artist, COUNT(s.id) as song_count
FROM artist a
JOIN song s ON a.id = s.artist_id
GROUP BY a.id;

SELECT * FROM vw_artist_song_counts;

-- Change the view to show artist names instead of artist ID
DROP VIEW IF EXISTS vw_artist_song_counts;

CREATE VIEW vw_artist_song_counts AS
SELECT a.name AS artist, COUNT(s.id) as song_count
FROM artist a
JOIN song s ON a.id = s.artist_id
GROUP BY a.name;

SELECT * FROM vw_artist_song_counts;

-- List all rows from the view ordered by the biggest song count
SELECT *
FROM vw_artist_song_counts
ORDER BY song_count DESC;

-- Create a new view (vw_ArtistAlbumDetails) that will list all artists (name) and count the albums they have
CREATE VIEW vw_artist_album_details AS
SELECT a.name AS artist, COUNT(DISTINCT s.album_id) AS album_count
FROM artist a
JOIN song s ON a.id = s.artist_id
GROUP BY a.name;

SELECT * FROM vw_artist_album_details;