# Filter prices

**Feature: Filter prices for hotels**

Som användare vill jag kunna filtrera och sortera hotell baserat på pris

så att jag enkelt kan hitta alternativ som passar min budget\.

**Background:**

Given I am on the &quot;hotels&quot; search results page

And a list of available hotels is visible

**Scenario: Filter hotels within a selected price range**

Given no hotels cost over 1500 and under 500 kr

When I select the price range &quot;500–1500 kr per night&quot;

And I click on &quot;apply filter&quot;

Then I should only see hotels priced between &quot;500&quot; and &quot;1500&quot; kr

And hotels outside this range should be hidden

**Scenario: Clear price filter**

Given I have applied a price filter

When I click on &quot;clear price filter&quot;

Then I should see all available hotels again

And the price filter should be reset

**Scenario: Sort hotels from lowest to highest price**

When I select &quot;Sort by price: Low to High&quot;

Then the cheapest hotel should appear at the top of the list

And the most expensive should appear at the bottom

**Scenario: Sort hotels from highest to lowest price**

When I select &quot;Sort by price: High to Low&quot;

Then the most expensive hotel should appear first

And the cheapest should appear last

**Scenario: No hotels available in selected price range**

Given no hotels cost less than 50 kr 

When I select the price range &quot;10–50 kr per night&quot;

And I click on &quot;apply filter&quot;

Then I should see a message saying &quot;No hotels match your selected price range&quot;

And the results list should be empty

**Scenario: Trying to filter without selecting a price range**

When I click on &quot;apply filter&quot; without selecting any range

Then I should see a message saying &quot;Please select a price range&quot;

And no filter should be applied

