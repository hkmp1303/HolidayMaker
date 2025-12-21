# Create Account

**Feature: Create account**\.

Background:

Given I&#39;m on the create account page

**scenario: successfully creating an account**

Given I&#39;m on the create account page<br>and I have filled out the create an account form

and I have set an unique email

and a valid password<br>When I click the create account button<br>Then my account will be created

and I should be taken to the start page

**scenario: duplicated email**

Given I have filled out the create account form

and my email is already taken

When I click create account button

Then I should get an error saying &quot;email already in use&quot;

and an account shouldn&#39;t be created

**scenario: not entering an email**

Given I have missed filling out an email

and I have entered a valid password

and I have filled out the rest of the create account form

When I click the create account button

Then I should get an error saying &quot;You must enter a valid email&quot;<br>and my account shouldn&#39;t be created

**scenario: not entering a password**

Given I have missed filling out a password

and I have entered a valid email

and I have filled out the rest of the form

When I click create account button

Then I should get an error saying &quot;You must enter a valid password&quot;

and my account shouldn&#39;t be created

**scenario: missing filling out form details:**

Given I have entered a valid email and password     

But I have left the personal information fields empty

When I click the create account button

Then I should get an error saying &quot;You must fill out everything in the form&quot;

and my account shouldn&#39;t be created

