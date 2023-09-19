set search_path to listen_in;

-- Q1) Find the names of albums and the record label name released after '2020/01/01'
SELECT a.name AS album_name, r.name AS record_label_name
FROM Albums a
JOIN Record_Label r ON a.record_id = r.record_id
WHERE a.release_date > '2020/01/01';

/* This is useful if ever the user would like to see the difference between
   the style of the album based on the record label and their values and creativity.
   We can perform a similar search by replacing record label name with producer. */


-- Q2) Find the artist signed under 'Starshine Music' Record Label
SELECT a.name
FROM Artist a
JOIN Artist_Record_Label AS arl ON a.artist_id = arl.artist_id
JOIN Record_Label AS rl ON arl.record_id = rl.record_id
WHERE rl.name = 'Starshine Music';

/* View list of artist signed under the same record label, if ever you have different
   artists on the same record label they would be easier to group and follow.
 */


-- Q3) Find all songs produced by the producer "Max Reynolds":
SELECT s.title
FROM Song s
JOIN Song_Producer AS sp ON s.song_id = sp.song_id
JOIN Producer AS p ON sp.producer_id = p.producer_id
WHERE p.name = 'Max Reynolds';

--Easy way to keep track of you favorite producers music catalogue.


-- Q4) Find the featured artist on the song 'Fading Lights'
SELECT a.name
FROM Artist a
JOIN Featured_Artist AS fa ON a.artist_id = fa.artist_id
JOIN Song AS s ON fa.song_id = s.song_id
WHERE s.title = 'Dark Paradise';

-- Get to know new artist that are featured on your favorite songs




-- Q5) Find all songs associated with artist_id: 2
SELECT s.title
FROM Song s
INNER JOIN Artist_Song ON s.song_id = Artist_Song.song_id
WHERE Artist_Song.artist_id = 2;

/* Easily find collaborations where your favorite artist might be the main singer
   or featured on a hit song. */
