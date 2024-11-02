-- 1. List all customers (name + email), ordered alphabetically (no extra information) (Should yield 59 results)

-- SELECT first_name, last_name, email FROM customers
-- ORDER BY last_name ASC;

-- 2. List all 'Rock' genre tracks (only names) (Should yield 1297 results)
-- SELECT tracks.name FROM tracks 
-- JOIN genres ON genres.id = tracks.genre_id WHERE genres.name = "Rock";
  


-- 3. List the first ten albums of the Jukebox DB, sorted alphabetically (First result should be "...And Justice For All" and last one "Ace Of Spades")

-- SELECT title FROM albums 
-- ORDER BY title ASC
-- LIMIT 10;


-- 4. Count the number of tracks that are shorter than 2 minutes (Should yield 93 results)

-- SELECT COUNT(*) FROM tracks
-- WHERE milliseconds < 120000;


-- 5. List tracks (Name + Composer) of the 'Classical' playlist (Should yield 75 results)

-- SELECT tracks.name, tracks.composer FROM tracks
-- JOIN playlist_tracks ON track_id = tracks.id 
-- JOIN playlists ON playlists.id = playlist_tracks.playlist_id
-- WHERE playlists.name = "Classical";


-- 6. List the 10 artists most listed in all playlists
-- (First Result should be Iron Maiden with 516 occurences and the last should be Lenny Kravitz with 143 occurances)
-- SELECT a.name, COUNT(*) AS c FROM artists AS a 
-- JOIN albums AS al ON a.id = al.artist_id
-- JOIN tracks AS t ON al.id = t.album_id
-- JOIN playlist_tracks AS pt ON t.id = pt.track_id
-- GROUP BY a.name
-- ORDER BY c DESC
-- LIMIT 10;


-- 7. List the tracks(composer + name) which have been purchased at least twice, ordered by number of purchases  (Should yield 265 results Steve Harris - The Trooper having 5 purchases)
SELECT tracks.name, tracks.composer, COUNT(*) AS c FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY tracks.id
HAVING c >= 2
ORDER BY c DESC;