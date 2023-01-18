-- q1, The national results 
SELECT Party_Name, Votes,  ROUND(votes / (SELECT SUM(votes) FROM results) * 120) AS Mandates
FROM results;

-- q2, The distribution of votes by right and left wing.  
SELECT Political_Position, Votes, ROUND(Votes / (SELECT SUM(votes) FROM results) * 120) AS Mandates
FROM
(SELECT Political_Position, SUM(Votes) AS Votes , ROUND(Votes / (SELECT SUM(votes) FROM results) * 120) AS Mandates
FROM results INNER JOIN party ON results.Party_Name = party.Party_Name
GROUP BY Political_Position) AS res;

-- q3, How many people voted in each city                    
SELECT city, votes, CONCAT(FORMAT((votes / (SELECT SUM(votes) FROM city_results) * 100), 0), '%')  AS percentage 
FROM
city_results;

-- q4 , All parties chairman
SELECT Firstname , LastName , Party_Name
FROM voter INNER JOIN candidate INNER JOIN party
	ON voter.Voter_Id = candidate.Voter_Id AND candidate.Party_Letters = party.Party_Letters
WHERE List_Position = 1 ;

-- q5 , The distribution of votes between the different parties in Jerusalem
SELECT Party_Name, percentage
FROM 
(SELECT party_letters, CONCAT(FORMAT((COUNT(party_letters) / (SELECT SUM(votes) FROM city_results WHERE city = 'Jerusalem') * 100), 0), '%')  AS percentage 
FROM (ballot_box INNER JOIN polling_place ON polling_place.Ballot_Id = ballot_box.ballot_ID) INNER JOIN voting_card ON voting_card.Ballot_Id = ballot_box.Ballot_Id
WHERE polling_place.City = 'Jerusalem'
GROUP BY Party_Letters) AS res 
INNER JOIN party   
WHERE party.Party_Letters = res.Party_Letters
GROUP BY Party_Name;

-- q6, The winning party
SELECT Party_Name AS Winning_Party, MAX(Votes) AS Votes  
FROM results;

-- q7, All the voters who live in Rehovot
SELECT FirstName, LastName
FROM voter
WHERE city = 'Rehovot';

-- q8, All polling places in Jerusalem
SELECT Street , StreetNum
FROM polling_place
WHERE city = 'Jerusalem';

-- q9, Likud list
SELECT FirstName, LastName ,List_Position , Party_name
FROM (candidate INNER JOIN party ON party.Party_Letters = candidate.Party_Letters) INNER JOIN voter 
				WHERE voter.Voter_Id = candidate.Voter_Id 
AND party_name = 'Likud'
ORDER BY List_Position;

-- q10, The best prime minister and his 2ND
SELECT FirstName, LastName 
FROM
(SELECT Party_Name  
FROM results LIMIT 1) AS res INNER JOIN party ON (res.Party_Name = party.Party_Name) INNER JOIN candidate ON party.Party_Letters = candidate.Party_Letters INNER JOIN voter ON (candidate.Voter_Id = voter.Voter_Id)
WHERE List_Position <= 2 ;

-- q11, Result in cities with socio economic index larger then 4
SELECT city , Socio_Economic_Index, votes
FROM city_results INNER JOIN city 
		ON city_results.city = city.City_Name
WHERE Socio_Economic_Index > 4; 

-- q12, Show all cities that have arab/orthodox population
SELECT sector, city_name
FROM city
WHERE sector ='Arab' OR sector ='Orthodox'
ORDER BY sector;

UPDATE voter
SET City = 'Rehovot', Street = 'yoyo',  StreetNum = 10,  ZipCode = '58731'
WHERE Voter_Id = '999999999';

UPDATE party
SET Party_Name = 'lemata'
WHERE Party_Letters = 'Zehut';

UPDATE city
SET Sector = 'Arab' , Socio_Economic_Index = 5
WHERE City_Name = 'Afula';

INSERT INTO voter VALUES
('975843260', 'koko'   , 'papi', 'Ramat Gan', 'bigben', 16, '87772', 'F', 7);

INSERT INTO city VALUES
('raanana', 2 , 'General');

DELETE 
FROM voter
WHERE Voter_Id = '789513215';



