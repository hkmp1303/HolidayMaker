# Filter \- Check availability

Background:

Given that I&#39;m logged in as a valid user

I&#39;m creating my own package

I&#39;m looking at hotels

## Scenario: Filtering hotels based on availability

Given that I&#39;m looking at hotels

And I decide to choose by dates

Then I click the calendar on the left\-hand\-side

And the drop\-down menu drops down

Then I select the dates I&#39;d like to book the hotel for

And I see the available options listed

## Scenario: Filtering hotels based on availability \- no available hotels

Given that I&#39;m looking at hotels

And I decide to choose by dates

Then I click the calendar on the left\-hand\-side

And the drop\-down menu drops down

Then I select the dates I&#39;d like to book the hotel for

And there aren&#39;t any available hotels for my dates selected

Then it shows &quot;no available hotels for your timeslot :\(&quot;

## Scenario: Filtering hotels \- including unavailable 

Given that I&#39;m looking at hotels

And I decide to choose by available dates

Then I click the calendar on the left\-hand\-side

And the drop\-down menu drops down

Then I select the dates I&#39;d like to book the hotel for

And I see the available options listed

Then I uncheck the option &quot;Show only available hotels&quot; to get more options for the future

