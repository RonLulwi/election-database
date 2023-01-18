# Election database

## Data

- A polling place has an address and a list of people who can vote in it.
- For each voter we store his id, name, address, gender and age. Exactly one ballot box is being placed in each polling place. 
- The DB also store information about the cities socioeconomic index and The sector that characterizes the city. 
- On the election day every voter can arrive the polling place and vote for a certain party by inserting exactly one vote card into the ballot box. Each vote card has the party letters written on it, which are unique for the party. A party has a name, a political position, a rated list of its candidates and a chairman. The chairman is the candidate who placed at the top of the list.

## Users

Election Commission - will receive information about:
- Election results in the polls
- Polling place
- Voters
- Cities 

The press - will receive information about:
- the election results in the polls. 


## ERD

![image](https://user-images.githubusercontent.com/95926852/213276703-7ac806ad-4d57-4694-82cc-f0c30c868824.png)

## Tables

![image](https://user-images.githubusercontent.com/95926852/213276769-e72084b2-12ac-4e8f-895f-1ef169a92a9c.png)

