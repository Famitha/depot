Given /^I am in Orders New page$/ do
  visit '/orders/new'
end
Then /^I should see "([^"]*)" button/ do |name|
  find_button(name)
end
