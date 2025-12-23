# HolidayMaker
A simple backend travel API written in C# using ASP.NET Core running on .NET 10 featuring session based authentication and MySQL data storage. The API manages users,  accommodation, activity and transportation bookings bundled together as travel packages.

## Technology stack
- C#
- ASP.NET Core
- .NET 10
- MySQL
- Postman (testing)
- MySQL access via MySqlHelper
- Session-based authentication

## Requirements
### **System Requirements**

- .NET SDK 10
- Git
- A REST client (Ex. Bruno, Postman or Thunderclient)
- Local MySQL server version 9.2.0
- Configured connection string

### **Functional Requirements**

- [X] Login authorization (User account)
- [ ] Search for vacant accommodations with specified criteria such as vacancy, location and party size
- [ ] Filter by hotel capacity
- [X] Create and manage bookings with one or more rooms
- [ ] Filter accommodations by amenities
- [ ] Complex filtering of accommodations by distance to attractions
- [ ] Search results include nearby alternatives in descending, prioritized order
- [X] Role specific account and system management
- [ ] Search with specific departure and arrival time
- [X] Clear descriptions of the accommodation and travel package options so the traveler understands their selection prior to booking
- [X] Traveler can view lists with concise descriptions
- [X] Display for traveler detailed information of a selected booking
- [ ] Display itemized cost breakdown for the traveler
- As an admin:
  - [ ] View lists of bookings, travelers, accommodations and activities with concise descriptions
  - [ ] View detailed descriptions of bookings, accommodations, activities and users

### Suggested Additional features

- [ ] Recommendations based on previous bookings, intersets and travel history
- [X] Rating of destinations and accommodations by previous guests
- [ ] Ability for user to send messages to accommodations, activty managers or tour operators
- As Admin:
  - [ ] Cancel or change reservations
  - [ ] Plan a list of excursions for a specified trip
- [ ] Traveler can sign up for single, multiple or all stops on an excursion
- [ ] Seat reservation for limited places such as excursions
- [ ] Detailed cost invoice

## 🚀 How to Run

```
git clone git@github.com:hkmp1303/HolidayMaker.git

cd HolidayMaker

dotnet run
```


## Configuration

Configure the database connection string in Program.cs before running the application which uses MySQL and expects the required schema to be present. The local HTTP port used during development is defined in Properties/launchSettings.json. Configuration values are loaded at runtime. Sessions are stored in memory.

## Database Design
### EER Diagram
![EER Diagram](docs/Diagram75.png)

The initial database design was created early in the project. Structural issues were identified such as a lack of convergence between transportation, activity, hotel and package bookings as well as certain tables implementing specific features without required relationships to relevant tables. A revised, proposed EER diagram was created and reviewed by group members which improved entity relationships and normalization.

Due to time constraints, the proposed changes were not fully implemnted before delivery. The design improvments were discussed with the team on Tuesday December 16th. The proposed diagram is available in [docs/agile/diagrams/proposed_diagram](docs/agile/diagrams/proposed_diagram.png) along with diagram versions 1 and 2.

### Database Setup
While in MySQLWorkbench, open the setup.sql, data.ddl and data.sql files from the project folder. Select "View all file types" to ensure the data.ddl file is visible. Run the SQL scripts in the aforementioned order: [setup.sql](setup.sql), [data.ddl](data.ddl), [data.sql](data.sql). The setup.sql file creates the database and user while the tables are created by the data.ddl file. Finally, run the SQL queries in the data.sql file to populate the tables with mock data. The data can also be populated through Postman by reseting the database through `delete /db` once the API is running.

## API Overview

The API will be available via HTTP protocal at `http://localhost:5143` after running the application. The correct port number will be displayed in the console output. Port configuration values are stored and can be changed in Properties/launchSettings.json.

### Key Endpoints

Only representative endpoints are listed. Internal utility endpoints are omitted for clarity.
A Postman collection for this project can be found at this [link](https://heather-p-4407471.postman.co/workspace/heather-p's-Workspace~1044ea2e-896e-41da-83f4-6e11bd4ffb6c/collection/50645716-e710b040-056e-417b-8351-df3e268012e1?action=share&creator=50645716).

### **Administrative / Internal**
|Method|Endpoint|Description| Notes |
|------|--------|------------|----|
GET| / | Server check | Returns "The server is running" |
DELETE | /db | Reset and recreate the database| development


### **Authentication & Profile**
|Method|Endpoint|Description| Notes |
|------|--------|------------|------|
POST| /login | Authenticate user, start session| see Authentication details for request body |
DELETE | /logout | End user session |  |
POST | /createuser | Create new user account | see Authentication details |
GET | /profile | Retrieve logged-in user profile |  |
PATCH | /profile | Update logged-in user profile | see Authentication details |
DELETE | /profile | Delete user profile (admin) |  |
POST | /requestPassword | Request forgotten password reset | see Authentication details |
POST | /resetPassword | Reset forgotten password | see Authentication details |

<details><summary> Authentication Details</summary>

Post    /login
```json
{
    "Email": "peter.admin@example.com",
    "Password": "hashed_pw_6"
}
```
POST    /createuser
```json
{
    "Email": "kat_tastic@meowdy.com",
    "Password": "pass321",
    "Firstname": "Joy",
    "Lastname": "Full",
    "Phonenumber": "079 993 32 23",
    "Address": "Beowolfvägen 47, 217 54 Epic"
}
```
PATCH    /profile
```json
{
    "email": "hello@example.com",
    "firstname": "Peter",
    "lastname": "Berg",
    "phonenumber": "+46-70-6666666",
    "address": "Vasagatan 15, 111 20 Malmö",
    "shareInfoConsent": true,
    "requestInfoDelete": false
    "currentPass": "hashed_pw_6", 
    "newPass": "pass6",
}
```
POST    /requestPassword
```json
{
    "Email": "hello@example.com"
}
```
POST    /resetPassword

See database to retrieve GUID from the user's "email"
```json
{
    "newPass": "pass321",
    "guid": "83275044-580b-4372-982b-62e861acaacc"
}
```

</details>


### **Travel Packages & Booking**
|Method|Endpoint|Description|Notes|
|------|--------|------------|--------|
POST| /booking | Create a custom travel booking | See Travel Details for request body|
POST| /package | Book a predefined travel package | See Travel Details|
PATCH | /CancelTP | Cancel a travel package booking | Required query string `?bookingid=5` |
PATCH | /RebookTP | Rebook a canceled travel package | Required query string `?bookingid=5`|
GET | /myoldpackages | View previously booked travel packages | |
GET | /tplist | List available travel packages | |

<details><summary> Travel Details</summary>

Post    /booking
```json
{ 
    "travelpackageid": 2,
    "hotellist": [ 
        { 
            "fk_room_id": 2, "date_start": "2025-07-01", "date_end": "2025-07-05" 
        } 
    ] 
}
```
Post    /package
```json
{ 
    "travelpackageid": 1,
    "start": "2025-07-01",
    "end": "2025-07-10",
    "hotellist": [ { "fk_room_id": 1, "date_start": "2025-07-01", "date_end": "2025-07-05" } ]
}
```
Patch    /CancelTP

    Query string parameter: `http://localhost:5143/CancelTP?bookingid=5` 

Patch    /RebookTP

    Query string parameter: `http://localhost:5143/RebookTP?bookingid=5`
    Known issue: method calls for an invalid enum value "Rebooked"

</details>

### **Accommodations & Availability**
|Method|Endpoint|Description| Notes |
|------|--------|------------|----|
POST| /rooms/availability | Search for available hotel rooms| See Accommodations Details for request body |
GET| /hotels | List hotels (concies details)|
GET | /hotel | Get detailed hotel information with country |
GET | /fhotel | Get detailed hotel information with position|
GET | /hotelAmenity | List available hotel amenities|
GET | /hotelPrice| Retrieve hotel pricing information|

<details><summary>Accommodations Details </summary>

POST  /rooms/availability
```json
{
    "StartDate": "2025-12-11T12:00:00",
    "EndDate": "2025-11-11T12:00:00",
    "MinRooms": 2
}
```
</details>

### **Activities**
|Method|Endpoint|Description| Notes|
|------|--------|------------|-----|
GET| /activities/{country} | List activities by country
GET| /activity{id} | Retrieve activity details


### **Ratings** 
|Method|Endpoint|Description| Notes|
|------|--------|------------|----|
PUT| /rating | Submit an accommodation, transport, activity or package rating| See Rating Details for request body | |

<details><summary>Ratings Details </summary>

PUT  /rating
```json
{
    "starRating": 3,
    "description": "Fast and maybe furious",
    "ratingType": "Transportation",
    "bookingID": 2
}
```
</details>

## Authentication

Authentication is session based. After successful login, the user ID is stored in the session and used for subsequent responses.

## Project Scope

This project is intended for educational purposes. Error handling and security are simplified. In a production environment, the connection string would be moved to configuration files or environment variables.

## Development Process

The project was developed using an Agile approach. Group members first developed users stories which were prioritized from a product owner's perspective by our instructor. Requirements were then defined as a backlog and implemented iteratively. Core function was prioritized while additional features were planned but not fully implemented within the project timeframe. Task tracking was managed using Projects via Github. The Kanban board can be accessed [here](https://github.com/users/hkmp1303/projects/4/views/1).

## Agile Artifacts

As part of the Agile development process, the project includes the following artifacts:
- User storeies defining core system requirements
- Gherkin scenarios describing acceptance criteria
- Wireframe illustrating the planned user interface

These artifacts were developed in miro and are available in the [docs/agile](docs/agile) directory. User stories are available in the Github Projects Kanban. The original miro board can be viewed [here](https://miro.com/app/live-embed/uXjVJka1AT0=/?embedMode=view_only_without_ui&moveToViewport=-914%2C-2408%2C12245%2C6335&embedId=653186413912).

## Authors
This project was developed as a group asssignment.

- Timoty Bengtsson
- Pedram Basim
- Oscar Kock
- Heather Payne
- Mikael Renberg


README authored by: Heather Payne

