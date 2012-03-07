Given /^I am in New page$/ do
  visit '/paypals/new'
end
Then /^I should see "([^"]*)" button/ do |name|
  find_button(name)
end
When /^I select "([^"]*)" 	from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end