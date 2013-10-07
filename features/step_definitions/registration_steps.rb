

Given(/^I want to Sign up for the service$/) do
 	click_on "SIGN UP"
end

When(/^I update the registration form using "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |email, password, name, company, number|
	fill_in 'inputFirstName', :with => name
  	fill_in 'inputEmail', :with => email
  	fill_in 'inputPassword', :with => password
  	fill_in 'inputCompany', :with => company
  	fill_in 'inputNumber', :with => number
end

Then(/^I should see the following error message on the registration page "(.*?)"$/) do |error_message|
  	within(:css, "div.fixed400.center") do
  		expect(page).to have_content error_message
  	end
end

When(/^I am on the Registration page$/) do
	within(:css, "div.fixed400.center") do
  		expect(page).to have_content "Company Email Address"
  	end
end

When(/^I submit registration form with random data$/) do
  	fill_in 'inputFirstName', :with => Faker::Name.first_name
  	fill_in 'inputEmail', :with => Faker::Internet.email
  	password = Faker::Internet.password
  	puts password
  	fill_in 'inputPassword', :with => password
  	fill_in 'inputCompany', :with => Faker::Company.name
  	fill_in 'inputNumber', :with => Faker::Number.number(10)
end

When(/^I press sign up$/) do
	within(:css, "div.fixed400.center") do
		click_link('SIGN UP')
	end
end

Then(/^I am succesfully Registered for a free account$/) do
	while page.has_content?('SIGN UP')
		sleep 1
	end
	fail unless page.has_content? "To get started"
end

