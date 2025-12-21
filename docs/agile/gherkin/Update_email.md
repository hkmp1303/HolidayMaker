# Update email

Feature update email

background:

Given I&#39;m a logged in user

and I&#39;m on the account page

and I&#39;ve click the edit email button

**scenario: successfully update email**

Given I have entered a new valid email in the &quot;new email field&quot;

and I have entered my current valid email in the &quot;current email field&quot;

and I have entered my valid password in the &quot;password&quot;

When I click the &quot;update email&quot; button

Then I should get a message saying &quot;your email has been updated&quot;

and I should be able to login with my new email

**scenario: invalid current email:**

Given I have entered a new valid email in the &quot;new email field&quot;

and I have entered a invalid email in the &quot;current email field&quot;

and I have entered my valid password in the &quot;password&quot;

When I click the &quot;update email&quot; button

Then I should get a message saying &quot;you have entered an invalid email&quot;

and I should be able to login with my old current email

**scenario: invalid new email:**

Given I have entered a new invalid email in the &quot;new email field&quot;

and I have entered my current valid email in the &quot;current email field&quot;

and I have entered my valid password in the &quot;password&quot;

When I click the &quot;update email&quot; button

Then I should get a message saying &quot;you have entered an invalid email&quot;

and I should be able to login with my old current email

**scenario: invalid password**

Given I have entered a new valid email in the &quot;new email field&quot;

and I have entered my current valid email in the &quot;current email field&quot;

and I have entered an invalid password in the &quot;password&quot;

When I click the &quot;update email&quot; button

Then I should get a message saying &quot;you have entered an invalid password&quot;

and I should be able to login with my old current email

**scenario: empty email field**

Given I have left &quot;new email field&quot; empty

and I have entered my current valid email in the &quot;current email field&quot;

and I have entered my valid password in the &quot;password&quot;

When I click the &quot;update email&quot; button

Then I should get a message saying &quot;you must entered an invalid email&quot;

and I should be able to login with my old current email

\(tldr: same goes for empty current email and password fields\)

