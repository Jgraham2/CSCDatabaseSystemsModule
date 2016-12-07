-- SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate 
-- FROM Orders 
-- INNER JOIN Customers 
-- ON Orders.CustomerID=Customers.CustomerID;

-- A User Searches for Flights
SELECT *  
FROM `airline_booking`.`flight` 
INNER JOIN `airline_booking`.`flight_times` 
ON `flight`.`FlightID`=`flight_times`.`FlightID`;

-- A User Searches for Flights going to London from belfast after 9am on 2016-12-23
SELECT `flight`.`FlightID`,`flight`.`DepartureDestination`, `flight`.`ArrivalDestination`,`flight_times`.`DepartureTime`, `flight_times`.`ArrivalTime`  
FROM `airline_booking`.`flight` 
INNER JOIN `airline_booking`.`flight_times` 
ON `flight`.`FlightID`=`flight_times`.`FlightID` 
WHERE `DepartureDestination` = 'Belfast' AND `ArrivalDestination` = 'London' AND `DepartureTime` > '2016-12-23 09:00'; 

-- A User creates an account
start transaction;
INSERT INTO airline_booking.account (Password, Username) VALUES (SHA1('Megatron1984'),'TransformerFan1');
INSERT INTO airline_booking.account_details (AccountID, Name, Email, Address, Telephone) 
VALUES (LAST_INSERT_ID(), 'Mark Wahlberg', 'Mwahlberg2@gmail.com', '3030 Pennsylvania Avenue', '07581112590');
commit;

-- Show a users new account
SELECT account.AccountID, account.Password, account.Username, account_details.Name, account_details.Email, account_details.Address, account_details.Telephone 
FROM airline_booking.account INNER JOIN airline_booking.account_details ON account.AccountID=account_details.AccountID;

-- User wants to make a Booking
start transaction;
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO airline_booking.booking (AccountID, FlightID, ReasonForTravel) VALUES (6, 8, 'leisure');
INSERT INTO airline_booking.booking_status (BookingID) 
VALUES (LAST_INSERT_ID());

-- passenger details next

SET FOREIGN_KEY_CHECKS=1;



commit;



-- Show there new Booking


-- calculate price


-- Input Card Details


-- Payment Confirmed


-- Booking Status Changed





