# Feature: Creating Packages

### Background

Given I&#39;ve found hotels and experiences

 and want to create packages of my specific wants

## Scenario: Package with only hotel

Given I have selected and booked a hotel     

When I choose to add the hotel to my package     

And I press the &quot;Confirm&quot; button     

Then the hotel should be successfully added to my package     

And I should be redirected back to the search page

## Scenario: Package with multiple hotels

Given I&#39;ve added a hotel to my package

And I find another hotel

When I add it to the same package

Then I press the confirm button 

And it will be added to the same package

## Scenario: Package with one hotel &amp; one experience

Given I&#39;ve found an experience to add

When I add it to my package

Then I press the confirm button

And it will be added to my package

And I will be put back on the search page

## Scenario: Package with multiple hotels &amp; one experience

Given I&#39;ve decided to add it as a package

When I press the confirm button

Then it&#39;ll be added to my package

And I&#39;ll be put back on the search page

## Scenario: Package with mutliple hotels &amp; multiple experiences

Given I&#39;ve decided to add it as a package

When I press the confirm button

Then it&#39;ll be added to my package

And I&#39;ll be put back on the search page

