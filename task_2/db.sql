CREATE TABLE `firmName` (
  `firmID` integer PRIMARY KEY,
  `name` varchar(255),
  `adress` varchar(255)
);

CREATE TABLE `driver` (
  `driverId` integer PRIMARY KEY,
  `fio` varchar(255),
  `firmID` integer
);

CREATE TABLE `gruz` (
  `gruzID` integer PRIMARY KEY,
  `mass` integer,
  `cost` integer,
  `naming` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `gruzTrevel` (
  `gruzID` integer,
  `date` date,
  `travelID` integer
);

CREATE TABLE `Travel` (
  `travelID` integer,
  `date` date,
  `departurepoint` varchar(255),
  `destination` varchar(255),
  `driverId` integer,
  `carID` integer,
  PRIMARY KEY (`travelID`, `date`)
);

CREATE TABLE `Car` (
  `carID` integer PRIMARY KEY,
  `typeOFcar` varchar(255),
  `brandOFcar` varchar(255),
  `firmID` integer
);

ALTER TABLE `driver` ADD FOREIGN KEY (`firmID`) REFERENCES `firmName` (`firmID`);

ALTER TABLE `gruzTrevel` ADD FOREIGN KEY (`gruzID`) REFERENCES `gruz` (`gruzID`);

ALTER TABLE `Travel` ADD FOREIGN KEY (`driverId`) REFERENCES `driver` (`driverId`);

ALTER TABLE `Travel` ADD FOREIGN KEY (`carID`) REFERENCES `Car` (`carID`);

ALTER TABLE `gruzTrevel` ADD FOREIGN KEY (`date`) REFERENCES `Travel` (`date`);

ALTER TABLE `gruzTrevel` ADD FOREIGN KEY (`travelID`) REFERENCES `Travel` (`travelID`);
