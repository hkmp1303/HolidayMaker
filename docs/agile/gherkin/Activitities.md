# Activitities

**Feature: Activities**

**Background:**<br>Given I have searched for activities<br>And I have clicked on an activity from the result list

**Scenario: Activity details view**<br>When I have clicked on the activity details tab<br>Then I should see the activity name<br>And I should see the activity description<br>And I should see the location of the activity<br>And I should see the price per person<br>And I should see the average rating score \(if any\)<br>And I should see a list of available dates and times

**Scenario: Activity rating \- see ratings**<br>Given the activity has received reviews from previous guests<br>When I click on the activity rating<br>Then I should be able to see the average rating score<br>And I should see a list of reviews<br>And I should see the comments they have left

**Scenario: Activity rating \- see ratings, but there is none**<br>Given the activity has not received any reviews from previous guests<br>When I click on the activity rating<br>Then I should see a message saying &quot;No reviews yet&quot;<br>And the review list should be empty

**Scenario: Activity rating \- successful review**<br>Given I have clicked on &quot;leave a review&quot; for the activity<br>When I have selected a rating<br>And I have left a comment<br>And I have clicked &quot;submit review&quot;<br>Then I should get a message saying &quot;Thank you for leaving a review&quot;<br>And my review should be visible in the review list<br>And the average rating score should be updated

**Scenario: Activity rating \- successful review without comment**<br>Given I have clicked on &quot;leave a review&quot; for the activity<br>When I have selected a rating<br>And I have not left a comment<br>And I have clicked &quot;submit review&quot;<br>Then I should get a message saying &quot;Thank you for leaving a review&quot;<br>And my review \(rating\) should be visible in the review list

**Scenario: Activity rating \- fail review**<br>Given I have clicked on &quot;leave a review&quot; for the activity<br>When I have not selected a rating<br>And I have not left a comment<br>And I have clicked &quot;submit review&quot;<br>Then I should get a message saying &quot;You have not filled in the review form&quot;<br>And my review should not be added to the list

