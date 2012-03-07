Feature: NewPage

Scenario: To verify the fileds of New page
Given I am in New page
Then I should see "Type of Card*"
Then I should see "Card no" 
Then I should see "Card verification"
Then I should see "Expiry year"
Then I should see "Expiry month"
Then I should see "Fname"
Then I should see "Lname"


Scenario:To validate the fileds of New page
Given I am in New page
Then I fill in "Card no" with ""
Then I fill in "Card verification" with ""
Then I fill in "Expiry year" with ""
Then I fill in "Expiry month" with ""
Then I fill in "Fname" with ""
Then I fill in "Lname" with ""
When I press "Create Paypal"
Then I should see "Transaction failure!"


Scenario:To validate the fileds of New page
Given I am in New page
Then I fill in "Card no" with "4785636150538332"
Then I fill in "Card verification" with "123"
Then I fill in "Expiry year" with "2012"
Then I fill in "Expiry month" with "4"
Then I fill in "Fname" with "fami"
Then I fill in "Lname" with "sheik"
When I press "Create Paypal"
Then I should see "Transaction failure!"


Scenario:To validate the card_type select box  of New page
Given I am in New page
When I select "visa" from "Type of Card*"
When I press "Create Paypal"