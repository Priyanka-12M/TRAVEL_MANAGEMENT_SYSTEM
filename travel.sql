create database travel;
use travel;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `hotels` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `room_price` decimal(10,2) NOT NULL,
  `available_rooms` int NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `flights` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `airline` varchar(100) NOT NULL,
  `flight_number` varchar(10) NOT NULL,
  `departure_airport` varchar(3) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `duration` time NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `seats_available` int NOT NULL,
  `status` varchar(20) DEFAULT 'Scheduled',
  PRIMARY KEY (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `payment_date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `flight_id` int DEFAULT NULL,
  `hotel_id` int DEFAULT NULL,
  `booking_date` datetime NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Confirmed',
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `flight_id` (`flight_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci





SELECT * FROM travel.users;

+---------+-----------+----------------+--------------+-----------+
| user_id | username  | contact_number | address      | password  |
+---------+-----------+----------------+--------------+-----------+
|       1 | priyanka  | 9087654321     | bangalore    | pri@12    |
|       2 | chethana  | 9087654323     | bangalore    | che@13    |
|       3 | sumithra  | 9087654322     | chikmagaluru | sumi@14   |
|       4 | vidya     | 9087654342     | davanagere   | vid@15    |
|       5 | prajwal   | 9087664342     | bangalore    | praj@16   |
|       6 | sanjay    | 9086664342     | chennai      | sanju@17  |
|       7 | jeevan    | 9986664382     | bidar        | jeeva@19  |
|       8 | srinivas  | 9986664380     | kolar        | seena@1   |
|       9 | kusuma    | 9986624382     | mandya       | kusu@2    |
|      10 | sanjana   | 9986624476     | hyderabad    | san@3     |
|      11 | adhithya  | 9986624475     | maharashtra  | adhi@4    |
|      12 | swathi    | 9986624471     | kashmir      | swat@5    |
|      13 | harish    | 9986624279     | AP           | hari@6    |
|      14 | pavithra  | 9986624269     | gujarat      | pavi@7    |
|      15 | shashank  | 9985524269     | haryana      | shash@8   |
|      16 | abhishek  | 9775524269     | orissa       | abhi@9    |
|      17 | gunashree | 9775524889     | bangalore    | guna@10   |
|      18 | priya     | 7775524889     | chennai      | priy@11   |
|      19 | abhinaya  | 7775524689     | chennai      | abhina@12 |
|      20 | aishwarya | 7775527689     | delhi        | aish@13   |
|      21 | sugandha  | 7775527680     | delhi        | sug@14    |
|      22 | pravin    | 8775527687     | thelangana   | prav@15   |
|      23 | hanumesh  | 8774427687     | bangalore    | hanu@16   |
|      24 | sridhar   | 8774466687     | bangalore    | sri@17    |
|      25 | tharun    | 8774466689     | delhi        | thar@18   |
|      26 | divya     | 8774776689     | delhi        | div@19    |
|      27 | harshath  | 9087653323     | bangalore    | hars@20   |
|      28 | harshitha | 9087653313     | chennai      | harshi@21 |
|      29 | keerthi   | 9088653313     | chennai      | keert@22  |
|      30 | ruchitha  | 9088653315     | orissa       | ruchi@23  |
|      31 | anusha    | 9088753315     | chandigadh   | anu@24    |
|      32 | gayana    | 9088753310     | chandigadh   | gaya@25   |
|      33 | shilpa    | 9088788310     | jammu        | shil@26   |
|      34 | varshitha | 9088788220     | kashmir      | var@27    |
|      35 | shifa     | 9067788220     | kashmir      | shifa@28  |
|      36 | komala    | 9067788210     | delhi        | kom@29    |
|      37 | rekha     | 9067788219     | bangalore    | rekh@30   |
|      38 | likitha   | 9967786219     | chennai      | liki@31   |
|      39 | madesh    | 9967786218     | chennai      | mad@32    |
|      40 | dinesh    | 9967787218     | chennai      | din@33    |
|      41 | naveen    | 9927787218     | AP           | nav@34    |
|      42 | rithesh   | 9927701218     | AP           | rith@35   |
|      43 | narendra  | 9929701218     | bangalore    | nare@36   |
|      44 | vinay     | 9929701210     | bangalore    | vin@37    |
|      45 | karthik   | 9929701212     | bangalore    | karth@38  |
|      46 | sangeetha | 9929501212     | bangalore    | sang@39   |
|      47 | namratha  | 9927801212     | chennai      | nam@40    |
|      48 | snehith   | 8927801210     | chennai      | sneh@41   |
|      49 | thanisha  | 8727801219     | hyderabad    | thani@42  |
|      50 | thanu     | 8727856219     | AP           | than@43   |
|      51 | santhosh  | 6726856219     | bangalore    | santhu@44 |
|      52 | vanishree | 6726856210     | bangalore    | vani@45   |
+---------+-----------+----------------+--------------+-----------+
52 rows in set (0.00 sec)

SELECT * FROM travel.flights;

+-----------+--------------------+---------------+-------------------+-----------------+---------------------+---------------------+----------+--------+-----------------+-----------+
| flight_id | airline            | flight_number | departure_airport | arrival_airport | departure_time      | arrival_time        | duration | price  | seats_available | status    |
+-----------+--------------------+---------------+-------------------+-----------------+---------------------+---------------------+----------+--------+-----------------+-----------+
|        11 | Delta Air Lines    | DL124         | LAX               | JFK             | 2024-06-02 08:00:00 | 2024-06-02 16:00:00 | 05:00:00 | 310.00 |             150 | Scheduled |
|        12 | American Airlines  | AA457         | MIA               | ORD             | 2024-06-02 09:00:00 | 2024-06-02 12:00:00 | 03:00:00 | 220.00 |             180 | Scheduled |
|        13 | United Airlines    | UA790         | SEA               | SFO             | 2024-06-02 10:00:00 | 2024-06-02 12:30:00 | 02:30:00 | 160.00 |
         160 | Scheduled |
|        14 | Southwest Airlines | SW102         | LAS               | DAL             | 2024-06-02 11:00:00 | 2024-06-02 14:00:00 | 02:00:00 | 110.00 |             175 | Scheduled |
|        15 | JetBlue Airways    | JB203         | SFO               | BOS             | 2024-06-02 12:00:00 | 2024-06-02 21:30:00 | 06:30:00 | 360.00 |             140 | Scheduled |
|        16 | Alaska Airlines    | AS304         | ANC               | SEA             | 2024-06-02 13:00:00 | 2024-06-02 16:00:00 | 03:00:00 | 260.00 |             130 | Scheduled |
|        17 | Spirit Airlines    | SP405         | ATL               | FLL             | 2024-06-02 14:00:00 | 2024-06-02 17:00:00 | 02:00:00 | 100.00 |             190 | Scheduled |
|        18 | Frontier Airlines  | FR506         | LAS               | DEN             | 2024-06-02 15:00:00 | 2024-06-02 18:00:00 | 02:00:00 |  90.00 |             170 | Scheduled |
|        19 | Hawaiian Airlines  | HA607         | LAX               | HNL             | 2024-06-02 16:00:00 | 2024-06-02 22:00:00 | 06:00:00 | 410.00 |             120 | Scheduled |
|        20 | Allegiant Air      | G4721         | SFB               | PIE             | 2024-06-02 17:00:00 | 2024-06-02 19:00:00 | 01:00:00 |  80.00 |             200 | Scheduled |
|        21 | Delta Air Lines    | DL125         | JFK               | LAX             | 2024-06-03 08:00:00 | 2024-06-03 11:00:00 | 06:00:00 | 320.00 |             150 | Scheduled |
|        22 | American Airlines  | AA458         | ORD               | MIA             | 2024-06-03 09:00:00 | 2024-06-03 13:00:00 | 04:00:00 | 210.00 |             180 | Scheduled |
|        23 | United Airlines    | UA791         | SFO               | SEA             | 2024-06-03 10:00:00 | 2024-06-03 12:30:00 | 02:30:00 | 170.00 |             160 | Scheduled |
|        24 | Southwest Airlines | SW103         | DAL               | LAS             | 2024-06-03 11:00:00 | 2024-06-03 12:30:00 | 01:30:00 | 120.00 |             175 | Scheduled |
|        25 | JetBlue Airways    | JB204         | BOS               | SFO             | 2024-06-03 12:00:00 | 2024-06-03 15:30:00 | 06:30:00 | 370.00 |             140 | Scheduled |
|        26 | Alaska Airlines    | AS305         | SEA               | ANC             | 2024-06-03 13:00:00 | 2024-06-03 16:00:00 | 03:00:00 | 270.00 |             130 | Scheduled |
|        27 | Spirit Airlines    | SP406         | FLL               | ATL             | 2024-06-03 14:00:00 | 2024-06-03 16:00:00 | 02:00:00 | 110.00 |
         190 | Scheduled |
|        28 | Frontier Airlines  | FR507         | DEN               | LAS             | 2024-06-03 15:00:00 | 2024-06-03 16:30:00 | 01:30:00 | 100.00 |             170 | Scheduled |
|        29 | Hawaiian Airlines  | HA608         | HNL               | LAX             | 2024-06-03 16:00:00 | 2024-06-03 22:00:00 | 06:00:00 | 420.00 |             120 | Scheduled |
|        30 | Allegiant Air      | G4722         | PIE               | SFB             | 2024-06-03 17:00:00 | 2024-06-03 18:00:00 | 01:00:00 |  90.00 |             200 | Scheduled |
|        31 | Delta Air Lines    | DL126         | LAX               | JFK             | 2024-06-04 08:00:00 | 2024-06-04 16:00:00 | 05:00:00 | 330.00 |             150 | Scheduled |
|        32 | American Airlines  | AA459         | MIA               | ORD             | 2024-06-04 09:00:00 | 2024-06-04 12:00:00 | 03:00:00 | 230.00 |             180 | Scheduled |
|        33 | United Airlines    | UA792         | SEA               | SFO             | 2024-06-04 10:00:00 | 2024-06-04 12:30:00 | 02:30:00 | 180.00 |             160 | Scheduled |
|        34 | Southwest Airlines | SW104         | LAS               | DAL             | 2024-06-04 11:00:00 | 2024-06-04 14:00:00 | 02:00:00 | 130.00 |             175 | Scheduled |
|        35 | JetBlue Airways    | JB205         | SFO               | BOS             | 2024-06-04 12:00:00 | 2024-06-04 21:30:00 | 06:30:00 | 380.00 |             140 | Scheduled |
|        36 | Alaska Airlines    | AS306         | ANC               | SEA             | 2024-06-04 13:00:00 | 2024-06-04 16:00:00 | 03:00:00 | 280.00 |             130 | Scheduled |
|        37 | Spirit Airlines    | SP407         | ATL               | FLL             | 2024-06-04 14:00:00 | 2024-06-04 17:00:00 | 02:00:00 | 120.00 |             190 | Scheduled |
|        38 | Frontier Airlines  | FR508         | LAS               | DEN             | 2024-06-04 15:00:00 | 2024-06-04 18:00:00 | 02:00:00 | 110.00 |             170 | Scheduled |
|        39 | Hawaiian Airlines  | HA609         | LAX               | HNL             | 2024-06-04 16:00:00 | 2024-06-04 22:00:00 | 06:00:00 | 430.00 |             120 | Scheduled |
|        40 | Allegiant Air      | G4723         | SFB               | PIE             | 2024-06-04 17:00:00 | 2024-06-04 19:00:00 | 01:00:00 | 100.00 |             200 | Scheduled |
|        41 | Delta Air Lines    | DL127         | JFK               | LAX             | 2024-06-05 08:00:00 | 2024-06-05 11:00:00 | 06:00:00 | 340.00 |             150 | Scheduled |
|        42 | American Airlines  | AA460         | ORD               | MIA             | 2024-06-05 09:00:00 | 2024-06-05 13:00:00 | 04:00:00 | 240.00 |
         180 | Scheduled |
|        43 | United Airlines    | UA793         | SFO               | SEA             | 2024-06-05 10:00:00 | 2024-06-05 12:30:00 | 02:30:00 | 190.00 |             160 | Scheduled |
|        44 | Southwest Airlines | SW105         | DAL               | LAS             | 2024-06-05 11:00:00 | 2024-06-05 12:30:00 | 01:30:00 | 140.00 |             175 | Scheduled |
|        45 | JetBlue Airways    | JB206         | BOS               | SFO             | 2024-06-05 12:00:00 | 2024-06-05 15:30:00 | 06:30:00 | 390.00 |             140 | Scheduled |
|        46 | Alaska Airlines    | AS307         | SEA               | ANC             | 2024-06-05 13:00:00 | 2024-06-05 16:00:00 | 03:00:00 | 290.00 |             130 | Scheduled |
|        47 | Spirit Airlines    | SP408         | FLL               | ATL             | 2024-06-05 14:00:00 | 2024-06-05 16:00:00 | 02:00:00 | 130.00 |             190 | Scheduled |
|        48 | Frontier Airlines  | FR509         | DEN               | LAS             | 2024-06-05 15:00:00 | 2024-06-05 16:30:00 | 01:30:00 | 120.00 |             170 | Scheduled |
|        49 | Hawaiian Airlines  | HA610         | HNL               | LAX             | 2024-06-05 16:00:00 | 2024-06-05 22:00:00 | 06:00:00 | 440.00 |             120 | Scheduled |
|        50 | Allegiant Air      | G4724         | PIE               | SFB             | 2024-06-05 17:00:00 | 2024-06-05 18:00:00 | 01:00:00 | 450.00 |             150 | Scheduled |
|       101 | Delta Air Lines    | DL123         | JFK               | LAX             | 2024-06-01 08:00:00 | 2024-06-01 11:00:00 | 06:00:00 | 300.00 |             150 | Scheduled |
|       102 | American Airlines  | AA456         | ORD               | MIA             | 2024-06-01 09:00:00 | 2024-06-01 13:00:00 | 04:00:00 | 200.00 |             180 | Scheduled |
|       103 | United Airlines    | UA789         | SFO               | SEA             | 2024-06-01 10:00:00 | 2024-06-01 12:30:00 | 02:30:00 | 150.00 |
         160 | Scheduled |
|       104 | Southwest Airlines | SW101         | DAL               | LAS             | 2024-06-01 11:00:00 | 2024-06-01 12:30:00 | 01:30:00 | 100.00 |             175 | Scheduled |
|       105 | JetBlue Airways    | JB202         | BOS               | SFO             | 2024-06-01 12:00:00 | 2024-06-01 15:30:00 | 06:30:00 | 350.00 |             140 | Scheduled |
|       106 | Alaska Airlines    | AS303         | SEA               | ANC             | 2024-06-01 13:00:00 | 2024-06-01 16:00:00 | 03:00:00 | 250.00 |             130 | Scheduled |
|       107 | Spirit Airlines    | SP404         | FLL               | ATL             | 2024-06-01 14:00:00 | 2024-06-01 16:00:00 | 02:00:00 |  90.00 |             190 | Scheduled |
|       108 | Frontier Airlines  | FR505         | DEN               | LAS             | 2024-06-01 15:00:00 | 2024-06-01 16:30:00 | 01:30:00 |  80.00 |             170 | Scheduled |
|       109 | Hawaiian Airlines  | HA606         | HNL               | LAX             | 2024-06-01 16:00:00 | 2024-06-01 22:00:00 | 06:00:00 | 400.00 |             120 | Scheduled |
|       110 | Allegiant Air      | G4720         | PIE               | SFB             | 2024-06-01 17:00:00 | 2024-06-01 18:00:00 | 01:00:00 |  70.00 |             200 | Scheduled |
+-----------+--------------------+---------------+-------------------+-----------------+---------------------+---------------------+----------+--------+-----------------+-----------+
50 rows in set (0.00 sec)


SELECT * FROM travel.hotels;

+----------+---------------------+-----------------------------+----------------+------------+-----------------+
| hotel_id | name                | address                     | city           | room_price | available_rooms |
+----------+---------------------+-----------------------------+----------------+------------+-----------------+
|        1 | Hotel California    | 123 Main Street             | Los Angeles    |     150.00 |             100 |
|        2 | Grand Hotel         | 456 Elm Street              | New York       |     200.00 |              80 |
|        3 | Ocean View Resort   | 789 Ocean Avenue            | Miami          |     250.00 |             120 |
|        4 | Mountain Lodge      | 101 Mountain Road           | Denver         |     180.00 |              90 |
|        5 | Beachfront Hotel    | 555 Beach Boulevard         | San Diego      |     300.00 |             150 |
|        6 | City Center Inn     | 777 Downtown Avenue         | Chicago        |     170.00 |             110 |
|        7 | Parkside Plaza      | 888 Park Avenue             | San Francisco  |     220.00 |             130 |
|        8 | Riverside Retreat   | 222 River Road              | Portland       |     190.00 |             100 |
|        9 | Lakeview Lodge      | 333 Lake Street             | Seattle        |     210.00 |             110 |
|       10 | Desert Oasis        | 444 Desert Drive            | Phoenix        |     180.00 |             100 |
|       11 | Sunset Suites       | 555 Sunset Boulevard        | Los Angeles    |     280.00 |             120 |
|       12 | Skyline Hotel       | 666 Skyline Avenue          | New York       |     320.00 |              90 |
|       13 | Seaside Resort      | 777 Ocean Avenue            | Miami          |     350.00 |             100 |
|       14 | Mountain View Inn   | 888 Mountain Road           | Denver         |     200.00 |              80 |
|       15 | Island Paradise     | 999 Island Boulevard        | Honolulu       |     400.00 |             150 |
|       16 | Historic Inn        | 111 Main Street             | Boston         |     230.00 |             110 |
|       17 | Harbor View Hotel   | 222 Harbor Drive            | San Diego      |     320.00 |             130 |
|       18 | Downtown Suites     | 333 Downtown Avenue         | Chicago        |     270.00 |             120 |
|       19 | City Lights Inn     | 444 City Lights Boulevard   | San Francisco  |     300.00 |             140 |
|       20 | Mountain Retreat    | 555 Mountain Road           | Aspen          |     350.00 |             100 |
|       21 | Beachfront Resort   | 666 Beach Boulevard         | Miami          |     400.00 |             160 |
|       22 | Urban Oasis         | 777 Urban Avenue            | New York       |     290.00 |             110 |
|       23 | Lakefront Lodge     | 888 Lakefront Road          | Seattle        |     250.00 |             100 |
|       24 | Tropical Hideaway   | 999 Tropical Street         | Key West       |     380.00 |             120 |
|       25 | Lakeside Resort     | 111 Lakeview Drive          | Orlando        |     320.00 |             130 |
|       26 | Downtown Hotel      | 222 Downtown Street         | San Antonio    |     200.00 |              90 |
|       27 | Riverfront Inn      | 333 Riverfront Avenue       | Portland       |     270.00 |             100 |
|       28 | Valley View Lodge   | 444 Valley View Road        | Sedona         |     350.00 |             110 |
|       29 | Seaview Hotel       | 555 Seaview Boulevard       | Santa Barbara  |     400.00 |             140 |
|       30 | Mountain Lodge      | 666 Mountain Road           | Jackson Hole   |     380.00 |             100 |
|       31 | Countryside Inn     | 777 Countryside Avenue      | Nashville      |     230.00 |              80 |
|       32 | Highland Retreat    | 888 Highland Drive          | Denver         |     290.00 |             110 |
|       33 | Oceanfront Resort   | 999 Oceanfront Avenue       | Myrtle Beach   |     350.00 |             120 |
|       34 | Beachside Hotel     | 111 Beachside Boulevard     | San Diego      |     320.00 |             100 |
|       35 | Lakeview Resort     | 222 Lakeview Drive          | Lake Tahoe     |     400.00 |             130 |
|       36 | Riverside Hotel     | 333 Riverside Road          | Austin         |     280.00 |              90 |
|       37 | Downtown Suites     | 444 Downtown Avenue         | Minneapolis    |     270.00 |             100 |
|       38 | City Center Inn     | 555 City Center Boulevard   | Portland       |     250.00 |             110 |
|       39 | Seaside Lodge       | 666 Seaside Avenue          | Monterey       |     300.00 |             120 |
|       40 | Grand View Hotel    | 777 Grand View Road         | San Francisco  |     380.00 |             140 |
|       41 | Mountain Chalet     | 888 Mountain Drive          | Breckenridge   |     350.00 |             100 |
|       42 | Riverfront Retreat  | 999 Riverfront Avenue       | Chattanooga    |     320.00 |             110 |
|       43 | Island Resort       | 111 Island View Drive       | Key Largo      |     400.00 |             130 |
|       44 | Harbor Lights Hotel | 222 Harbor Lights Boulevard | Annapolis      |     290.00 |             100 |
|       45 | Lakefront Inn       | 333 Lakefront Avenue        | Lake Geneva    |     360.00 |             120 |
|       46 | Countryside Lodge   | 444 Countryside Road        | Branson        |     250.00 |              80 |
|       47 | Desert Mirage       | 555 Desert Avenue           | Palm Springs   |     330.00 |             110 |
|       48 | Mountain View Hotel | 666 Mountain View Drive     | Gatlinburg     |     380.00 |             120 |
|       49 | Seaview Resort      | 777 Seaview Boulevard       | Cape Cod       |     400.00 |             140 |
|       50 | Beachfront Inn      | 888 Beachfront Road         | Virginia Beach |     380.00 |             130 |
+----------+---------------------+-----------------------------+----------------+------------+-----------------+
50 rows in set (0.00 sec)

SELECT * FROM travel.payments;

+------------+---------+------------+---------------------+--------+---------+
| payment_id | user_id | booking_id | payment_date        | amount | status  |
+------------+---------+------------+---------------------+--------+---------+
|          1 |       1 |          1 | 2024-06-01 00:00:00 |  50.00 | Pending |
|          2 |       2 |          2 | 2024-06-02 00:00:00 |  55.00 | Pending |
|          3 |       3 |          3 | 2024-06-03 00:00:00 |  60.00 | Pending |
|          4 |       4 |          4 | 2024-06-04 00:00:00 |  65.00 | Pending |
|          5 |       5 |          5 | 2024-06-05 00:00:00 |  70.00 | Pending |
|          6 |       6 |          6 | 2024-06-06 00:00:00 |  75.00 | Pending |
|          7 |       7 |          7 | 2024-06-07 00:00:00 |  80.00 | Pending |
|          8 |       8 |          8 | 2024-06-08 00:00:00 |  85.00 | Pending |
|          9 |       9 |          9 | 2024-06-09 00:00:00 |  90.00 | Pending |
|         10 |      10 |         10 | 2024-06-10 00:00:00 |  95.00 | Pending |
|         11 |      11 |         11 | 2024-06-11 00:00:00 | 100.00 | Pending |
|         12 |      12 |         12 | 2024-06-12 00:00:00 | 105.00 | Pending |
|         13 |      13 |         13 | 2024-06-13 00:00:00 | 110.00 | Pending |
|         14 |      14 |         14 | 2024-06-14 00:00:00 | 115.00 | Pending |
|         15 |      15 |         15 | 2024-06-15 00:00:00 | 120.00 | Pending |
|         16 |      16 |         16 | 2024-06-16 00:00:00 | 125.00 | Pending |
|         17 |      17 |         17 | 2024-06-17 00:00:00 | 130.00 | Pending |
|         18 |      18 |         18 | 2024-06-18 00:00:00 | 135.00 | Pending |
|         19 |      19 |         19 | 2024-06-19 00:00:00 | 140.00 | Pending |
|         20 |      20 |         20 | 2024-06-20 00:00:00 | 145.00 | Pending |
|         21 |      21 |         21 | 2024-06-21 00:00:00 | 150.00 | Pending |
|         22 |      22 |         22 | 2024-06-22 00:00:00 | 155.00 | Pending |
|         23 |      23 |         23 | 2024-06-23 00:00:00 | 160.00 | Pending |
|         24 |      24 |         24 | 2024-06-24 00:00:00 | 165.00 | Pending |
|         25 |      25 |         25 | 2024-06-25 00:00:00 | 170.00 | Pending |
|         26 |      26 |         26 | 2024-06-26 00:00:00 | 175.00 | Pending |
|         27 |      27 |         27 | 2024-06-27 00:00:00 | 180.00 | Pending |
|         28 |      28 |         28 | 2024-06-28 00:00:00 | 185.00 | Pending |
|         29 |      29 |         29 | 2024-06-29 00:00:00 | 190.00 | Pending |
|         30 |      30 |         30 | 2024-06-30 00:00:00 | 195.00 | Pending |
|         31 |      31 |         31 | 2024-07-01 00:00:00 | 200.00 | Pending |
|         32 |      32 |         32 | 2024-07-02 00:00:00 | 205.00 | Pending |
|         33 |      33 |         33 | 2024-07-03 00:00:00 | 210.00 | Pending |
|         34 |      34 |         34 | 2024-07-04 00:00:00 | 215.00 | Pending |
|         35 |      35 |         35 | 2024-07-05 00:00:00 | 220.00 | Pending |
|         36 |      36 |         36 | 2024-07-06 00:00:00 | 225.00 | Pending |
|         37 |      37 |         37 | 2024-07-07 00:00:00 | 230.00 | Pending |
|         38 |      38 |         38 | 2024-07-08 00:00:00 | 235.00 | Pending |
|         39 |      39 |         39 | 2024-07-09 00:00:00 | 240.00 | Pending |
|         40 |      40 |         40 | 2024-07-10 00:00:00 | 245.00 | Pending |
|         41 |      41 |         41 | 2024-07-11 00:00:00 | 250.00 | Pending |
|         42 |      42 |         42 | 2024-07-12 00:00:00 | 255.00 | Pending |
|         43 |      43 |         43 | 2024-07-13 00:00:00 | 260.00 | Pending |
|         44 |      44 |         44 | 2024-07-14 00:00:00 | 265.00 | Pending |
|         45 |      45 |         45 | 2024-07-15 00:00:00 | 270.00 | Pending |
|         46 |      46 |         46 | 2024-07-16 00:00:00 | 275.00 | Pending |
|         47 |      47 |         47 | 2024-07-17 00:00:00 | 280.00 | Pending |
|         48 |      48 |         48 | 2024-07-18 00:00:00 | 285.00 | Pending |
|         49 |      49 |         49 | 2024-07-19 00:00:00 | 290.00 | Pending |
|         50 |      50 |         50 | 2024-07-20 00:00:00 | 295.00 | Pending |
+------------+---------+------------+---------------------+--------+---------+
50 rows in set (0.00 sec)

SELECT * FROM travel.bookings;

+------------+---------+-----------+----------+---------------------+-------------+-----------+
| booking_id | user_id | flight_id | hotel_id | booking_date        | total_price | status    |
+------------+---------+-----------+----------+---------------------+-------------+-----------+
|          1 |       1 |        11 |        1 | 2024-06-01 00:00:00 |      450.00 | Confirmed |
|          2 |       2 |        12 |        2 | 2024-06-02 00:00:00 |      500.00 | Confirmed |
|          3 |       3 |        13 |        3 | 2024-06-03 00:00:00 |      550.00 | Confirmed |
|          4 |       4 |        14 |        4 | 2024-06-04 00:00:00 |      600.00 | Confirmed |
|          5 |       5 |        15 |        5 | 2024-06-05 00:00:00 |      650.00 | Confirmed |
|          6 |       6 |        16 |        6 | 2024-06-06 00:00:00 |      700.00 | Confirmed |
|          7 |       7 |        17 |        7 | 2024-06-07 00:00:00 |      750.00 | Confirmed |
|          8 |       8 |        18 |        8 | 2024-06-08 00:00:00 |      800.00 | Confirmed |
|          9 |       9 |        19 |        9 | 2024-06-09 00:00:00 |      850.00 | Confirmed |
|         10 |      10 |        20 |       10 | 2024-06-10 00:00:00 |      900.00 | Confirmed |
|         11 |      11 |        21 |       11 | 2024-06-11 00:00:00 |      950.00 | Confirmed |
|         12 |      12 |        22 |       12 | 2024-06-12 00:00:00 |     1000.00 | Confirmed |
|         13 |      13 |        23 |       13 | 2024-06-13 00:00:00 |     1050.00 | Confirmed |
|         14 |      14 |        24 |       14 | 2024-06-14 00:00:00 |     1100.00 | Confirmed |
|         15 |      15 |        25 |       15 | 2024-06-15 00:00:00 |     1150.00 | Confirmed |
|         16 |      16 |        26 |       16 | 2024-06-16 00:00:00 |     1200.00 | Confirmed |
|         17 |      17 |        27 |       17 | 2024-06-17 00:00:00 |     1250.00 | Confirmed |
|         18 |      18 |        28 |       18 | 2024-06-18 00:00:00 |     1300.00 | Confirmed |
|         19 |      19 |        29 |       19 | 2024-06-19 00:00:00 |     1350.00 | Confirmed |
|         20 |      20 |        30 |       20 | 2024-06-20 00:00:00 |     1400.00 | Confirmed |
|         21 |      21 |        31 |       21 | 2024-06-21 00:00:00 |     1450.00 | Confirmed |
|         22 |      22 |        32 |       22 | 2024-06-22 00:00:00 |     1500.00 | Confirmed |
|         23 |      23 |        33 |       23 | 2024-06-23 00:00:00 |     1550.00 | Confirmed |
|         24 |      24 |        34 |       24 | 2024-06-24 00:00:00 |     1600.00 | Confirmed |
|         25 |      25 |        35 |       25 | 2024-06-25 00:00:00 |     1650.00 | Confirmed |
|         26 |      26 |        36 |       26 | 2024-06-26 00:00:00 |     1700.00 | Confirmed |
|         27 |      27 |        37 |       27 | 2024-06-27 00:00:00 |     1750.00 | Confirmed |
|         28 |      28 |        38 |       28 | 2024-06-28 00:00:00 |     1800.00 | Confirmed |
|         29 |      29 |        39 |       29 | 2024-06-29 00:00:00 |     1850.00 | Confirmed |
|         30 |      30 |        40 |       30 | 2024-06-30 00:00:00 |     1900.00 | Confirmed |
|         31 |      31 |        41 |       31 | 2024-07-01 00:00:00 |     1950.00 | Confirmed |
|         32 |      32 |        42 |       32 | 2024-07-02 00:00:00 |     2000.00 | Confirmed |
|         33 |      33 |        43 |       33 | 2024-07-03 00:00:00 |     2050.00 | Confirmed |
|         34 |      34 |        44 |       34 | 2024-07-04 00:00:00 |     2100.00 | Confirmed |
|         35 |      35 |        45 |       35 | 2024-07-05 00:00:00 |     2150.00 | Confirmed |
|         36 |      36 |        46 |       36 | 2024-07-06 00:00:00 |     2200.00 | Confirmed |
|         37 |      37 |        47 |       37 | 2024-07-07 00:00:00 |     2250.00 | Confirmed |
|         38 |      38 |        48 |       38 | 2024-07-08 00:00:00 |     2300.00 | Confirmed |
|         39 |      39 |        49 |       39 | 2024-07-09 00:00:00 |     2350.00 | Confirmed |
|         40 |      40 |        50 |       40 | 2024-07-10 00:00:00 |     2400.00 | Confirmed |
|         41 |      41 |       101 |       41 | 2024-07-11 00:00:00 |     2450.00 | Confirmed |
|         42 |      42 |       102 |       42 | 2024-07-12 00:00:00 |     2500.00 | Confirmed |
|         43 |      43 |       103 |       43 | 2024-07-13 00:00:00 |     2550.00 | Confirmed |
|         44 |      44 |       104 |       44 | 2024-07-14 00:00:00 |     2600.00 | Confirmed |
|         45 |      45 |       105 |       45 | 2024-07-15 00:00:00 |     2650.00 | Confirmed |
|         46 |      46 |       106 |       46 | 2024-07-16 00:00:00 |     2700.00 | Confirmed |
|         47 |      47 |       107 |       47 | 2024-07-17 00:00:00 |     2750.00 | Confirmed |
|         48 |      48 |       108 |       48 | 2024-07-18 00:00:00 |     2800.00 | Confirmed |
|         49 |      49 |       109 |       49 | 2024-07-19 00:00:00 |     2850.00 | Confirmed |
|         50 |      50 |       110 |       50 | 2024-07-20 00:00:00 |     2750.00 | confirmed |
+------------+---------+-----------+----------+---------------------+-------------+-----------+
50 rows in set (0.00 sec)






