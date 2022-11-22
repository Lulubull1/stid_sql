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
