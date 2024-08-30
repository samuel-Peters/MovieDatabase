-- Data Manipulation Language - DML allows you to interact with data inside your datbase
-- Adding data

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('The Matrix','Keanu Reeves',1999,8.7,'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.','2024-06-05','released',0,1);

-- select statement - used to quer data from database
SELECT * FROM movietitles

SELECT movieid,synopsis,movietitle,releaseyear,rating
FROM movietitles

-- filter data -- where clause --
SELECT movieid,synopsis,movietitle,releaseyear,rating
FROM movietitles
WHERE -- releaseyear>=2001 and rating>=6 
synopsis LIKE '%man%'

-- sort data -- order by clause
SELECT movieid,synopsis,movietitle,releaseyear,rating
FROM movietitles
ORDER BY releaseyear, rating DESC

-- functions - inbuilt functions
-- scalar value functions -- work on specific data in a column
SELECT movieid,UPPER (synopsis) AS uppercasesynopsis,movietitle,releaseyear,rating,
CHAR_LENGTH (movietitle) charactersintitle, LEFT(movietitle,3) abbreviation
FROM movietitles

-- aggregate functions
SELECT COUNT(movieid) moviestotal
FROM movietitles

SELECT AVG(rating)
FROM movietitles

SELECT SUM(rating)
FROM movietitles

SELECT MAX(releaseyear) 
FROM movietitles

-- grouping functions --group by clause
SELECT releaseyear, COUNT(movieid) AS moviesreleased
FROM movietitles
GROUP BY releaseyear
HAVING COUNT(movieid)>1


INSERT INTO users(`username`,`firstname`,`lastname`)
VALUES('support','user','support')


-- joins -- allow us to combine tables into a single result set
-- inner join or equi join
SELECT movieid,synopsis,movietitle,releaseyear,rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m,users AS u
WHERE m.`addedby`=u.`userid`

--
SELECT movieid,synopsis,movietitle,releaseyear,rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m JOIN users AS u
ON m.`addedby`=u.`userid`


-- outer join
SELECT movieid,synopsis,movietitle,releaseyear,rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m LEFT OUTER JOIN users AS u
ON m.`addedby`=u.`userid`


SELECT movieid,synopsis,movietitle,releaseyear,rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m users AS u
ON m.`addedby`*=u.`userid`










