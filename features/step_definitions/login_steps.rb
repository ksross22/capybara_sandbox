Given(/^I am at the Main page$/) do
  visit '/'
  expect(page).to have_content('The best way to hire programmers.')
end

Given(/^I click the Login button$/) do
  click_on 'LOGIN'
end

When(/^I enter the login using "(.*?)", "(.*?)"$/) do |email, password|
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
end

When(/^I press Login$/) do
  click_on 'login_action'
end

Then(/^I should see the following error message on the login dropdown "(.*?)"$/) do |error_message|
  expect(page).to have_content error_message
end

When(/^I enter valid login crudentials$/) do
  fill_in 'Email', :with => 'ksross22@gmail.com'
  fill_in 'Password', :with => 'g2yqqj1n5w'
end

Then(/^I am succesfully logged into my account$/) do
  expect(page).to have_content "Login Success"
end

Then(/^I am redirected to the dashboard$/) do
  expect(page).to have_content "All Tests"
end
