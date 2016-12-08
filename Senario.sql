
-- A User Searches for Flights
SELECT *  
FROM airline_booking.flight 
INNER JOIN airline_booking.flight_times 
ON flight.FlightID=flight_times.FlightID;

-- search cheap flights
SELECT *  
FROM airline_booking.flight 
INNER JOIN airline_booking.flight_times
ON flight.FlightID=flight_times.FlightID
ORDER BY FlightPrice ASC;

-- A User Searches for cheapest Flights going to London from belfast
SELECT flight.FlightID,flight.DepartureDestination, flight.ArrivalDestination, flight_times.DepartureTime, flight_times.ArrivalTime, flight.FlightPrice 
FROM airline_booking.flight 
INNER JOIN airline_booking.flight_times 
ON flight.FlightID=flight_times.FlightID 
WHERE DepartureDestination = 'Belfast' AND ArrivalDestination = 'London'
ORDER BY FlightPrice ASC; 

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
INSERT INTO airline_booking.passenger (BookingID, Title, Forename, Surname, PassengerType) VALUES (LAST_INSERT_ID(), 'Mr', 'Mark', 'Wahlberg', 'Standard');
INSERT INTO airline_booking.passenger_details (PassengerID, Birthdate, Address, Town, City, Country, Postcode, Telephone, MobileNumber) 
VALUES (LAST_INSERT_ID(), '1971-06-05', '3030 Pennsylvania Avenue', 'Belfast', 'Belfast', 'County Antrim', 'BT365AB', '0281312558', '07581112');
INSERT INTO airline_booking.luggage (PassengerID, LuggageType, LuggagePrice) VALUES (LAST_INSERT_ID(), 'Hold', 9.99);
INSERT INTO airline_booking.travel_class (PassengerID, Class, Value) VALUES (LAST_INSERT_ID(), 'First Class', 20);
SET FOREIGN_KEY_CHECKS=1;
commit;

-- Show new Booking

SELECT booking.BookingID, booking.FlightID, passenger.PassengerID, (CONCAT(passenger.Title, ' ', passenger.Forename, ' ', passenger.Surname)) as Name, 
passenger.PassengerType, passenger_details.Birthdate, 
(CONCAT(passenger_details.Address,', ' , passenger_details.Town,', ' , passenger_details.City,', ' , passenger_details.Country,', ' , passenger_details.Postcode)) as Address, 
passenger_details.Telephone, passenger_details.MobileNumber, luggage.LuggageType, travel_class.Class,
(CONCAT(flight.DepartureDestination, ' To ', flight.ArrivalDestination)) as Journey, flight_times.DepartureTime as Departure, 
flight_times.ArrivalTime as Arrival, (CONCAT(flight_times.DepartureTime - TIME('1:00'))) as BoardingTime
FROM airline_booking.booking 
INNER JOIN airline_booking.passenger ON booking.BookingID=passenger.BookingID
INNER JOIN airline_booking.passenger_details ON passenger.PassengerID=passenger_details.PassengerID
INNER JOIN airline_booking.luggage ON passenger.PassengerID=luggage.PassengerID
INNER JOIN airline_booking.travel_class ON passenger.PassengerID=travel_class.PassengerID
RIGHT JOIN airline_booking.flight ON booking.FlightID=flight.flightID
RIGHT JOIN airline_booking.flight_times ON flight.FlightID=flight_times.FlightID
ORDER BY passenger.PassengerID DESC;


-- calculate price


-- Input Card Details


-- Payment Confirmed


-- Booking Status Changed





