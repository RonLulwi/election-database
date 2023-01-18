CREATE SCHEMA election;
USE election;

CREATE TABLE City (
City_Name VARCHAR(45),
Socio_Economic_Index INTEGER,
Sector VARCHAR(45),
PRIMARY KEY (City_Name));

CREATE TABLE Ballot_Box (
Ballot_Id INTEGER NOT NULL AUTO_INCREMENT,
PRIMARY KEY (Ballot_Id));

CREATE TABLE Polling_Place (
Polling_Id INTEGER NOT NULL AUTO_INCREMENT,
City VARCHAR(45),
Street VARCHAR(45),
StreetNum INTEGER,
ZipCode VARCHAR(5),
Ballot_Id INTEGER,
PRIMARY KEY (Polling_Id),
FOREIGN KEY (City) REFERENCES City(City_Name),
FOREIGN KEY (Ballot_Id) REFERENCES Ballot_Box(Ballot_Id));

CREATE TABLE Voter ( 
Voter_Id VARCHAR(9) NOT NULL,
FirstName VARCHAR(45),
LastName VARCHAR(45),
City VARCHAR(45),
Street VARCHAR(45),
StreetNum INTEGER,
ZipCode VARCHAR(5),
Gender VARCHAR(1),
Polling_Id INTEGER NOT NULL,
PRIMARY KEY (Voter_Id),
FOREIGN KEY (Polling_Id) REFERENCES Polling_Place(Polling_Id),
FOREIGN KEY (City) REFERENCES City(City_Name));

CREATE TABLE Party (
Party_Letters VARCHAR(3) NOT NULL,
Party_Name VARCHAR(45),
Political_Position VARCHAR(45),
PRIMARY KEY (Party_Letters));

CREATE TABLE Candidate (
Party_Letters VARCHAR(3),
Voter_Id VARCHAR(45),
List_Position INTEGER,
PRIMARY KEY (Voter_Id),
FOREIGN KEY (Voter_Id) REFERENCES Voter(Voter_Id)ON delete cascade,
FOREIGN KEY (Party_Letters) REFERENCES Party(Party_Letters));

CREATE TABLE Voting_Card (
Party_Letters VARCHAR(3),
Ballot_Id INTEGER,
FOREIGN KEY (Party_Letters) REFERENCES Party(Party_Letters),
FOREIGN KEY (Ballot_Id) REFERENCES Ballot_Box(Ballot_Id));


CREATE VIEW results AS(
SELECT Party_Name, Votes
FROM 
(SELECT Party_Letters, count(party_letters) AS Votes
FROM voting_card 
GROUP BY Party_Letters) AS results INNER JOIN party 
WHERE party.Party_Letters = results.Party_Letters
GROUP BY Party_Name);

CREATE VIEW city_results AS(
SELECT city, count(voting_card.Party_Letters) AS votes 
FROM polling_place INNER JOIN voting_card
	ON polling_place.Ballot_Id = voting_card.Ballot_Id
GROUP BY city
ORDER BY votes DESC);


DELIMITER $$

CREATE TRIGGER remove_voter
BEFORE DELETE 
ON voter FOR EACH ROW
BEGIN
DECLARE position INTEGER;
DECLARE letters VARCHAR(3);

SELECT list_position, Party_Letters
INTO position, letters
FROM voter RIGHT JOIN candidate 
ON voter.voter_id = candidate.voter_ID
WHERE OLD.voter_id = candidate.voter_ID;

UPDATE 
candidate
SET list_position = list_position - 1
WHERE list_position > position AND Party_Letters = letters;

END$$
DELIMITER ;
