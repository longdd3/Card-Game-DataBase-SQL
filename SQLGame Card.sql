
Create TABLE CardDetail
(
CardID INT NOT NULL,
Color VARCHAR(25) NOT NULL,
PRIMARY KEY(CardID), 
);
CREATE TABLE CardType
(
  CardTypeID INT NOT NULL,
  Name VARCHAR(15) NOT NULL,
  PRIMARY KEY (CardTypeID)
);


CREATE TABLE Users
(
  UserID INT NOT NULL,
  Level INT NOT NULL,
  Winrate INT NOT NULL,
  UserName VARCHAR(20) NOT NULL,
  PRIMARY KEY (UserID)
);

CREATE TABLE CardAttributes
(
  CardAttributeID INT NOT NULL,
  Name VARCHAR(10) NOT NULL,
  PRIMARY KEY (CardAttributeID),
);

CREATE TABLE Card
(
  CardID INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  CardTypeID INT NOT NULL,
  Attack INT NOT NULL,
  Defend INT NOT NULL,
  CardAttributeID INT NOT NULL,
  NumberofStar INT NOT NULL,
  PRIMARY KEY (CardID, CardTypeID, CardAttributeID),
  FOREIGN KEY (CardID)      REFERENCES CardDetail(CardID),
  FOREIGN KEY (CardTypeID)      REFERENCES CardType(CardTypeID),
  FOREIGN KEY ( CardAttributeID) REFERENCES CardAttributes(CardAttributeID)
);
CREATE TABLE Ability
(
  AbilityID INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Description VARCHAR(30) NOT NULL,
  CardID INT NOT NULL,
  PRIMARY KEY (AbilityID),
  FOREIGN KEY (CardID) REFERENCES CardDetail(CardID)
);


CREATE TABLE PlayerDeck
(
  DeckID INT NOT NULL,
  UserName VARCHAR(20) NOT NULL,
  Numberofcard INT NOT NULL,
  PRIMARY KEY (DeckID)
); 
CREATE TABLE PlayerDeckcard
(
  CardID INT NOT NULL,
  UserID INT NOT NULL,
  DeckID INT NOT NULL,
  PRIMARY KEY (CardID, UserID, DeckID),
  FOREIGN KEY (CardID) REFERENCES CardDetail(CardID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (DeckID) REFERENCES PlayerDeck(DeckID)
);

INSERT INTO CardType VALUES ('1','Dragon');
INSERT INTO CardType VALUES ('2','Zombie');
INSERT INTO CardType VALUES ('3','Fiend');
INSERT INTO CardType VALUES ('4','Pyro');
INSERT INTO CardType VALUES ('5','Dinosaus');
INSERT INTO CardType VALUES ('6','Warrior');
INSERT INTO CardType VALUES ('7','Machine');
INSERT INTO CardType VALUES ('8','Fish');
INSERT INTO CardType VALUES ('9','Sea Serpent');
INSERT INTO CardType VALUES ('10','Plant');


INSERT INTO CardDetail VALUES ('46986414','Blue');
INSERT INTO CardDetail VALUES ('49881766','Green');
INSERT INTO CardDetail VALUES ('51275027','Red');
INSERT INTO CardDetail VALUES ('86498013','Grey');
INSERT INTO CardDetail VALUES ('06631034','Purple');
INSERT INTO CardDetail VALUES ('79182538','Orange');
INSERT INTO CardDetail VALUES ('44519536','White');
INSERT INTO CardDetail VALUES ('78371393','Yellow');
INSERT INTO CardDetail VALUES ('04779091','Pink');
INSERT INTO CardDetail VALUES ('62113340','Dark');


INSERT INTO CardAttributes VALUES ('1','Light');
INSERT INTO CardAttributes VALUES ('2','Dark');
INSERT INTO CardAttributes VALUES ('3','Water');
INSERT INTO CardAttributes VALUES ('4','Fire');
INSERT INTO CardAttributes VALUES ('5','Earth');
INSERT INTO CardAttributes VALUES ('6','Wind');
INSERT INTO CardAttributes VALUES ('7','Devine');
INSERT INTO CardAttributes VALUES ('8','Heart');
INSERT INTO CardAttributes VALUES ('9','Zone');
INSERT INTO CardAttributes VALUES ('10','No Element');



INSERT INTO Card VALUES ('46986414','Dark Magician','2', '2500','2000','7','10');
INSERT INTO Card VALUES ('51275027','The Unhappy Maiden','1' , '0','100','1','8');
INSERT INTO Card VALUES ('49881766','Archfiend Soldier','2' , '1900','1500','3','4');
INSERT INTO Card VALUES ('86498013','DDTrainer','2' , '100','2000','3','1');
INSERT INTO Card VALUES ('62113340','Divine Dragon Ragnarok','1' , '1500','1000','1','4');
INSERT INTO Card VALUES ('06631034','Frostosaurus','3' , '2500','1700','5','7');
INSERT INTO Card VALUES ('79182538','Mad Dog of Darkness','2' , '1900','1400','9','4');
INSERT INTO Card VALUES ('44519536','Left Leg of the Forbidden One','2' , '200','300','3','1');
INSERT INTO Card VALUES ('78371393','Yubel','2' , '0','0','3','10');
INSERT INTO Card VALUES ('04779091','Yubel - Terror Incarnate','2' , '0','0','3','11');


SELECT  CardID, Name, CardTypeID, Attack, Defend, CardAttributeID, NumberofStar
FROM 	Card;

INSERT INTO Ability VALUES ('854126','Dark Ball','No Effect','46986414');
INSERT INTO Ability VALUES ('4856210','Black Ball','No Effect','44519536');
INSERT INTO Ability VALUES ('584122','Earth Germ','Direct Attack','04779091');
INSERT INTO Ability VALUES ('54168974','Death Realm', 'Counter Attack', '78371393');
INSERT INTO Ability VALUES ('4715215','Dark Call', 'Recover Health', '51275027');
INSERT INTO Ability VALUES ('0048561','Death Beam','Posion', '79182538');
INSERT INTO Ability VALUES ('778961','Holly Summoner', 'Special Summon', '62113340');
INSERT INTO Ability VALUES ('78941411','Ice call', 'Frezze All enemy', '06631034');
INSERT INTO Ability VALUES ('4021610','Soul Eater', 'Posion', '49881766');
INSERT INTO Ability VALUES ('4586310','Power of darkness', 'DirectAttack', '86498013');
 SELECT * 
 FROM Ability;
INSERT INTO PlayerDeck VALUES ('8114','LongDdeck', '40');
INSERT INTO PlayerDeck VALUES ('5831','YugiohDeck', '45');
INSERT INTO PlayerDeck VALUES ('58105','KaibaDeck', '50');
INSERT INTO PlayerDeck VALUES ('4410','YusieDeck', '49');
INSERT INTO PlayerDeck VALUES ('7745','KarikDeck', '55');
INSERT INTO PlayerDeck VALUES ('1147','JonoyseDeck', '60');
INSERT INTO PlayerDeck VALUES ('1485','Beatmeetdeck', '47'); 
INSERT INTO PlayerDeck VALUES ('6958','Shirondeck', '53');
INSERT INTO PlayerDeck VALUES ('7521','UbbDecl', '46');
INSERT INTO PlayerDeck VALUES ('44896','NotailDeck', '50');


INSERT INTO Users VALUES ('7541203','100', '70','LongD');
INSERT INTO Users VALUES ('4475210','2', '100','YuSie');
INSERT INTO Users VALUES ('4100132','82', '80','KaiBa');
INSERT INTO Users VALUES ('88710','44', '12','Shiron');
INSERT INTO Users VALUES ('41036','11', '80','Jonoyse');
INSERT INTO Users VALUES ('47892001','74', '50','Yugioh');
INSERT INTO Users VALUES ('1023685','41', '90','Ubb');
INSERT INTO Users VALUES ('874121','47', '66','BeatMeet');
INSERT INTO Users VALUES ('653001','89', '88','Karik');
INSERT INTO Users VALUES ('596311','41', '58','Notail');



INSERT INTO PlayerDeckcard VALUES ('06631034','7541203', '58105');
INSERT INTO PlayerDeckcard VALUES ('78371393','47892001', '7745');
INSERT INTO PlayerDeckcard VALUES ('49881766','4475210', '4410');
INSERT INTO PlayerDeckcard VALUES ('79182538','88710', '5831');
INSERT INTO PlayerDeckcard VALUES ('44519536','41036', '8114');
INSERT INTO PlayerDeckcard VALUES ('06631034','1023685', '1147');
INSERT INTO PlayerDeckcard VALUES ('44519536','4100132', '6958');
INSERT INTO PlayerDeckcard VALUES ('46986414','874121', '7745');
INSERT INTO PlayerDeckcard VALUES ('62113340','653001', '7521');
INSERT INTO PlayerDeckcard VALUES ('04779091','596311', '44896');