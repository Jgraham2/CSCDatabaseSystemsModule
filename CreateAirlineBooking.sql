USE airline_booking;

-- Table Check

DROP TABLE IF EXISTS `passenger_details`; 
DROP TABLE IF EXISTS `aeroplane`; 
DROP TABLE IF EXISTS `airport`; 
DROP TABLE IF EXISTS `boarding_pass`; 
DROP TABLE IF EXISTS `checkin`; 
DROP TABLE IF EXISTS `flight`;
DROP TABLE IF EXISTS `promo_code`; 
DROP TABLE IF EXISTS `seats`; 
DROP TABLE IF EXISTS `travel_class`;
DROP TABLE IF EXISTS `luggage`;
DROP TABLE IF EXISTS `payment`; 
DROP TABLE IF EXISTS `card_details`; 
DROP TABLE IF EXISTS `account_details`; 
DROP TABLE IF EXISTS `account`; 
DROP TABLE IF EXISTS `booking`; 
DROP TABLE IF EXISTS `booking_status`; 
DROP TABLE IF EXISTS `passenger`;


/*******************************************************************************
   Create Tables And Insert Data 
********************************************************************************/

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `airline_booking`
--

-- --------------------------------------------------------

-- BEGIN

CREATE TABLE IF NOT EXISTS `passenger_details` (
  `PassengerDetailsID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `Forename` VARCHAR(50) NOT NULL,
  `Surname` VARCHAR(50) NOT NULL,
  `Birthdate` DATE NOT NULL,
  `Title` VARCHAR(20),
  `Address` VARCHAR(255) NOT NULL,
  `Town` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  `Postcode` VARCHAR(20) NOT NULL,
  `Telephone` INTEGER(20),
  `MobileNumber` INTEGER(20) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY  (`PassengerDetailsID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `passenger_details` (`PassengerDetailsID`, `PassengerID`, `Forename`, `Surname`, `Birthdate`, `Title`, `Address`, `Town`, `City` , `Country` , `Postcode` , `Telephone` , `MobileNumber`, `Email`) VALUES
(1, 1, 'Sam', 'Kay', '1991-05-07', 'Mrs', '13 hill Lane', 'Lisburn North', 'Lisburn', 'County Down', 'BT20 1OW', 028249268741, 07843666341, 'S.Kay@hotmail.com'),
(2, 2, 'Peter', 'Evans', '1990-03-07', 'Mr', '12 Forthill Lane', 'Bangor West', 'Bangor', 'County Down', 'BT19 1NW', 02824832234, 0774322341, 'P.Evans@hotmail.com'),
(3, 3, 'Ann', 'Foster', '1992-06-21', 'Mrs', '24 Manor Rd ', 'Esher', 'London', 'London', 'kt10 0ql ', 02824832234, 0774322341, 'Ann.Foster01@icloud.com'),
(4, 4, 'Belinda', 'Hale', '1951-04-07', 'Mr', '22 Powburn Cres', 'York', 'Yorkshire', 'York', 'BT12 9NW', 02824832234, 0774322341, 'BelindaHale@gmail.com'),
(5, 5, 'Nick', 'Sherman', '1967-11-10', 'Mr', '3 Baron Glade', 'South West', 'Cornwell', 'Cornwell', 'BT20 9ZX', 02824832234, 074652341, 'Sherman78@hotmail.co.uk'),
(6, 6, 'Terrell', 'Kelley', '1999-01-12', 'Mr', '42 Woodcroft Cres', 'Trillick', 'Omagh', 'Tyrone', 'BT30 1OP', 02824832234, 0774387141, 'TKelley@yahoo.com'),
(7, 7, 'Derrick', 'Dixon', '2001-10-02', 'Mr', 'Birch Cross', 'Newtown', 'Londonderry/derry', 'County Derry', 'BT1 0NW', 02898832234, 0774322341, 'Derrick45@hotmail.com'),
(8, 8, 'Howard', 'Washington', '2008-12-25', 'Mr', '25 Capability Way', 'Liverpool', 'Merseyside', 'Liverpool', 'BT78 5HL', 02824838534, 0774322341, 'Washington.Howard@hotmail.com'),
(9, 9, 'Kirk', 'Shaw', '1944-11-18', 'Mr', '4 Elmfield Cl', 'Bangor South', 'Bangor', 'County Down', 'BT94 1NW', 028254623134, 0774322341, 'KShaw12@hotmail.com'),
(10, 10, 'Peter', 'Shaw', '1976-05-03', 'Mr', '1 David St', 'Bristol', 'Bristol', 'County Down', 'BT45 1KW', 028256152234, 0788322341, 'Shaw.PeterJ@hotmail.com');


CREATE TABLE IF NOT EXISTS `aeroplane` (
  `PlaneID` INTEGER AUTO_INCREMENT,
  `FlightID` INTEGER,
  `SeatID` INTEGER,
  `ModelNumber` INTEGER(5) NOT NULL,
  `ModelName` VARCHAR(5) NOT NULL,
  `PlaneCode` VARCHAR(20) NOT NULL,
  `SeatAmount` INTEGER(100) NOT NULL,
  `SeatPlan` VARCHAR(255) NOT NULL,
  PRIMARY KEY  (`PlaneID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `aeroplane` (`PlaneID`, `ModelNumber`, `ModelName`, `PlaneCode`, `SeatAmount`, `SeatPlan`) VALUES
(1, 723, 'AC', 'EZY1', 100, '1A'),
(2, 732, 'AB', 'EZY2', 120, '2A'),
(3, 745, 'BC', 'EZY3', 140, '3A'),
(4, 748, 'BO', 'EZY4', 170, '4A'),
(5, 790, 'BD', 'EZY5', 190, '5A'),
(6, 754, 'AF', 'EZ61', 220, '6A'),
(7, 743, 'CA', 'EZY7', 240, '7A'),
(8, 752, 'CD', 'EZY8', 250, '8A'),
(9, 747, 'DA', 'EZY9', 280, '9A'),
(10, 707, 'DC', 'EZY10', 300, '10A');

-- INSERT INTO aeroplane(Model) VALUES ('ABCDE12345'); 

-- UPDATE aeroplane SET PlaneCode = concat(ModelName, ModelNumber);

CREATE TABLE IF NOT EXISTS `airport` (
  `AirportID` INTEGER AUTO_INCREMENT,
  `AirportCode` VARCHAR(10),
  `AirportName` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  PRIMARY KEY  (`AirportID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `airport` (`AirportID`, `AirportCode`,`AirportName`,`Country`) VALUES 
(1, 'DUB', 'Dublin', 'Ireland'),
(2, 'BHD','Belfast City', 'Northern Ireland'),
(3, 'GLA', 'Glasgow', 'Scotland'),
(4, 'EDI', 'Edinburgh', 'Scotland'),
(5, 'IOM', 'Ilse of Man', 'Ilse of Man'),
(6, 'LPL', 'Liverpool', 'England'),
(7, 'NCL', 'Newcastle', 'England'),
(8, 'BRS', 'Bristol', 'England'),
(9, 'MAN', 'Manchester', 'England'),
(10, 'LGW', 'London Gatwick', 'England');


CREATE TABLE IF NOT EXISTS `boarding_pass` (
  `BoardingPassID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `FlightID` INTEGER,
  `SeatID` INTEGER,
  `BoardingPass` VARCHAR (10),
  `BoardingCode` VARCHAR(4) default 'PSGR', 
  `BoardingNumber` INTEGER,
  `PassengerName` VARCHAR(255) NOT NULL,
  `Seat` VARCHAR(5),
  `Barcode` INTEGER(10) NOT NULL,
  `BoardingTime` TIME NOT NULL,
  `SequenceNumber` INTEGER(20) NOT NULL,
  PRIMARY KEY  (`BoardingPassID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;


INSERT INTO `boarding_pass`(`BoardingPassID`, `PassengerID`, `FlightID`, `SeatID`, `BoardingNumber`, `PassengerName`, `Seat`, `Barcode`, `BoardingTime` , `SequenceNumber`) Values
(1, 1, 1, 1, '64594','Sam', '23A', '89745132', '22:00','12345'),
(2, 2, 2, 2, '6452304','Mark ', '23B', '8974512', '06:00','12346'),
(3, 3, 3, 3, '679894','Mary', '12A', '8894512', '08:00','12347'),
(4, 4, 4, 4, '987452','Sean', '7D', '132461', '09:00','12348'),
(5, 5, 5, 5, '978464','Lauren ', '9A', '85632', '07:30','12349'),
(6, 6, 6, 6, '561251','Lucy ', '23A', '745132', '22:00','12350'),
(7, 7, 7, 7, '563056','Matt ', '14B', '89512', '06:00','12351'),
(8, 8, 8, 8, '746513','Kurt', '19A', '865512', '08:00','12352'),
(9, 9, 9, 9, '987585','Colin', '20D', '184361', '09:00','12353'),
(10, 10, 10, 10, '945145','Walt ', '1A', '54849', '07:30','12354');

-- INSERT INTO boarding_pass(BoardingPass) VALUES ('XYZ'); 

-- UPDATE boarding_pass SET BoardingPass = CONCAT(BoardingCode, BoardingNumber);

CREATE TABLE IF NOT EXISTS `checkin` (
  `CheckInID` INTEGER AUTO_INCREMENT,
  `BoardingPassID` INTEGER,
  `PassengerID` INTEGER,
  `StatusCheck` BOOLEAN default '0',
  PRIMARY KEY  (`CheckInID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `checkin` (`CheckInID`, `BoardingPassID`, `PassengerID`, `StatusCheck`) VALUES 
(1, 1, 1, 1), 
(2, 2, 2, 0), 
(3, 3, 3, 1), 
(4, 4, 4, 0), 
(5, 5, 5, 1), 
(6, 6, 6, 0), 
(7, 7, 7, 0), 
(8, 8, 8, 1), 
(9, 9, 9, 0), 
(10, 10, 10, 0);

CREATE TABLE IF NOT EXISTS `flight` (
  `FlightID` INTEGER AUTO_INCREMENT,
  `AirportID` INTEGER,
  `PlaneID` INTEGER NOT NULL,
  `FlightPrice` DECIMAL(6, 2) NOT NULL,
  `DepartureTime` DATETIME NOT NULL,
  `DepartureDestination` VARCHAR(255) NOT NULL,
  `ArrivalDestination` VARCHAR(255) NOT NULL,
  `ArrivalTime` DATETIME NOT NULL,
  `ExpectedJourneyTime` TIME,
  `NumberOfPassengers` INTEGER(100) NOT NULL,
  `AvalibleSeats` INTEGER(100) NOT NULL,
  PRIMARY KEY  (`FlightID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `flight` (`FlightID`, `AirportID`, `PlaneID`, `FlightPrice`, `DepartureTime`, `DepartureDestination`, `ArrivalDestination`,  `ArrivalTime`, `ExpectedJourneyTime`, `NumberOfPassengers`, `AvalibleSeats`) VALUES 
(1, 1, 1, 23.21, '2016-12-22 21:00:00', 'France', 'London', '2016-12-22 23:00:00', 2, 66, 34),  
(2, 2, 2, 23.21, '2016-12-22 22:20:00', 'France', 'Paris', '2016-12-22 23:20:00', 1, 34, 66),
(3, 3, 3, 23.21, '2016-12-22 23:00:00', 'Dublin', 'Spain', '2016-12-22 02:00:00', 3, 100, 0),
(4, 4, 4, 23.21, '2016-12-23 05:20:00', 'Belfast', 'London', '2016-12-22 07:20:00', 2, 78, 22), 
(5, 5, 5, 23.21, '2016-12-23 07:40:00', 'France', 'Liverpool', '2016-12-22 10:40:00', 3, 68, 32), 
(6, 6, 6, 23.21, '2016-12-23 09:00:00', 'Dublin', 'London', '2016-12-22 11:00:00', 2, 78, 22), 
(7, 7, 7, 23.21, '2016-12-23 12:30:00', 'France', 'Belfast', '2016-12-22 15:30:00', 3, 88, 12), 
(8, 8, 8, 23.21, '2016-12-23 13:00:00', 'Belfast', 'London', '2016-12-22  14:00:00', 1, 97, 3), 
(9, 9, 9, 23.21, '2016-12-23 15:00:00', 'Liverpool', 'London', '2016-12-22 16:00:00', 1, 78, 22), 
(11, 10, 10, 23.21, '2016-12-23 16:00:00', 'Newcastle', 'London', '2016-12-22 15:00:00', 1, 80, 20), 
(12, 10, 10, 23.21, '2016-12-23 16:00:00', 'Glasgow', 'London', '2016-12-22 15:00:00', 1, 80, 20); 

CREATE TABLE IF NOT EXISTS `promo_code` (
  `PromoCodeID` INTEGER AUTO_INCREMENT,
  `PaymentID` INTEGER,
  `PromoCode` VARCHAR(255) NOT NULL,
  `ValidFrom` DATE,
  `ValidTo` DATE,
  `Description` VARCHAR(255) NOT NULL,
  `PromoValue` INTEGER(5) NOT NULL,
  `ValidCheck` BOOLEAN NOT NULL default '1',
  PRIMARY KEY  (`PromoCodeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `promo_code`(`PromoCodeID`, `PaymentID`, `PromoCode`, `ValidFrom`, `ValidTo`, `Description`, `PromoValue`, `ValidCheck`) VALUES
(1, 1, 'Summer1234', '2017-06-01', '2017-09-01', 'Summer Promo', 10, 0),
(2, 2, 'Winter5678', '2016-10-31', '2016-12-29', 'Winter Promo', 10, 1),
(3, 3, 'Spring9101', '2017-02-25', '2017-05-16', 'Spring Promo', 10, 0),
(4, 4, 'Autumn1121', '2017-08-01', '2017-09-30', 'Autumn Promo', 10, 0),
(5, 5, 'STU9291', '2017-06-05', '2017-09-05', 'Student Promo', 10, 0),
(6, 6, 'GER8234', '2017-06-05', '2017-09-05', 'Germany Promo', 10, 0),
(7, 7, 'SWE3264', '2017-06-05', '2017-09-05', 'Sweden Promo', 10, 0),
(8, 8, 'GBR7391', '2017-06-05', '2017-09-05', 'Great Britain Promo', 10, 0),
(9, 9, 'SPA1066', '2017-07-01', '2017-08-01', 'Spain Promo', 10, 0),
(10, 10, 'NED9213', '2017-11-01', '2017-12-01', 'Netherlands Promo', 10, 0);

CREATE TABLE IF NOT EXISTS `seats` (
  `SeatID` INTEGER,
  `PlaneID` INTEGER NOT NULL,
  `SeatType` VARCHAR(255) NOT NULL,
  `Row` VARCHAR(255) NOT NULL,
  `SeatPrice` DECIMAL(4, 2) NOT NULL,
  `Reserved` VARCHAR(255) NOT NULL,
  PRIMARY KEY  (`SeatID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `seats` (`SeatID`, `PlaneID`, `SeatType`, `Row`, `SeatPrice`, `Reserved`) VALUES
(1, 1, 'A', '5', '45.00', 'YES'),
(2, 2, 'F', '6', '45.00', 'NO'),
(3, 3, 'D', '7', '45.00', 'YES'),
(4, 4, 'E', '8', '45.00', 'YES'),
(5, 5, 'B', '9', '45.00', 'YES'),
(6, 6, 'C', '10', '45.00', 'NO'),
(7, 7, 'A', '11', '45.00', 'NO'),
(8, 8, 'E', '12', '45.00', 'NO'),
(9, 9, 'B', '13', '45.00', 'NO'),
(10, 10, 'F', '14', '45.00', 'YES');

CREATE TABLE IF NOT EXISTS `travel_class` (
  `TravelClassID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `Class` VARCHAR(20),
  PRIMARY KEY  (`TravelClassID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `travel_class`(`TravelClassID`, `PassengerID`, `Class`) VALUES
(1, 1, 'First Class'),
(2, 2, 'Economy Class'),
(3, 3, 'First Class'),
(4, 4, 'Economy Class'),
(5, 5, 'Business Class'),
(6, 6, 'Business Class'),
(7, 7, 'Economy Class'),
(8, 8, 'Economy Class'),
(9, 9, 'First Class'),
(10, 10, 'Economy Class');

CREATE TABLE IF NOT EXISTS `luggage` (
  `LuggageID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `LuggageType` VARCHAR(50),
  `LuggagePrice` DECIMAL(3, 2),
  `LuggageWeight` INTEGER(10),
  PRIMARY KEY  (`LuggageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `luggage`(`LuggageID`, `PassengerID`, `LuggageType`, `LuggagePrice`, `LuggageWeight`) VALUES
(1, 1, 'Hold', 12.30, 9),
(2, 2, 'Pet', 12.30, 9),
(3, 3, 'Hold', 12.30, 9),
(4, 4, 'Pet', 12.30, 9),
(5, 5, 'Buggy', 12.30, 9),
(6, 6, 'Guitar', 12.30, 9),
(7, 7, 'Sports Equipment', 12.30, 9),
(8, 8, 'Pet', 12.30, 9),
(9, 9, 'Sports Equipment', 12.30, 9),
(10, 10, 'Hold', 12.30, 9);

CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` INTEGER AUTO_INCREMENT,
  `CardID` INTEGER,
  `PromoCodeID` INTEGER NOT NULL,
  `TotalDue` DECIMAL(12, 2) NOT NULL,
  `DateOfPayment` DATE, -- confirmed state change to true will set current timestamp update.
  `Confirmed` BOOLEAN NOT NULL default '0',
  PRIMARY KEY (`PaymentID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `payment` (`PaymentID`, `CardID`, `PromoCodeID`, `TotalDue`, `DateOfPayment`, `Confirmed`) VALUES 
(1, 1, 1, '100.76', '2013-11-06 23:10:54', 1),
(2, 2, 2, '120.21', '2014-07-21 23:10:54', 1),
(3, 3, 3, '200.67', '2015-11-14 13:10:54', 1),
(4, 4, 4, '231.76','2016-12-28 14:10:54', 1),
(5, 5, 5, '454.67','2013-05-22 17:10:54', 1),
(6, 6, 6, '766.76', NULL, 0),
(7, 7, 7, '33.76','2010-11-03 18:10:54',  1),
(8, 8, 8, '32.00','2009-02-02 19:10:54',  1),
(9, 9, 9, '121.76', '2013-11-06 22:10:54', 1),
(10, 10, 10, '100.45', NULL , 0);

CREATE TABLE IF NOT EXISTS `card_details` (
  `CardID` INTEGER AUTO_INCREMENT,
  `AccountDetailsID` INTEGER,
  `CardNumber` INTEGER(16) NOT NULL,
  `NameOnCard` VARCHAR(255) NOT NULL,
  `BillingAddress` VARCHAR(255) NOT NULL,
  `CvvNumber` INTEGER(3) NOT NULL,
  `ExpiryDate` DATE NOT NULL,
  `ValidFrom` DATE,
  `TypeOfCard` VARCHAR(20) NOT NULL,
  `IssueNumber` INTEGER(10),
  `AdditionalCardCharge` BOOLEAN default '0', --  when card type of credit card is selected, boolen will switch to '1' becoming true, and apply a 4% charge
  PRIMARY KEY (`CardID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `card_details` (`CardID`, `AccountDetailsID`, `CardNumber`, `NameOnCard`, `BillingAddress`, `CvvNumber`, `ExpiryDate`, `ValidFrom`, `TypeOfCard`, `IssueNumber`, `AdditionalCardCharge`) VALUES
(1, 1, 184695632833474, 'MR BLOGGS', '1 cromwell road', 001, '2018-01-01', '2014-01-01', 'Visa Debit', NULL, 0),
(2, 2, 126403928429462, 'MR DEE', '2 real road', 002, '2018-01-01', '2014-05-03', 'Mastercard Debit', NULL, 0),
(3, 3, 790422834392439, 'MRS KAY', '12 rattlin road', 003, '2018-01-01', '2014-05-06', 'Visa Credit', NULL, 1),
(4, 4, 448292223495754, 'MR STEVENS', '15 cromwell road', 004, '2018-01-01', '2014-07-25', 'Mastercard Debit', NULL, 0),
(5, 5, 958489283732113, 'MRS MCKAY', '17 magdella street', 005, '2018-01-01', '1990-01-13', 'Maestro Credit', 5000000005, 1),
(6, 6, 664009912484825, 'MR KELLY', '1 lisburn road', 006, '2018-01-01', '1959-01-03', 'Visa Credit', NULL, 1),
(7, 7, 273933351725209, 'MRS DOUBTFIRE', '2640 Steiner Street', 007, '2018-01-01', '1975-06-08', 'Maestro Credit', 6000000007, 1),
(8, 8, 377943710418210, 'MR MCLAUGHLIN', '16 cresswell road', 008, '2018-01-01', '14-01-01', 'Visa Debit', NULL, 0),
(9, 9, 374198218778793, 'MRS BLOGGS', '12 crossway road', 009, '2018-01-01', '14-01-01', 'Mastercard Debit', NULL, 0),
(10, 10, 3627111234438602, 'MRS DOHERTY', '15 lisburn road', 010, '2018-01-01', '14-01-01', 'Maestro Credit', 8000000010, 1);
 

CREATE TABLE IF NOT EXISTS `account_details` (
  `AccountDetailsID` INTEGER AUTO_INCREMENT,
  `AccountID` INTEGER,
  `UserName` VARCHAR(32) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Address` VARCHAR(200) NOT NULL,
  `Telephone` INTEGER(20) NOT NULL,
  PRIMARY KEY  (`AccountDetailsID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `account_details` (`AccountDetailsID`, `AccountID`, `UserName`, `Email`, `Address`, `Telephone`) VALUES
(1, 1, 'abc123', 'abcdef@hotmail.com', '123 fake street', 07712345678),
(2, 2, 'steven1', 'steven1@hotmail.com', '14 killala street', 07712345687),
(3, 3, 'george32', 'george32@hotmail.com', '27 crooks avenue', 07712345654),
(4, 4, 'karen12', 'karen12@hotmail.com', '19 strangford park', 07712321236),
(5, 5, 'ciara23', 'ciara23@hotmail.com', '17 short street', 07713546789),
(6, 6, 'kevin124', 'kevin124@hotmail.com', '68 pump street', 07714655678),
(7, 7, 'beth34', 'beth34@hotmail.com', '74 high street', 07865345678),
(8, 8, 'michael77', 'michael77@hotmail.com', '98 wollesly street', 07718467678),
(9, 9, 'Niall56', 'niall56@hotmail.com', '56 lamp street', 07562345678),
(10, 10, 'laura', 'laura43@hotmail.com', '29 comb street', 07712345678);

CREATE TABLE IF NOT EXISTS `account` (
  `AccountID` INTEGER AUTO_INCREMENT,
  `Password` VARCHAR(64) NOT NULL,
  `Username` VARCHAR(20) NOT NULL,
  PRIMARY KEY  (`AccountID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `account` (`AccountID`, `Password`, `Username`) VALUES 
(1, 'password1', 'Dmaw912'), 
(2, 'password2', 'Joh316'),
(3, 'password3', 'Laee12'), 
(4, 'password4', 'Pat101'), 
(5, 'password5', 'Musstaro'), 
(6, 'password6', 'Bobbyb'), 
(7, 'password7', 'Sam12'), 
(8, 'password8', 'Martina1989'), 
(9, 'password9', 'Jackthelad2'), 
(10, 'password10', 'FlyingHigh65'); 

CREATE TABLE IF NOT EXISTS `booking` (
  `BookingID` INTEGER AUTO_INCREMENT,
  `AccountID` INTEGER NOT NULL,
  `FlightID` INTEGER NOT NULL,
  `PassengerID` INTEGER NOT NULL,
  `ReasonForTravel` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`BookingID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `booking` (`BookingID`, `AccountID`, `FlightID`, `PassengerID`, `ReasonForTravel`) VALUES 
(1, 1, 1, 1, 'business'), 
(2, 2, 2, 2, 'leisure'),
(3, 3, 3, 3, 'business'), 
(4, 4, 4, 4, 'leisure'), 
(5, 5, 5, 5, 'leisure'), 
(6, 6, 6, 6, 'leisure'),
(7, 7, 7, 7, 'leisure'),
(8, 8, 8, 8, 'leisure'),
(9, 9, 9, 9, 'business'),
(10, 10, 10, 10, 'leisure'); 

CREATE TABLE IF NOT EXISTS `booking_status` (
  `BookingStatusID` INTEGER NOT NULL AUTO_INCREMENT,
  `BookingID` INTEGER,
  `PaymentID` INTEGER,
  `Status` enum('ACTIVE','TEMP', 'DISABLED') NOT NULL DEFAULT 'TEMP',
  PRIMARY KEY (`BookingStatusID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `booking_status` (`BookingStatusID`, `BookingID`, `PaymentID`, `Status`) VALUES
(1, 1, 1, 'ACTIVE'),
(2, 2, 2, 'ACTIVE'),
(3, 3, 3, 'ACTIVE'),
(4, 4, 4, 'TEMP'),
(5, 5, 5, 'ACTIVE'),
(6, 6, 6, 'ACTIVE'),
(7, 7, 7, 'ACTIVE'),
(8, 8, 8, 'DISABLED'),
(9, 9, 9, 'TEMP'),
(10, 10, 10, 'DISABLED');

CREATE TABLE IF NOT EXISTS `passenger` (
  `PassengerID` INTEGER NOT NULL AUTO_INCREMENT,
  `BookingID` INTEGER NOT NULL,
  `PassengerType` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`PassengerID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `passenger` (`PassengerID`, `BookingID`, `PassengerType`) VALUES 
(1, 1, 'Child' ),
(2, 2, 'Infant' ),
(3, 3, 'Adult' ),
(4, 4, 'Senior' ),
(5, 5, 'Special Circumstances' ),
(6, 6, 'Child' ),
(7, 7, 'Infant' ),
(8, 8, 'Senior' ),
(9, 9, 'Child' ),
(10, 10, 'Adult' );

-- END