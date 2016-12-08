USE airline_booking;

-- Table Check

DROP TABLE IF EXISTS `passenger`;
DROP TABLE IF EXISTS `passenger_details`; 
DROP TABLE IF EXISTS `aeroplane`; 
DROP TABLE IF EXISTS `airport`; 
DROP TABLE IF EXISTS `boarding_pass`; 
DROP TABLE IF EXISTS `checkin`; 
DROP TABLE IF EXISTS `flight`;
DROP TABLE IF EXISTS `flight_times`;
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


/*******************************************************************************
   Create Tables And Insert Data 
********************************************************************************/

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `airline_booking`
--

-- --------------------------------------------------------

-- BEGIN

CREATE TABLE IF NOT EXISTS `passenger` (
  `PassengerID` INTEGER NOT NULL AUTO_INCREMENT,
  `BookingID` INTEGER,
  `Forename` VARCHAR(50) NOT NULL,
  `Surname` VARCHAR(50) NOT NULL,
  `Title` VARCHAR(20),
  `PassengerType` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`PassengerID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `passenger` (`PassengerID`, `BookingID`, `Forename`, `Surname`, `Title`, `PassengerType`) VALUES 
(1, 1,'Sam', 'McKay', 'Mr','Standard'),
(2, 1, 'Peter', 'McKay', 'Mr', 'Standard'),
(3, 1, 'Ann', 'McKay', 'Mrs', 'Standard' ),
(4, 2, 'Linda', 'Adams', 'Mrs', 'Standard'),
(5, 2, 'Richard', 'Adams', 'Mr', 'Standard' ),
(6, 3, 'Sean', 'Peters', 'Mr', 'Special Circumstances' ),
(7, 4, 'Samantha', 'Duncan', 'Mrs', 'Special Circumstances' ),
(8, 5, 'Nadine', 'Grey', 'Miss', 'Child' ),
(9, 5, 'Amanda', 'Grey', 'Mr', 'Standard' ),
(10, 5, 'Paul', 'Grey', 'Mrs','Special Circumstances' );

CREATE TABLE IF NOT EXISTS `passenger_details` (
  `PassengerDetailsID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `Birthdate` DATE NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Town` VARCHAR(50),
  `City` VARCHAR(50) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  `Postcode` VARCHAR(20) NOT NULL,
  `Telephone` VARCHAR(20),
  `MobileNumber` VARCHAR(20) NOT NULL,
  PRIMARY KEY  (`PassengerDetailsID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `passenger_details` (`PassengerDetailsID`, `PassengerID`, `Birthdate`, `Address`, `Town`, `City` , `Country` , 
`Postcode` , `Telephone` , `MobileNumber`) VALUES
(1, 1, '1991-05-07', '13 hill Lane', 'Lisburn North', 'Lisburn', 'County Down', 'BT20 1OW', '028249268741', '07843666341'),
(2, 2, '1990-03-07', '12 Forthill Lane', 'Bangor West', 'Bangor', 'County Down', 'BT19 1NW', '02824832234', '07743223413'),
(3, 3, '1992-06-21', '24 Manor Rd ', 'Esher', 'London', 'London', 'kt10 0ql ', '02824832234', '07743223413'),
(4, 4, '1951-04-07', '22 Powburn Cres', 'York', 'Yorkshire', 'York', 'BT12 9NW', '02824832234', '0774322341'),
(5, 5, '1967-11-10', '3 Baron Glade', 'South West', 'Cornwell', 'Cornwell', 'BT20 9ZX', '02824832234', '074652341'),
(6, 6, '1982-01-12', '42 Woodcroft Cres', 'Trillick', 'Omagh', 'Tyrone', 'BT30 1OP', '02824832234', '0774387141'),
(7, 7, '2001-10-02', 'Birch Cross', 'Newtown', 'Londonderry/derry', 'County Derry', 'BT1 0NW', '02898832234', '0774322341'),
(8, 8, '2008-12-25', '25 Capability Way', 'Liverpool', 'Merseyside', 'Liverpool', 'BT78 5HL', '02824838534', '0774322341'),
(9, 9, '1944-11-18', '4 Elmfield Cl', 'Bangor South', 'Bangor', 'County Down', 'BT94 1NW', '028254623134', '0774322341'),
(10, 10, '1976-05-03', '1 David St', 'Bristol', 'Bristol', 'County Down', 'BT45 1KW', '028256152234', '0788322341');

CREATE TABLE IF NOT EXISTS `aeroplane` (
  `PlaneID` INTEGER AUTO_INCREMENT,
  `ModelNumber` INTEGER(5) NOT NULL,
  `ModelName` VARCHAR(5) NOT NULL,
  `PlaneCode` VARCHAR(20) NOT NULL,
  `SeatAmount` INTEGER(100) NOT NULL,
  `SeatPlan` VARCHAR(255) NOT NULL,
  PRIMARY KEY  (`PlaneID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17;

INSERT INTO `aeroplane` (`PlaneID`, `ModelNumber`, `ModelName`, `PlaneCode`, `SeatAmount`, `SeatPlan`) VALUES
(1, 350, 'Airbus', 'EZYAIR350', 100, '1A'),
(2, 380, 'Airbus', 'EZYAIR380', 120, '2A'),
(3, 747, 'Boeing', 'EZYBOE747', 240, '3B'),
(4, 757, 'Boeing', 'EZYBOE757', 270, '4B'),
(5, 787, 'Boeing', 'EZYBOE787', 290, '5B'),
(6, 705, 'Bombardier', 'EZYBOM705', 220, '6B'),
(7, 900, 'Bombardier', 'EZYBOM900', 240, '7B'),
(8, 707, 'Douglas', 'EZYDOU10', 300, '8D'),
(9, 228, 'Dornier', 'EZYDOR288', 280, '9D'),
(10, 328, 'Dornier', 'EZYDOR328', 150, '10D'),
(11, 170, 'Embraer', 'EZYEMB170', 200, '11E'),
(12, 195, 'Embraer', 'EZYEMB190', 180, '12E'),
(13, 70, 'Embraer', 'EZYEMB195', 100, '13E'),
(14, 100, 'Fokker', 'EZYFOK70', 140, '14F'),
(15, 10, 'Fokker', 'EZYFOK10', 50, '15F'),
(16, 12, 'Pilatus', 'EZYPIL12', 80, '16P');


CREATE TABLE IF NOT EXISTS `airport` (
  `AirportID` INTEGER AUTO_INCREMENT,
  `AirportCode` VARCHAR(10),
  `AirportName` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  PRIMARY KEY  (`AirportID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13;

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
(10, 'LGW', 'London Gatwick', 'England'),
(11, 'CDG', 'Paris Charles de Gaulle', 'France'),
(12, 'BCN', 'Barcelona Airport', 'Spain');


CREATE TABLE IF NOT EXISTS `boarding_pass` (
  `BoardingPassID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `FlightID` INTEGER,
  `SeatID` INTEGER,
  `PassengerName` VARCHAR(255) NOT NULL,
  `Seat` VARCHAR(255) NOT NULL,
  `BoardingPass` VARCHAR (10) default 'XYZ101', 
  `Barcode` INTEGER(20) DEFAULT 5432134,
  PRIMARY KEY  (`BoardingPassID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1261;


INSERT INTO `boarding_pass`(`BoardingPassID`, `PassengerID`, `FlightID`, `SeatID`) VALUES
(1251, 1, 1, 1),
(1252, 2, 2, 2),
(1253, 3, 3, 3),
(1254, 4, 4, 4),
(1255, 5, 5, 5),
(1256, 6, 6, 6),
(1257, 7, 7, 7),
(1258, 8, 8, 8),
(1259, 9, 9, 9),
(1260, 10, 10, 10);

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
  `PlaneID` INTEGER,
  `FlightPrice` DECIMAL(6, 2) NOT NULL,
  `DepartureDestination` VARCHAR(255) NOT NULL,
  `ArrivalDestination` VARCHAR(255) NOT NULL,
  `NumberOfPassengers` INTEGER(100) NOT NULL,
  PRIMARY KEY  (`FlightID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13;

INSERT INTO `flight` (`FlightID`, `AirportID`, `PlaneID`, `FlightPrice`, `DepartureDestination`, `ArrivalDestination`, `NumberOfPassengers`) VALUES 
(1, 10, 10, 44.99, 'France', 'London', 66),  
(2, 11, 11, 53.99, 'France', 'Paris', 139),
(3, 12, 12, 83.99, 'Dublin', 'Spain', 145),
(4, 10, 10, 22.99, 'Belfast', 'London', 78), 
(5, 6, 6, 21.99, 'France', 'Liverpool', 99), 
(6, 10, 10, 21.99, 'Dublin', 'London', 73), 
(7, 2, 2, 42.99, 'France', 'Belfast', 125), 
(8, 10, 10, 25.99, 'Belfast', 'London', 92), 
(9, 3, 3, 18.99, 'Liverpool', 'Glasgow', 78), 
(10, 10, 10, 19.99, 'Newcastle', 'London', 105), 
(11, 10, 10, 34.99, 'Belfast', 'London', 94),
(12, 10, 10, 50.99, 'Belfast', 'London', 82); 

CREATE TABLE IF NOT EXISTS `flight_times` (
  `FlightTimesID` INTEGER AUTO_INCREMENT,
  `FlightID` INTEGER,
  `DepartureTime` DATETIME NOT NULL,
  `ArrivalTime` DATETIME NOT NULL,
  `ExpectedJourneyTime` TIME,
  PRIMARY KEY  (`FlightTimesID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15;

INSERT INTO `flight_times` (`FlightTimesID`, `FlightID`, `DepartureTime`, `ArrivalTime`, `ExpectedJourneyTime`) VALUES 
(1, 1, '2016-12-22 21:00:00', '2016-12-22 23:00:00', '2:00'),  
(2, 2, '2016-12-22 22:20:00', '2016-12-22 23:20:00', '1:00'),
(3, 3, '2016-12-22 23:00:00', '2016-12-22 02:00:00', '3:00'),
(4, 4, '2016-12-23 05:20:00', '2016-12-23 07:20:00', '2:00'), 
(5, 5, '2016-12-23 07:40:00', '2016-12-23 10:40:00', '3:00'), 
(6, 6, '2016-12-23 09:00:00', '2016-12-23 11:00:00', '2:00'), 
(7, 7, '2016-12-23 12:30:00', '2016-12-23 15:30:00', '3:00'), 
(8, 8, '2016-12-23 13:00:00', '2016-12-23 14:00:00', '1:00'), 
(9, 9, '2016-12-23 15:00:00', '2016-12-23 16:00:00', '1:00'), 
(10, 10, '2016-12-23 16:00:00', '2016-12-23 15:00:00', '1:00'), 
(11, 11, '2016-12-23 17:00:00', '2016-12-23 18:00:00', '1:00'),
(12, 12, '2016-12-23 19:00:00', '2016-12-23 20:00:00', '1:00'),
(13, 13, '2016-12-23 22:30:00', '2016-12-23 23:30:00', '1:00'); 

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
(1, 1, 'Summer1234', '2017-06-01', '2017-09-01', 'Summer Promo', 10, '0'),
(2, 2, 'Winter5678', '2016-10-31', '2016-12-29', 'Winter Promo', 20, '1'),
(3, 3, 'Spring9101', '2017-02-25', '2017-05-16', 'Spring Promo', 15, '0'),
(4, 4, 'Autumn1121', '2017-08-01', '2017-09-30', 'Autumn Promo', 25, '0'),
(5, 5, 'STU9291', '2017-06-05', '2017-09-05', 'Student Promo', 10, '0'),
(6, 6, 'GER8234', '2017-06-05', '2017-09-05', 'Germany Promo', 10, '0'),
(7, 7, 'SWE3264', '2017-06-05', '2017-09-05', 'Sweden Promo', 15, '0'),
(8, 8, 'GBR7391', '2017-06-05', '2017-09-05', 'Great Britain Promo', 20, '0'),
(9, 9, 'SPA1066', '2017-07-01', '2017-08-01', 'Spain Promo', 10, '0'),
(10, 10, 'NED9213', '2017-11-01', '2017-12-01', 'Netherlands Promo', 5, '0');

CREATE TABLE IF NOT EXISTS `seats` (
  `SeatID` INTEGER AUTO_INCREMENT,
  `PlaneID` INTEGER,
  `PassengerID` INTEGER,
  `Seat` VARCHAR(255) NOT NULL,
  `Row` VARCHAR(255) NOT NULL,
  `SeatPrice` DECIMAL(4, 2) default '19.99',
  `Reserved` VARCHAR(255) NOT NULL,
  PRIMARY KEY  (`SeatID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `seats` (`SeatID`, `PlaneID`, `PassengerID`, `Seat`, `Row`, `SeatPrice`, `Reserved`) VALUES
(1, 1, 1, 'A', '1', '19.99', 'YES'),
(2, 1, 2, 'A', '2', '19.99', 'YES'),
(3, 1, 3, 'A', '3', '19.99', 'YES'),
(4, 2, 4, 'E', '3', '19.99', 'YES'),
(5, 2, 5, 'E', '4', '19.99', 'YES'),
(6, 8, 6, 'C', '6', '19.99', 'NO'),
(7, 5, 7, 'J', '4', '19.99', 'NO'),
(8, 2, 8, 'G', '4', '19.99', 'YES'),
(9, 3, 9, 'G', '5', '19.99', 'YES'),
(10, 2, 10, 'G', '6', '19.99', 'YES');

CREATE TABLE IF NOT EXISTS `travel_class` (
  `TravelClassID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `Class` VARCHAR(20),
  `Value` INTEGER(5),
  PRIMARY KEY  (`TravelClassID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `travel_class`(`TravelClassID`, `PassengerID`, `Class`, `Value`) VALUES
(1, 1, 'Economy Class', NULL),
(2, 2, 'Economy Class', NULL),
(3, 3, 'Economy Class', NULL),
(4, 4, 'First Class', 20),
(5, 5, 'First Class', 20),
(6, 6, 'Business Class', 10),
(7, 7, 'Business Class', 10),
(8, 8, 'Economy Class', NULL),
(9, 9, 'Economy Class', NULL),
(10, 10, 'Economy Class', NULL);

CREATE TABLE IF NOT EXISTS `luggage` (
  `LuggageID` INTEGER AUTO_INCREMENT,
  `PassengerID` INTEGER,
  `LuggageType` VARCHAR(50),
  `LuggagePrice` DECIMAL(3, 2),
  PRIMARY KEY  (`LuggageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11;

INSERT INTO `luggage`(`LuggageID`, `PassengerID`, `LuggageType`, `LuggagePrice`) VALUES
(1, 1, 'Hold', 9.99),
(2, 2, 'Hold', 9.99),
(3, 3, 'Buggy', NULL),
(4, 4, 'Hold', 9.99),
(5, 5,  NULL, NULL),
(6, 6, NULL, NULL),
(7, 7, 'Sports Equipment', 6.99),
(8, 8, 'Pet', 32.99),
(9, 9, 'Hold', 9.99),
(10, 10, 'Hold', 9.99);

CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` INTEGER AUTO_INCREMENT,
  `CardID` INTEGER,
  `PromoCodeID` INTEGER,
  `TotalDue` DECIMAL(12, 2) NOT NULL,
  `DateOfPayment` DATE, -- confirmed state change to true will set current timestamp update.
  `Confirmed` BOOLEAN NOT NULL default '0',
  PRIMARY KEY (`PaymentID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6;

INSERT INTO `payment` (`PaymentID`, `CardID`, `PromoCodeID`, `TotalDue`, `DateOfPayment`, `Confirmed`) VALUES 
(1, 1, 1, '50.96', '2013-11-06 23:10:54', 1),
(2, 2, 2, '83.89', '2014-07-21 23:10:54', 1),
(3, 3, 3, '64.97', '2015-11-14 13:10:54', 1),
(4, 4, 4, '29.96','2016-12-28 14:10:54', 1),
(5, 5, 5, '58.99','2013-05-22 17:10:54', 1);

CREATE TABLE IF NOT EXISTS `card_details` (
  `CardID` INTEGER AUTO_INCREMENT,
  `AccountDetailsID` INTEGER,
  `CardNumber` INTEGER(16) NOT NULL,
  `NameOnCard` VARCHAR(255) NOT NULL,
  `BillingAddress` VARCHAR(255) NOT NULL,
  `CvvNumber` VARCHAR(10) NOT NULL,
  `ExpiryDate` DATE NOT NULL,
  `ValidFrom` DATE,
  `TypeOfCard` VARCHAR(20) NOT NULL,
  `IssueNumber` INTEGER(10),
  `AdditionalCardCharge` BOOLEAN default '0', --  when card type of credit card is selected, boolen will switch to '1' becoming true, and apply a 4% charge
  PRIMARY KEY (`CardID`)
  ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6;

INSERT INTO `card_details` (`CardID`, `AccountDetailsID`, `CardNumber`, `NameOnCard`, `BillingAddress`, `CvvNumber`, `ExpiryDate`, `ValidFrom`, `TypeOfCard`, `IssueNumber`, `AdditionalCardCharge`) VALUES
(1, 1, '184695632833474', 'MR MCKAY', '1 cromwell road', '001', '2018-01-01', '2014-01-01', 'Visa Debit', NULL, 0),
(2, 2, '126403928429462', 'MR ADAMS', '2 real road', '002', '2018-01-01', '2014-05-03', 'Mastercard Debit', NULL, 0),
(3, 3, '790422834392439', 'MR PETERS', '12 rattlin road', '003', '2018-01-01', '2014-05-06', 'Visa Credit', NULL, 1),
(4, 4, '448292223495754', 'MRS DUNCAN', '15 cromwell road', '004', '2018-01-01', '2014-07-25', 'Mastercard Debit', NULL, 0),
(5, 5, '958489283732113', 'MR GREY', '17 magdella street', '005', '2018-01-01', '1990-01-13', 'Maestro Credit', '5000000005', 1);

CREATE TABLE IF NOT EXISTS `account_details` (
  `AccountDetailsID` INTEGER AUTO_INCREMENT,
  `AccountID` INTEGER,
  `Name` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Address` VARCHAR(200) NOT NULL,
  `Telephone` VARCHAR(20) NOT NULL,
  PRIMARY KEY  (`AccountDetailsID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6;

INSERT INTO `account_details` (`AccountDetailsID`, `AccountID`, `Name`, `Email`, `Address`, `Telephone`) VALUES
(1, 1, 'John McKay', 'jmckay@hotmail.com', '123 fake street', '07712345678'),
(2, 2, 'Richard Adams', 'RichAds@gmail.com', '14 killala street', '07712345687'),
(3, 3, 'Sean Peters', 's.peters82@hotmail.co.uk', '27 crooks avenue', '07712345654'),
(4, 4, 'Matthew Duncan', 'Matt_Duncan12@hotmail.com', '19 strangford park', '07712321236'),
(5, 5, 'Paul Grey', 'DontFeedMyInbox@gmail.com', '18 Elm Street', '07713546789');

CREATE TABLE IF NOT EXISTS `account` (
  `AccountID` INTEGER AUTO_INCREMENT,
  `Password` VARCHAR(64) NOT NULL,
  `Username` VARCHAR(20) NOT NULL,
  PRIMARY KEY  (`AccountID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6;

INSERT INTO `account` (`AccountID`, `Password`, `Username`) VALUES 
(1, SHA1('password1'), 'Dmaw912'), 
(2, SHA1('password2'), 'Joh316'),
(3, SHA1('password3'), 'Laee12'), 
(4, SHA1('password4'), 'Pat101'), 
(5, SHA1('password5'), 'Musstaro');

CREATE TABLE IF NOT EXISTS `booking` (
  `BookingID` INTEGER AUTO_INCREMENT,
  `AccountID` INTEGER,
  `FlightID` INTEGER,
  `ReasonForTravel` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`BookingID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6;

INSERT INTO `booking` (`BookingID`, `AccountID`, `FlightID`, `ReasonForTravel`) VALUES 
(1, 1, 5, 'leisure'), 
(2, 2, 3, 'leisure'),
(3, 3, 2, 'business'), 
(4, 4, 6, 'business'), 
(5, 5, 1, 'leisure'); 

CREATE TABLE IF NOT EXISTS `booking_status` (
  `BookingStatusID` INTEGER NOT NULL AUTO_INCREMENT,
  `BookingID` INTEGER,
  `PaymentID` INTEGER,
  `Status` enum('ACTIVE','TEMP', 'DISABLED') NOT NULL DEFAULT 'TEMP',
  PRIMARY KEY (`BookingStatusID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6;

INSERT INTO `booking_status` (`BookingStatusID`, `BookingID`, `PaymentID`, `Status`) VALUES
(1, 1, 1, 'ACTIVE'),
(2, 2, 2, 'ACTIVE'),
(3, 3, 3, 'ACTIVE'),
(4, 4, 4, 'TEMP'),
(5, 5, 5, 'ACTIVE');

UPDATE boarding_pass SET BoardingPass = CONCAT('PSGR', BoardingPassID);

UPDATE boarding_pass SET Barcode = FLOOR(rand() * 1000000000);

UPDATE boarding_pass
INNER JOIN passenger ON (boarding_pass.PassengerID=passenger.PassengerID)
SET boarding_pass.PassengerName=CONCAT(passenger.Forename,' ', passenger.Surname);

UPDATE boarding_pass
INNER JOIN seats ON (boarding_pass.PassengerID=seats.PassengerID)
SET boarding_pass.Seat=CONCAT(seats.Seat,' ',seats.Row);


-- END