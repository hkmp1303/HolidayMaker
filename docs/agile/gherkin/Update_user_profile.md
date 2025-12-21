# Update user profile

**feature: user profile**

background:

Given I&#39;m a logged in user

and I&#39;m on the account page

**scenario: successfully update name**<br>Given I have entered a new name in the name field

When I click &quot;update profile&quot; button

Then I should get a message saying &quot;profile updated&quot; 

and my name should be updated

**scenario: failed updated name**

Given I have left the name field empty

When I click the &quot;update profile&quot; button

then I should get a message saying &quot;not able to update profile&quot;

and my old name should remain the same

**scenario: successfully update phone number**<br>Given I have entered a new valid phone number in the phone number field

When I click &quot;update profile&quot; button

Then I should get a message saying &quot;profile updated&quot;

and my phone number should be updated

**scenario: failed updated phone number \- empty field**

Given I have left the phone number field empty

When I click the &quot;update profile&quot; button

then I should get a message saying &quot;not able to update profile&quot;

and my old phone number should remain the same

**scenario: failed updated phone number \- invalid** 

Given I have entered an invalid phone number in the the phone number field

When I click the &quot;update profile&quot; button

then I should get a message saying &quot;not able to update profile&quot;

and my old phone number should remain the same

**scenario: successfully update address**<br>Given I have entered a new  in valid address in the address field

When I click &quot;update profile&quot; button

Then I should get a message saying &quot;profile updated&quot;

and my address should be updated

**scenario: failed updated address \- empty**

Given I have left the address field empty

When I click the &quot;update profile&quot; button

then I should get a message saying &quot;not able to update profile&quot;

and my old address should remain the same

**scenario: failed updated address \- invalid**

Given I enter an invalid address in the address field empty

When I click the &quot;update profile&quot; button

then I should get a message saying &quot;not able to update profile&quot;

and my old address should remain the same

