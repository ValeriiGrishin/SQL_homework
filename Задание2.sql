/*Задание № 2*/
/*Название и продолжительность самого длительного трека*/
SELECT name, duration FROM songs
order by duration desc 
limit 1;

/*Название треков, продолжительность которых не менее 3,5 минут*/
SELECT name  FROM songs
where duration >= 3.5*60;

/*Названия сборников, вышедших в период с 2018 по 2020 год включительно*/
SELECT name  FROM CollectionOfSongs
where year_of BETWEEN 2018 and 2020;

/*Исполнители, чьё имя состоит из одного слова*/
SELECT name  FROM bands
where name not like '% %';


/*Название треков, которые содержат слово «мой» или «my»*/
SELECT name FROM songs
WHERE LOWER(name) like '%my%' or LOWER(name) like '%мой%';


/*Задание № 3*/

/*Количество исполнителей в каждом жанре*/
SELECT g.name, COUNT(band_id) FROM genreband gb
LEFT JOIN genre g ON gb.genre_id = g.id
GROUP BY g.name;

/*количество треков, вошедших в альбомы 2019-2020 годов;*/
SELECT COUNT(s.id) FROM songs s
LEFT JOIN album a ON s.album_id = a.id
where a.year_of between 2019 and 2020;

/*Средняя продолжительность треков по каждому альбому*/
SELECT a.name, ROUND(avg(s.duration), 2) FROM songs s
LEFT JOIN album a ON s.album_id = a.id
group by a.id;

/*Все исполнители, которые не выпустили альбомы в 2020 году*/
select name from bands b2 
except
select b.name from bandalbum ba
join album a on a.id = ba.album_id
join bands b on b.id = ba.band_id 
where a.year_of = 2020

/*Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)*/
SELECT distinct coll.name FROM CollectionOfSongs coll 
JOIN songcollection sc ON sc.CollectionOfSongs_id  = coll.id 
join songs s on s.id = sc.song_id 
join album a on a.id = s.album_id 
join bandalbum ba on ba.album_id = a.id 
join bands b on b.id = ba.band_id
where b.name = 'Oduvan4ik band'
