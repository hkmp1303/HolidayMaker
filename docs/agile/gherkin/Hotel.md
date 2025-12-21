# Hotel

Background:

Given I have searched for hotels

and the I have clicked on a profile from the result list

**Scenario Hotel details view:**

When I have clicked on the hotels details tab

Then I should see the hotel description

And I should see a list of offered amenities     

And I should see the price per night

**Scenario Hotel rating \-  see ratings:**

Given the hotel has received reviews from previous guests

When I click on the hotels rating

Then I should be able to see the average rating score<br>and the comments they have left 

**Scenario Hotel rating \-  see ratings, but there is none:**

Given the hotel not received any reviews from previous guests

When I click on the hotels rating

Then I should see a message saying &quot;No reviews yet&quot;

and the list should be empty

**Scenario Hotel rating \-  successful review:**

Given I have clicked on leave a review

when I have selected a rating 

and left a comment

and clicked summit review

then I should get a message saying &quot;Thank you for leave a review&quot;

and my review should be visible on the review list

**Scenario Hotel rating \-  successful review without comment:**

Given I have clicked on leave a review

when I have selected a rating

and I have not left a comment

and clicked summit review

then I should get a message saying &quot;Thank you for leave a review&quot;

and my review should be visible on the review list

**Scenario Hotel rating \-  fail review:**

Given I have clicked on leave a review

when I have not selected a rating

and not left a comment

and clicked summit review

then I should get a message saying &quot;You have not filled in the review form&quot;

and my review should not be added to the list\.

