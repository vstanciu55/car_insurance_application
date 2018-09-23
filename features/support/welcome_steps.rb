When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the welcome page/) do
  expect(page).to have_content("Welcome to the Car Insurance Application\nTo start your application click the link below\nStart application for car insurance")
end