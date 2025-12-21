Feature: Search

Scenario: Successful page transition to search page:
    Given I successfully logged into my account
    When I click on the search button
    Then I am directed to the search page where I see search options

Background: Successful searches
    I am on the search page.

    Scenario: Successful destination search
        Given I enter a destination into the destination field
        And all other feilds are blank
        When I click the search button
        Then I am redirected to the search results page where I see accommodations, nearby attractions and local transportation options

    Scenario: Successful attractions search
        Given an attraction is in the attraction field
        And all other feilds are blank
        When I click the search button
        Then I am directed to the search results page where I see accommodations, nearby attractions and local transportation options

    Scenario: Successful departure date search
        Given a date is in the departure field
        And all other feilds are blank
        When I click the search button
        Then I am directed to the search results page where I see accommodations, nearby attractions and local transportation options

    Scenario: Successful date range search
        Given a date is in the departure field
        And a later date is in the return data feild
        And all other feilds are blank
        When I click the search button
        Then I am directed to the search results page where I see accommodations, nearby attractions and local transportation options

    Scenario: Successful destination search with departure date
        Given a destination is in the destination field
        And a date is in the departure date field
        When I click the search button
        Then I am directed to the search results page where I see accommodations, nearby attractions and local transportation options

Background: Unsuccessful searches
    I am on the search page.

    Scenario: Unsucessful date range search
        Given a date is in the departure date field
        And an ealier date is in the return date field
        When I click the search button
        Then I see an error message telling me the date range is invalid

Background: Search of travel packages
    I am on the logged in page.

    Scenario: Successful selection of a featured travel package
        Given I see featured travel packages
        When I click on a featured travel package
        Then I am directed to the package description page where I see the corresponding hotel, activities and local transportation options for that specific package

    Scenario: Successful return to the logged in page
        Given I am on the package description page
        When I click on the back button
        Then I am directed to the logged in page where I see featured packages

    Scenario: Successful selection of package to buy:
        Given I am on the package description page
        When I click on the buy button
        Then I am directed to the checked out page where I see cost breakdown and pay button


