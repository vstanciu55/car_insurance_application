When(/^I go to the Customer's create form$/) do
  visit new_customer_path
end

Then(/^I should see a 'forename' field/) do
  expect(page).to have_field("Forename")
end