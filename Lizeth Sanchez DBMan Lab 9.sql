CREATE TABLE People (
  pID CHAR(10)NOT NULL,
  firstName TEXT,
  lastName TEXT,
  address VARCHAR(100),
  phoneNumber VARCHAR(10),
  PRIMARY KEY (pID)
);

CREATE TABLE Teams (
  tID CHAR(10) NOT NULL,
  ageGroup VARCHAR(10),
  hID CHAR(10) REFERENCES headCoaches,
  aID CHAR(10) REFERENCES assistantCoaches,
  playID CHAR(10) REFERENCES Players,
  PRIMARY KEY (tID, ageGroup, hID, aID, playID)
);

CREATE TABLE headCoaches (
  hID char(10) NOT NULL,
  pID CHAR(10) REFERENCES People,
  years NUMERIC(4),
  PRIMARY KEY (hID,pID)
);

CREATE TABLE assistantCoaches (
  aID CHAR(10) NOT NULL,
  pID CHAR(10) REFERENCES People,
  years NUMERIC(4),
  PRIMARY KEY (aID,pID)
);

CREATE TABLE Players (
  playID CHAR(10),
  pID CHAR(10) REFERENCES People,
  ageGroup VARCHAR(10) REFERENCES Teams,
  PRIMARY KEY (playID)
);