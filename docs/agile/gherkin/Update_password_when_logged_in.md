# Update password when logged in

**Feature: Update password when logged in**

Background:

Given I&#39;m a logged in user

and I&#39;m on the Account page

**scenario: successfully change password**

Given I enter a new valid password in the new password field

and I enter my current valid password in the current password field

When I click the update password button

Then I should get a message saying &quot;Your password have been updated&quot;

and I should be able to login with my new valid password

**scenario: fail to update password with Invalid current password**

Given I enter a incorrect password in the current password field 

and I have entered a new valid password in the new password field

When I click the update password button

Then I should get a error saying &quot;Could not update password\. invalid current password&quot;

and i should be able to login with my old password

**scenario: fail to update password with empty current password field**

Given I have left the current password field empty

and I have entered a new valid password in the new password field

When I click the update password button

Then I should get a error saying &quot;Could not update password\. invalid current password&quot;

and i should be able to login with my old password

**scenario: fail to update password with empty new password field**

Given I have left the new password field empty

and I have entered a correct password in the current password field

When I click the update password button

Then I should get a error saying &quot;Could not update password\. invalid new password&quot;

and i should be able to login with my old password

