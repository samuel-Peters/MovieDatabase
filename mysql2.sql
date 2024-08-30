-- Data Manipulation Language - DML allows you to interact with data inside your datbase
-- Adding data

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('Bruce Almighty','Delry Lindo',1998,7.5,'A man blames God for all his misfortunes until God gives him his place for 7 days','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('The Matrix','Keanu Reeves',1999,8.7,'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('Inception','Leonardo DiCaprio',2010,8.8,'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('The Godfather','Marlon Brando',1972,9.2,'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('Pulp Fiction','John Travolta',1994,8.9,'The lives of two mob hitmen, a boxer, a gangster, and his wife intertwine in four tales of violence and redemption.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('The Dark Knight','Christian Bale',2008,9.0,'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('Forrest Gump','Tom Hanks',1994,8.8,'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal, and other historical events unfold from the perspective of an Alabama man with an IQ of 75.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('Back to the Future','Michael J. Fox',1985,8.5,'Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, eccentric scientist Doc Brown.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('Gladiator','Russell Crowe',2000,8.5,'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.','2024-06-05','released',0,1);

INSERT `movietitles` (movietitle,director,releaseyear,rating,synopsis,dateadded,moviestatus,deleted,addedby)
VALUES('Schindler\'s List','Liam Neeson',1993,9.0,'In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.','2024-06-05','released',0,1);

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










