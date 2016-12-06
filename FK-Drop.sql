/*******************************************************************************
   Use the code below to undo the foreign keys after creation. 
********************************************************************************/

ALTER TABLE `passenger_details` DROP FOREIGN KEY `fk_PassengerID`;
ALTER TABLE `passenger_details` DROP INDEX `PassengerID_idx`;

ALTER TABLE `boarding_pass` DROP FOREIGN KEY `fk2_PassengerID`;
ALTER TABLE `boarding_pass` DROP INDEX `PassengerID_idx2`;

ALTER TABLE `boarding_pass` DROP FOREIGN KEY `fk_FlightID`;
ALTER TABLE `boarding_pass` DROP INDEX `FlightID_idx`;

ALTER TABLE `boarding_pass` DROP FOREIGN KEY `fk_SeatID`;
ALTER TABLE `boarding_pass` DROP INDEX `SeatID_idx`;
 
ALTER TABLE `checkin` DROP FOREIGN KEY `fk2_BoardingPassID`;
ALTER TABLE `checkin` DROP INDEX `BoardingPassID_idx2`;

ALTER TABLE `checkin` DROP FOREIGN KEY `fk3_PassengerID`;
ALTER TABLE `checkin` DROP INDEX `PassengerID_idx3`;

ALTER TABLE `flight` DROP FOREIGN KEY `fk_AirportID`;
ALTER TABLE `flight` DROP INDEX `AirportID_idx`;

ALTER TABLE `flight` DROP FOREIGN KEY `fk_PlaneID`;
ALTER TABLE `flight` DROP INDEX `PlaneID_idx`;

ALTER TABLE `promo_code` DROP FOREIGN KEY `fk_PaymentID`;
ALTER TABLE `promo_code` DROP INDEX `PaymentID_idx`;

ALTER TABLE `seats` DROP FOREIGN KEY `fk2_PlaneID`;
ALTER TABLE `seats` DROP INDEX `PlaneID_idx2`;

ALTER TABLE `travel_class` DROP FOREIGN KEY `fk4_PassengerID`;
ALTER TABLE `travel_class` DROP INDEX `PassengerID_idx4`;

ALTER TABLE `luggage` DROP FOREIGN KEY `fk5_PassengerID`;
ALTER TABLE `luggage` DROP INDEX `PassengerID_idx5`;

ALTER TABLE `payment` DROP FOREIGN KEY `fk_CardID`;
ALTER TABLE `payment` DROP INDEX `CardID_idx`;

ALTER TABLE `payment` DROP FOREIGN KEY `fk_PromocodeID`;
ALTER TABLE `payment` DROP INDEX `PromoCodeID_idx`;

ALTER TABLE `card_details` DROP FOREIGN KEY `fk_AccountDetailsID`;
ALTER TABLE `card_details` DROP INDEX `AccountDetailsID_idx`;

ALTER TABLE `account_details` DROP FOREIGN KEY `fk_AccountID`;
ALTER TABLE `account_details` DROP INDEX `AccountID_idx` ;

ALTER TABLE `booking` DROP FOREIGN KEY `fk2_AccountID`;
ALTER TABLE `booking` DROP INDEX `AccountID_idx2`;

ALTER TABLE `booking` DROP FOREIGN KEY `fk4_FlightID`;
ALTER TABLE `booking` DROP INDEX `FlightID_idx4`;

ALTER TABLE `booking` DROP FOREIGN KEY `fk7_PassengerID`;
ALTER TABLE `booking` DROP INDEX `PassengerID_idx7`;

ALTER TABLE `booking_status` DROP FOREIGN KEY `fk4_BookingID`;
ALTER TABLE `booking_status` DROP INDEX `BookingID_idx4`;

ALTER TABLE `booking_status` DROP FOREIGN KEY `fk4_PaymentID`;
ALTER TABLE `booking_status` DROP INDEX `PaymentID_idx4`;

ALTER TABLE `passenger` DROP FOREIGN KEY `fk5_BookingID`;
ALTER TABLE `passenger` DROP INDEX `BookingID_idx5`;
