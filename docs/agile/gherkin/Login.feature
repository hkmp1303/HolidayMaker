Feature: Login

Scenario: Successful navigation to the login page:

Background: I have opened the app

Given I am on the landing page
When I slide the arrow to the right
Then I am redirected to the login page

Scenario: Successful login:

Background: I am on the login page

Given I have entered a valid email address
And I have entered a valid password
When I click the login button
Then I am redirected to the logged in page

Scenario: Unsuccessful login with invalid email:

Background: I am on the login page

Given I have entered a valid password into the password field
And I entered an invalid email into the email field
When I click the login button
Then I should see an error message indicating invalid credentials

Scenario: Unsuccessful login with invalid password:

Background: I am on the login page

Given I have entered a valid email addresss into the password field
And I have entered an invalid email addresss into the email field
When I click the login button
Then I should see an error message indicating invalid credentials

Scenario: Unsuccessful login with blank email field:

Background: I am on the login page

Given I have entered a valid password into the password field
And I leave the email field blank
When I click the login button
Then I should see an error message indicating missing required fields

Scenario: Unsuccessful login with blank password field:

Background: I am on the login page

Given I have entered a valid email address into the email address field
And I leave the password field blank
When I click the login button
Then I should see an error message indicating missing required fields

