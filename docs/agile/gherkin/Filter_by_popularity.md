# Filter by popularity

Background: 

Given that I&#39;m logged in as a valid user

I&#39;m creating my own package

I&#39;m looking at hotels

## Scenario: Filtering hotels High\-to\-low

Given that I&#39;m looking at available hotels

And I decide to choose by popularity

Then I click the drop down menu &quot;Filter By&quot;

And the drop\-down menu drops down

Then I select the option &quot;popularity high\-to\-low&quot;

And I see the available options listed from most popular to least popular

## Scenario: Filtering hotels Low\-to\-high

Given that I&#39;m looking at available hotels

And I decide to choose by popularity

Then I click the drop down menu &quot;Filter By&quot;

And the drop\-down menu drops down

Then I select the option &quot;popularity low\-to\-high&quot;

And I see the available options listed from least popular to most popular 

