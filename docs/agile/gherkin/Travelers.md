# Travelers

**Feature: Select number of travelers**

Som användare vill jag kunna välja hur många personer resan ska bokas för<br>så att jag kan boka en resa för mig själv eller för flera personer\.

**Background:<br>**Given I am on the booking page<br>And I have selected my travel dates

**Scenario: Select number of travelers successfully**<br>When I choose &quot;number&quot; travelers from the travelers dropdown<br>Then the booking summary should show &quot;number travelers&quot;<br>And the total price should be updated accordingly

**Scenario: Missing traveler selection**<br>When I click on &quot;continue to payment&quot; without selecting number of travelers<br>Then I should see a message saying &quot;Please select number of travelers&quot;<br>And I should not be taken to the payment page

**Scenario: Invalid number of travelers \(zero\)**<br>When I choose &quot;0&quot; travelers<br>Then I should see an error message saying &quot;Number of travelers must be at least 1&quot;<br>And the selection should not be accepted

**Scenario: Too many travelers**

Given the maximum number of travelers allowed is &quot;10&quot;<br>When I try to select &quot;12&quot; travelers<br>Then I should see a message saying &quot;Maximum allowed travelers is 10&quot;<br>And the selection should not be accepted

**Scenario: Update total price after selecting travelers**

Given the price per travelers is &quot;1000 kr&quot;<br>When I select &quot;number for example 4&quot; travelers&#39;<br>Then the total price should be &quot;4000 kr&quot;

