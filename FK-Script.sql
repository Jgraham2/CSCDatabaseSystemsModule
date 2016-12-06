

/*******************************************************************************
   FOREIGN KEY CREATE
********************************************************************************/

	
SET FOREIGN_KEY_CHECKS=0;

-- passenger_details
  
ALTER TABLE `passenger_details` ADD INDEX `PassengerID_idx` (`PassengerID` ASC);
ALTER TABLE `passenger_details` ADD CONSTRAINT `fk_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- aeroplane

-- boarding_pass

ALTER TABLE `boarding_pass` ADD INDEX `PassengerID_idx2` (`PassengerID` ASC);
ALTER TABLE `boarding_pass` ADD CONSTRAINT `fk2_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `boarding_pass` ADD INDEX `FlightID_idx` (`FlightID` ASC);
ALTER TABLE `boarding_pass` ADD CONSTRAINT `fk_FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flight`(`FlightID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `boarding_pass` ADD INDEX `SeatID_idx` (`SeatID` ASC);
ALTER TABLE `boarding_pass` ADD CONSTRAINT `fk_SeatID` FOREIGN KEY (`SeatID`) REFERENCES `seats`(`SeatID`) ON DELETE CASCADE ON UPDATE CASCADE;


-- checkin

ALTER TABLE `checkin` ADD INDEX `BoardingPassID_idx2` (`BoardingPassID` ASC);
ALTER TABLE `checkin` ADD CONSTRAINT `fk2_BoardingPassID` FOREIGN KEY (`BoardingPassID`) REFERENCES `boarding_pass` (`BoardingPassID`) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `checkin` ADD INDEX `PassengerID_idx3` (`PassengerID` ASC);
ALTER TABLE `checkin` ADD CONSTRAINT `fk3_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- flight
  
ALTER TABLE `flight` ADD INDEX `AirportID_idx` (`AirportID` ASC);
ALTER TABLE `flight` ADD CONSTRAINT `fk_AirportID` FOREIGN KEY (`AirportId`) REFERENCES `airport` (`AirportID`) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `flight` ADD INDEX `PlaneID_idx` (`PlaneID` ASC);
ALTER TABLE `flight` ADD CONSTRAINT `fk_PlaneID` FOREIGN KEY (`PlaneID`) REFERENCES `aeroplane` (`PlaneID`) ON DELETE CASCADE ON UPDATE CASCADE; 

-- promo_code 
  
ALTER TABLE `promo_code` ADD INDEX `PaymentID_idx` (`PaymentID` ASC);
ALTER TABLE `promo_code` ADD CONSTRAINT `fk_PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- seat
  
ALTER TABLE `seats` ADD INDEX `PlaneID_idx2` (`PlaneID` ASC);
ALTER TABLE `seats` ADD CONSTRAINT `fk2_PlaneID` FOREIGN KEY (`PlaneID`) REFERENCES `aeroplane` (`PlaneID`) ON DELETE CASCADE ON UPDATE CASCADE;
  
-- travel_class 

ALTER TABLE `travel_class` ADD INDEX `PassengerID_idx4` (`PassengerID` ASC);
ALTER TABLE `travel_class` ADD CONSTRAINT `fk4_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`)  ON DELETE CASCADE ON UPDATE CASCADE;

-- luggage 

ALTER TABLE `luggage` ADD INDEX `PassengerID_idx5` (`PassengerID` ASC);
ALTER TABLE `luggage` ADD CONSTRAINT `fk5_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- payment

ALTER TABLE `payment` ADD INDEX `CardID_idx` (`CardID` ASC);
ALTER TABLE `payment` ADD CONSTRAINT `fk_CardID` FOREIGN KEY (`CardID`) REFERENCES `card_details`(`CardID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `payment` ADD INDEX `PromoCodeID_idx` (`PromocodeID` ASC);
ALTER TABLE `payment` ADD CONSTRAINT `fk_PromocodeID` FOREIGN KEY (`PromocodeID`) REFERENCES `promo_code`(`PromocodeID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- card_details

ALTER TABLE `card_details` ADD INDEX `AccountDetailsID_idx` (`AccountDetailsID` ASC);
ALTER TABLE `card_details` ADD CONSTRAINT `fk_AccountDetailsID` FOREIGN KEY (`AccountDetailsID`) REFERENCES `account_details`(`AccountDetailsID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- account_details

ALTER TABLE `account_details` ADD INDEX `AccountID_idx` (`AccountID` ASC);
ALTER TABLE `account_details` ADD CONSTRAINT `fk_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account`(`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- account


-- booking 
  
ALTER TABLE `booking` ADD INDEX `AccountID_idx2` (`AccountID` ASC);
ALTER TABLE `booking` ADD CONSTRAINT `fk2_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE;
   
ALTER TABLE `booking` ADD INDEX `FlightID_idx4` (`FlightID` ASC);
ALTER TABLE `booking` ADD CONSTRAINT `fk4_FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`) ON DELETE CASCADE ON UPDATE CASCADE;
   
ALTER TABLE `booking` ADD INDEX `PassengerID_idx7` (`PassengerID` ASC); 
ALTER TABLE `booking` ADD CONSTRAINT `fk7_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- booking_status 
  
ALTER TABLE `booking_status` ADD INDEX `BookingID_idx4` (`BookingID` ASC);
ALTER TABLE `booking_status` ADD CONSTRAINT `fk4_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `booking`(`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `booking_status` ADD INDEX `PaymentID_idx4` (`PaymentID` ASC);
ALTER TABLE `booking_status` ADD CONSTRAINT `fk4_PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `payment`(`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE;
 
-- passenger 
  
ALTER TABLE `passenger` ADD INDEX `BookingID_idx5` (`BookingID` ASC);
ALTER TABLE `passenger` ADD CONSTRAINT `fk5_BookingID` FOREIGN KEY (`BookingID`) REFERENCES `booking`(`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE;
   
SET FOREIGN_KEY_CHECKS=1;
