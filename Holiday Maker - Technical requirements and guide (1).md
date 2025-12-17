## Holiday Maker 

Hello and welcome to our dev-team! We've designed a simple software solution for a travel agency.
You, as a newcomer to our team, will be brought up to date on what you need to have installed and 
what you'll need to know to be able to run our current release version of our software.

#### prerequisites

The technical requirements needed to run our software is: 

* **Local MySQL Server** /DBeaver
* **A REST-API** -> Either Postman or Thunder Client
* **An IDE** of your choice, we worked in VSC and JetRider
* **GitBash** 
* **Our Git folder** -> Download our git project as a ZIP-file (*Main tab "Code" -> "Local" "Download ZIP"*)


#### Creating the database

Once you've setup and met the technical requirements, you can go ahead and 
* extract our ZIP-file to your desired location
* Enter the directory of the extracted ZIP-file  
* Right-click 
* Show more options 
* Open Git Bash here
* Enter the command "code ." without the qoutation marks (*this'll open up our code in your IDE*)
* Enter "data.ddl"
* Copy all the code 
* Enter your MySQL workbench and create new database using the query: "CREATE DATABASE holidaymaker;"
* Run the query ("**CTRL + SHIFT + ENTER**")
* Clear the query window, and paste in the table information from data.dll
* Run the Query
* Go back to your IDE, enter "data.sql"
* Copy all the code into your MySQL workbench or DBeaver
* Run the query

Congratulations! You've now created the database!

#### Running the server

Once you've created the database, you can go ahead and 
* Re-enter the directory of the extracted ZIP-file  
* Right-click 
* Show more options 
* Open Git Bash here
* Enter the command "dotnet run" without the qoutation marks

Congrats! You're now officially running a local server! 
*If you need to close the server, simply hit **LCTRL + C** on your keyboard to shut it down.*
*This will be necessary to enter new commands in GitBash.*


#### Making sure the database works

To make sure the that the database and REST-API is working properly, we'll have to run our ***DELETE*** query first
and then redo the steps to re-create and re-populate the database. It's an annoying process but it's only necessary 
to do it once. 

* Enter postman
* Select the "DELETE" function from the drop-down-menu on the left-hand side of the URL
* Enter **http://localhost:5143/db** into the URL and hit "Send"
if everything works, you should get a message saying "200 OK", go ahead and close the server using ***LCTRL + C*** in 
GitBash to close the server. 

Repopulate the server using the information from the "data.sql" file.

Incase you recieve an error upon running the DELETE function, make sure you've followed the steps correctly
in this readme and read the on-screen error prompt in postman.

#### Trying ***GET*** queries

We'll begin by running the simple queries first, namely the *GET* queries which don't require a log in.
These are the: */Hotels, /fhotel, /, /hotel, /HotelPrice, /activities/{country}, /activity{id}* and */hotelAmenity*
queries. 

* To run these, simply select "GET" in Postman from the drop-down-menu on the left-hand-side of the URL
* type in the correct address: http://localhost:5143
* enter the query you'd like to try and hit "Send"
*The queries are capital-sensitive, keep that in mind!*

As an example, let's find the cheapest hotel room available, to do this we'll need to run the "HotelPrice" query.
Our Postman URL would look like this http://localhost:5143/HotelPrice

The next three Get-queries require the end-user to first login using Postman. You can find the login credentials
stored within the data.sql file under the *User-Section* beginning on line 12. 

We'll use user number 4, "David". Start by entering Postman, select **Post** from the drop-down-menu on the left-hand-side
of the URL bar. Enter our server URL, namely *http://localhost:5143* followed by the login command, */login*. 
The final URL should look as such: *http://localhost:5143/login*

Before hitting **Send**, click on the *Body* tab underneath the URL bar, paste the following JSON-code: 

*{*
    *"email":"david.kund@example.com",*
    *"password":"hashed_pw_4"*
*}*

You can, at this point, hit **Send** and you should recieve a "200 OK" confirming that it worked. If you've recieved an 
error, please make sure you've followed the steps correctly and if the error persists, follow the on-screen instructions.

Below the where you just entered the login credentials, click on the section namned "Cookies". Copy the string from 
"value" and open up a new tab in Postman, select "Header", in the "Key-drop-down-menu", select "Cookie" and paste the 
previously copied string into the "Value" tab. ***Note: This might be auto-completed by postman itself in which case***
***you won't need to complete this said if that's case!***

You are now ready to enter the remaining three GET-commands, namely */tplist, /profile, /myoldpackages*.

#### Trying ***Patch*** queries

Since we've already gone through a Delete-query interms of /db, a Post-query interms of /login and most of the Get-Queries,
we'll now hit the last query-group known as *"Patch"*.

We'll be sticking with our example-user "David" with a user_id of 4.

A patch-query in Postman simply updates information without destroying previous infromation. An example of this is one 
our "/CancelTP" query, it changes the status of an user booking from "active" to "canceled" without deleting the history
of said booking. 

In order to run this Patch-query, you'll need to: 

* Login with a user *(follow the steps above for logging in)*
* Enter a new tab in Postman
* Select **Patch** from the left-hand-side drop-down-menu
* Enter our server into the URL *"http://localhost:5143"*
* Enter the following in the URL after entering the server-info: CancelTP?bookingid=5

CancelTP and RebookTP are URL queries and are **not** to be ran inside of the Postman body.
* CancelTP calls upon the query
* The question mark (?) selects the booking ID 
* The booking ID "5" is connected to our example-user David through a foreignkey

If you've done everything correctly, you should see another "200 OK" pop up. If not, re-read the instructions and
follow the error codes on-screen to troubleshoot. 

Good luck!


#### Summary

A quick guide on how to use our software, enjoy and we're excited to have you on our team! 

Love, Giga Sigma :DD

***Group 4***