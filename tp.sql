--Exercice 1, on ouvre le fichier pour creer la base de donnees et on l'execute (Executer un script)

--Exercice 2.1 (Tous les films par Steven Spielberg)
SELECT *
FROM Movie
WHERE director = 'Steven Spielberg';

--Exercice 2.2 (Annees des films qui ont recu une note de 4 ou 5, ordre croissant)
SELECT TITLE AS "Titre", EXTRACT(YEAR FROM RATINGDATE) AS "Annee de sortie", STARS AS "Etoiles"
FROM MOVIE, RATING
WHERE MOVIE.MID = RATING.MID
AND STARS = 4
OR STARS = 5
ORDER BY 2;

--Exercice 2.3 (Nom des personnes qui ont note le film gone with the wind)
SELECT NAME AS "Reviewer", MOVIE.TITLE As "Film noté"
FROM MOVIE, RATING, REVIEWER
WHERE RATING.RID = REVIEWER.RID
AND RATING.MID = MOVIE.MID
AND MOVIE.TITLE = 'Gone with the Wind';

--Exercice 2.4 (Nom evaluateur identique au realisateur)
SELECT REVIEWER.NAME, MOVIE.TITLE, RATING.STARS
FROM MOVIE, RATING, REVIEWER
WHERE MOVIE.MID = RATING.MID
AND RATING.RID = REVIEWER.RID
AND MOVIE.DIRECTOR = REVIEWER.NAME;

--Exercice 2.5
SELECT REVIEWER.NAME AS "Nom examinateur", MOVIE.TITLE AS "Titre du film", RATING.STARS AS "Etoiles"
FROM MOVIE, RATING, REVIEWER
WHERE REVIEWER.RID = RATING.RID
AND MOVIE.MID = RATING.MID
ORDER BY 1;

--Exercice 2.6
SELECT MID
FROM MOVIE
WHERE MOVIE.MID NOT IN (SELECT MOVIE.MID
                        FROM MOVIE, REVIEWER, RATING
                        WHERE REVIEWER.RID = RATING.RID
                        AND MOVIE.MID = RATING.MID
                        AND REVIEWER.NAME = 'Chris Jackson');
                        
--Exercice 2.7
SELECT 