-- BEGIN SENARIO

-- A User Searches for Flights
SELECT *  
FROM airline_booking.flight 
INNER JOIN airline_booking.flight_times 
ON flight.FlightID=flight_times.FlightID;

-- A User Searches for Flights going to London from belfast after 9am on 2016-12-23
SELECT flight.FlightID,flight.DepartureDestination, flight.ArrivalDestination, flight_times.DepartureTime, flight_times.ArrivalTime, flight.FlightPrice  
FROM airline_booking.flight
INNER JOIN airline_booking.flight_times
ON flight.FlightID=flight_times.FlightID 
WHERE DepartureDestination = 'Belfast' AND ArrivalDestination = 'London' AND DepartureTime > '2016-12-23 12:00'
ORDER BY FlightPrice ASC; 

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
INSERT INTO airline_booking.passenger (BookingID, Title, Forename, Surname, PassengerType) 
VALUES (LAST_INSERT_ID(), 'Mr', 'Mark', 'Wahlberg', 'Standard');
INSERT INTO airline_booking.passenger_details (PassengerID, Birthdate, Address, Town, City, Country, Postcode, Telephone, MobileNumber) 
VALUES (LAST_INSERT_ID(), '1971-06-05', '3030 Pennsylvania Avenue', 'Belfast', 'Belfast', 'County Antrim', 'BT365AB', '02813125583', '07581112312');
INSERT INTO airline_booking.luggage (PassengerID, LuggageType, LuggagePrice) 
VALUES (LAST_INSERT_ID(), 'Hold', 9.99);
INSERT INTO airline_booking.travel_class (PassengerID, Class, Value) 
VALUES (LAST_INSERT_ID(), 'First Class', 20);
INSERT INTO airline_booking.seats (PlaneID, PassengerID, Seat, Row, Reserved) 
VALUES (8, LAST_INSERT_ID(), 'F', 1, 'YES');
SET FOREIGN_KEY_CHECKS=1;
commit;


-- Show new Booking

-- SELECT booking.BookingID, booking.FlightID, passenger.PassengerID, 
SELECT (CONCAT(passenger.Title, ' ', passenger.Forename, ' ', passenger.Surname)) as Name, 
passenger.PassengerType, passenger_details.Birthdate, 
(CONCAT(passenger_details.Address,', ' , passenger_details.Town,', ' , passenger_details.City,', ' , passenger_details.Country,', ' , passenger_details.Postcode)) as Address, 
passenger_details.Telephone, passenger_details.MobileNumber, luggage.LuggageType, travel_class.Class,
(CONCAT(flight.DepartureDestination, ' To ', flight.ArrivalDestination)) as Journey, flight_times.DepartureTime as Departure, 
flight_times.ArrivalTime as Arrival, (CONCAT(flight_times.DepartureTime - TIME('1:00'))) as BoardingTime, (CONCAT(seats.Seat, seats.Row)) as Seat
FROM airline_booking.booking 
INNER JOIN airline_booking.passenger ON booking.BookingID=passenger.BookingID
INNER JOIN airline_booking.passenger_details ON passenger.PassengerID=passenger_details.PassengerID
INNER JOIN airline_booking.luggage ON passenger.PassengerID=luggage.PassengerID
INNER JOIN airline_booking.travel_class ON passenger.PassengerID=travel_class.PassengerID
LEFT JOIN airline_booking.flight ON booking.FlightID=flight.flightID
LEFT JOIN airline_booking.flight_times ON flight.FlightID=flight_times.FlightID
INNER JOIN airline_booking.seats on seats.PassengerID=passenger.PassengerID
ORDER BY passenger.PassengerID DESC;

-- calculate price

SELECT flight.FlightPrice, seats.SeatPrice as 'Seat Price', luggage.LuggagePrice as 'Luggage Price', travel_class.Value as 'Class Price',  
(CONCAT(flight.FlightPrice + seats.SeatPrice + luggage.LuggagePrice + travel_class.Value)) as 'Total Price'
FROM airline_booking.booking 
RIGHT JOIN airline_booking.flight ON booking.FlightID=flight.flightID
RIGHT JOIN airline_booking.passenger ON booking.BookingID=passenger.BookingID
RIGHT JOIN airline_booking.seats ON passenger.PassengerID=seats.PassengerID
RIGHT JOIN airline_booking.luggage ON passenger.PassengerID=luggage.PassengerID
RIGHT JOIN  airline_booking.travel_class ON passenger.PassengerID=travel_class.PassengerID
WHERE passenger.PassengerID='11';

-- user wants to change his class
start transaction;
UPDATE travel_class
SET Class = 'Business Class'
WHERE PassengerID=11;
UPDATE travel_class
SET Value = '10'
WHERE PassengerID=11;
commit;

-- check it
SELECT passenger.PassengerID, (CONCAT(passenger.Title, ' ', passenger.Forename, ' ', passenger.Surname)) as Name, travel_class.Class,
(CONCAT(flight.DepartureDestination, ' To ', flight.ArrivalDestination)) as Journey, flight_times.DepartureTime as Departure, 
flight_times.ArrivalTime as Arrival, (CONCAT(seats.Seat, seats.Row)) as Seat
FROM airline_booking.booking 
INNER JOIN airline_booking.passenger ON booking.BookingID=passenger.BookingID
INNER JOIN airline_booking.passenger_details ON passenger.PassengerID=passenger_details.PassengerID
INNER JOIN airline_booking.luggage ON passenger.PassengerID=luggage.PassengerID
INNER JOIN airline_booking.travel_class ON passenger.PassengerID=travel_class.PassengerID
LEFT JOIN airline_booking.flight ON booking.FlightID=flight.flightID
LEFT JOIN airline_booking.flight_times ON flight.FlightID=flight_times.FlightID
INNER JOIN airline_booking.seats on seats.PassengerID=passenger.PassengerID
ORDER BY passenger.PassengerID DESC;


-- recalculate price

SELECT flight.FlightPrice, seats.SeatPrice as 'Seat Price', luggage.LuggagePrice as 'Luggage Price', travel_class.Value as 'Class Price',  
(CONCAT(flight.FlightPrice + seats.SeatPrice + luggage.LuggagePrice + travel_class.Value)) as 'Total Price'
FROM airline_booking.booking 
RIGHT JOIN airline_booking.flight ON booking.FlightID=flight.flightID
RIGHT JOIN airline_booking.passenger ON booking.BookingID=passenger.BookingID
RIGHT JOIN airline_booking.seats ON passenger.PassengerID=seats.PassengerID
RIGHT JOIN airline_booking.luggage ON passenger.PassengerID=luggage.PassengerID
RIGHT JOIN  airline_booking.travel_class ON passenger.PassengerID=travel_class.PassengerID
WHERE passenger.PassengerID='11';

-- Payment Confirmed

INSERT INTO airline_booking.card_details (AccountDetailsID, CardNumber, NameOnCard,BillingAddress, CvvNumber, ExpiryDate, ValidFrom, TypeOfCard, AdditionalCardCharge) 
VALUES (6, '8212147483647', 'MR WAHLBERG', '3030 Pennsylvania Avenue', '316', '2019-09-01', '2014-09-01', 'Visa Credit', 1);

select * from card_details ORDER BY CardID DESC;

-- new price

SELECT flight.FlightPrice, seats.SeatPrice as 'Seat Price', luggage.LuggagePrice as 'Luggage Price', travel_class.Value as 'Class Price',  
(CONCAT(TRUNCATE((flight.FlightPrice + seats.SeatPrice + luggage.LuggagePrice + travel_class.Value* 1.05), 2))) as 'Total Price'
FROM airline_booking.booking 
RIGHT JOIN airline_booking.flight ON booking.FlightID=flight.flightID
RIGHT JOIN airline_booking.passenger ON booking.BookingID=passenger.BookingID
RIGHT JOIN airline_booking.seats ON passenger.PassengerID=seats.PassengerID
RIGHT JOIN airline_booking.luggage ON passenger.PassengerID=luggage.PassengerID
RIGHT JOIN  airline_booking.travel_class ON passenger.PassengerID=travel_class.PassengerID
WHERE passenger.PassengerID='11';

-- proceed with payment

INSERT INTO airline_booking.payment (CardID, TotalDue, DateOfPayment) 
VALUES (last_insert_id(), 66.47, current_date());

-- check but waiting for bank confirmation
SELECT * FROM payment ORDER BY PaymentID DESC;

-- booking cant be confirmed until payment is confirmed
select BookingStatusID, BookingID, Status from booking_status ORDER BY BookingID DESC;

-- once bank confirmation is recived booking status updates to active
UPDATE payment SET Confirmed = '1' WHERE PaymentID= 6;
UPDATE booking_status SET Status = 'ACTIVE' WHERE BookingStatusID= 6;

SELECT payment.PaymentID, Confirmed, BookingStatusID, Status FROM payment, booking_status WHERE BookingStatusID = '6' LIMIT 1;

-- END OF SENARIO