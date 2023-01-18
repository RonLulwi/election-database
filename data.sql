USE election;

INSERT INTO City VALUES 
('Ness Ziona', 7, 'General'),
('Rehovot', 9, 'General'),
('Tel Aviv', 5, 'General'),
('Jerusalem', 3, 'Arab'),
('Eilat', 7, 'Arab'),
('Dimona', 2, 'Arab'),
('Beer Sheva', 4, 'Orthodox'),
('Afula', 3, 'Orthodox'),
('Tveria', 7, 'Orthodox'),
('Ramat Gan', 7, 'Orthodox'),
('Ashdod', 9, 'Arab'),
('Ashkelon', 2, 'General'),
('Rishon', 3, 'General');

INSERT INTO Ballot_Box VALUES 
(),(),(),(),(),(),(),(),(),();

INSERT INTO Polling_Place (City, Street, StreetNum, zipCode, Ballot_Id) VALUES 
('Ness Ziona', 'BEN-YEHUDA', 7, '12345', 1),
('Rehovot', 'HERZL', 32, '22222', 2),
('Tel Aviv', 'HERZL', 18, '56487', 3),
('Jerusalem', 'BALFOUR', 40, '43265', 4),
('Jerusalem', 'BALFOUR', 50, '78451', 10),
('Jerusalem', 'BALFOUR', 2, '23548',5),
('Dimona', 'Rotem', 20, '96965', 6),
('Dimona', 'Yakinton', 28, '45621', 7),
('Afula', 'Yakinton', 5, '78523', 8),
('Tveria', 'Banai', 6, '12354', 9);

INSERT INTO Voter VALUES 
('999999999', 'Toto'   , 'Chen', 'Ramat Gan', 'RAMBAM', 7, '81542', 'M', 9),
('456789123', 'bibi'   , 'bibi', 'Ramat Gan', 'YAFO', 72, '15195', 'M', 1),
('456123789', 'beni'   , 'gantz', 'Rehovot', 'HERZL', 27, '15915', 'F', 9),
('357654213', 'ehud'   , 'barak', 'Jerusalem', 'ALLENBY', 71, '45678', 'M', 2),
('789123555', 'yaeer'  , 'lapid', 'Rishon', 'RAMBAM', 17, '78952', 'F', 10),
('456285456', 'naftali', 'benet', 'Ness Ziona', 'LILIENBLUM', 74, '48915', 'M', 4),
('789254561', 'ayelet' , 'shaked', 'Ashdod', 'ROTHSHILD', 47, '81481', 'F', 5),
('987653212', 'israel'  , 'Catz', 'Ashkelon', 'KALISCHER', 67, '81548', 'M', 7),
('185295987', 'ron' , 'lulu', 'Rehovot', 'GRUZENBERG', 76, '87892', 'M', 3),
('789513215', 'neta' , 'konsens', 'Ness Ziona', 'BRENNER', 77, '48642', 'F', 8),
('789456212', 'gidon' , 'sahar', 'Ramat Gan', 'BALFOUR', 78, '84742', 'M', 8),
('789456789', 'ahmad' , 'tibi', 'Jerusalem', 'SHEINKIN', 87, '89842', 'F', 2),
('789123654', 'tzipi'  , 'libni', 'Rishon', 'HESS', 97, '82352', 'F', 4),
('987321456', 'mirav'  , 'micaeli', 'Ashdod', 'NAPHA', 79, '81562', 'F', 3),
('417258946', 'yair' , 'hen', 'Ramat Gan', 'MAZEH', 70, '81852', 'M', 5),
('489489489', 'ifat'  , 'biton', 'Tel Aviv', 'BIALIK', 13, '77742', 'F', 6),
('585858585', 'Avi'    , 'Cohen', 'Ness Ziona', 'BIALIK', 18, '12345', 'M', 1),
('111111111', 'Ron'    , 'Levi', 'Rehovot', 'BIALIK', 20, '45632', 'M', 1),
('222222222', 'Neta'   , 'Chen', 'Jerusalem', 'Herzel', 7, '75461', 'F', 2),
('333333333', 'David'  , 'Cohen', 'Afula', 'ALLENBY', 7, '48752', 'M', 3),
('444444444', 'Gogo'   , 'Gogo', 'Dimona', 'YAFO', 7, '42365', 'F', 3),
('555555555', 'Momo'   , 'Momo', 'Dimona', 'LILIENBLUM', 7, '11452', 'F', 4),
('666666666', 'Koko'   , 'Koko', 'Afula', 'HA-CARMEL', 7, '33468', 'F', 5),
('777777777', 'Jojo'   , 'Jojo', 'Afula', 'MONTEFIORE', 7, '81547', 'M', 7),
('888888888', 'Fofo'   , 'Tal', 'Beer Sheva', 'MAZEH', 7, '36524', 'F', 8);

INSERT INTO Party VALUES 
('AAA', 'Likud', 'Right'),
('BBB', 'Kadima', 'Right'),
('CCC', 'Yamina', 'left'),
('DDD', 'Haavoda', 'Left'),
('EEE', 'Zehut', 'Right');

INSERT INTO Candidate VALUES
('AAA',185295987 , 1),
('AAA',789513215 , 2),
('AAA',456789123 , 3),
('BBB',456123789 , 1),
('BBB',357654213 , 2),
('BBB',789123555 , 3),
('CCC',456285456 , 1),
('CCC',789254561 , 2),
('CCC',987653212 , 3),
('DDD',789456212 , 1),
('DDD',789456789 , 2),
('DDD',789123654 , 3),
('EEE',987321456 , 1),
('EEE',417258946 , 2),
('EEE',489489489 , 3);

INSERT INTO Voting_Card VALUES
('AAA',1 ),
('AAA',2),
('AAA',3),
('BBB',4),
('BBB',5),
('BBB',6),
('CCC',7),
('CCC',8),
('CCC',9),
('DDD',10),
('AAA',1),
('AAA',2),
('AAA',3),
('AAA',4),
('BBB',5),
('BBB',6),
('AAA',7),
('CCC',8),
('AAA',9),
('DDD',10),
('AAA',1),
('AAA',2),
('BBB',6),
('AAA',7),
('CCC',8);

