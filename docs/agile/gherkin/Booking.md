# Booking

**Feature: Booking travel and packages**

Som användare vill jag kunna boka en resa med hotell och aktiviteter

så att jag kan planera hela min semester på ett ställe\.

**Background:**

Given I am logged in as a user

And I have selected a destination

**Scenario: Select travel days**

When I choose my departure date &quot;2025\-07\-10&quot;

And I choose my return date &quot;2025\-07\-15&quot;

Then my selected travel days should be saved

And I should see a summary showing &quot;2025\-07\-10 – 2025\-07\-15&quot;

**Scenario: Check hotel availability for selected days**

Given I have selected my travel days

And I am viewing a specific hotel profile

When I click on &quot;check availability&quot;

Then I should see if the hotel has available rooms for my selected dates

And if rooms are available I should see the available room types and prices

And if no rooms are available I should see a message saying &quot;No rooms available for your selected dates&quot;

**Scenario: Check activity availability for selected days**

Given I have selected my travel days

And I am viewing a specific activity

When I click on &quot;check availability&quot;

Then I should see which dates and times the activity is available during my travel period

And if there are no available times I should see a message saying &quot;This activity is not available on your selected dates&quot;

**Scenario: Create my own package \(hotel \+ activity\)**

Given I have selected my travel days

And I have added a hotel to my package

And I have added at least one activity to my package

When I open the &quot;my package&quot; summary

Then I should see the selected hotel

And I should see the selected activities

And I should see a total price for my package

**Scenario: Book a travel successfully**

Given I have selected my travel days

And I have a complete package with hotel and at least one activity

When I click on &quot;book travel&quot;

And I enter my traveller information

And I enter my payment details

And I click &quot;confirm booking&quot;

Then I should see a confirmation page

And I should see a message saying &quot;Your travel has been booked&quot;

And I should receive a booking reference number

**Scenario: Fail to book travel when package is incomplete**

Given I have selected my travel days

And I have not added a hotel or activity to my package

When I click on &quot;book travel&quot;

Then I should see a message saying &quot;Your package is incomplete&quot;

And the booking should not be completed

