# TRAVEL_MANAGEMENT_SYSTEM
#### Overview
The Travel Management System is designed to streamline and simplify the process of booking travel accommodations, such as flights and hotel rooms. This system aims to provide users with an integrated platform where they can search, book, and manage their travel itineraries efficiently. By automating various aspects of travel booking, the system enhances user experience and operational efficiency.

#### Database Schema
The database for the Travel Management System consists of the following tables: Users, Hotels, Flights, Payments, and Bookings. Each table stores specific information related to its entity, ensuring that the data is organized and accessible.

#### Entities and Attributes

##### Users
- **user_id (Primary Key)**: Unique identifier for each user.
- **username (Unique)**: Unique username chosen by the user.
- **contact_number**: User's contact number.
- **address**: User's address.
- **password**: User's password (stored securely).

##### Hotels
- **hotel_id (Primary Key)**: Unique identifier for each hotel.
- **name**: Name of the hotel.
- **address**: Address of the hotel.
- **city**: City where the hotel is located.
- **room_price**: Price per room.
- **available_rooms**: Number of available rooms.

##### Flights
- **flight_id (Primary Key)**: Unique identifier for each flight.
- **airline**: Airline operating the flight.
- **flight_number**: Unique flight number.
- **departure_airport**: Airport of departure.
- **arrival_airport**: Airport of arrival.
- **departure_time**: Scheduled departure time.
- **arrival_time**: Scheduled arrival time.
- **duration**: Flight duration.
- **price**: Price of the flight.
- **seats_available**: Number of available seats.
- **status**: Current status of the flight (e.g., on-time, delayed, canceled).

##### Payments
- **payment_id (Primary Key)**: Unique identifier for each payment.
- **user_id (Foreign Key)**: Identifier linking to the user who made the payment.
- **booking_id (Foreign Key)**: Identifier linking to the booking for which the payment was made.
- **payment_date**: Date the payment was made.
- **amount**: Payment amount.
- **status**: Status of the payment (e.g., completed, pending).

##### Bookings
- **booking_id (Primary Key)**: Unique identifier for each booking.
- **user_id (Foreign Key)**: Identifier linking to the user who made the booking.
- **flight_id (Foreign Key)**: Identifier linking to the flight that was booked.
- **hotel_id (Foreign Key)**: Identifier linking to the hotel that was booked.
- **booking_date**: Date the booking was made.
- **total_price**: Total price of the booking.
- **status**: Status of the booking (e.g., confirmed, canceled).

#### Purpose
The purpose of the Travel Management System is to provide users with a centralized platform for managing their travel needs. By integrating flight and hotel booking into a single system, users can:
- Easily search for and book flights and hotel rooms.
- Manage their travel itineraries in one place.
- Make secure payments for their bookings.
- Track the status of their bookings and payments.

For administrators and travel service providers, the system provides tools to:
- Manage and update information about flights and hotels.
- Monitor booking and payment statuses.
- Generate reports and analytics on travel bookings and payments.

#### Conclusion
The Travel Management System is a comprehensive solution designed to meet the needs of travelers and travel service providers. By offering an integrated platform for booking and managing travel services, the system enhances the user experience and operational efficiency. With its well-structured database schema, the system ensures that all relevant information is organized and accessible, supporting seamless travel management for all users.
