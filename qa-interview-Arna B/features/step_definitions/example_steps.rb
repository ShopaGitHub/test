Given(/^I am on the homepage$/) do
  find('h1', :text => "Welcome to MyRapName.com")
end

Then(/^I see the text "(.*?)"$/) do |text|
  page.has_text?(text)
end

Then(/^Input field for First Name exists$/) do
  page.has_xpath?('.//input[@name=\'firstname\']')
end

Then(/^Input field for Last Initial exists$/) do
  page.has_xpath?('.//input[@name=\'lastinitial\']')
end

When(/^I enter "(.*?)" in First Name field$/) do |firstName|
  fill_in('firstname', with: firstName)
end

When(/^I click on (.*?) button$/) do |buttonToClick|
  click_button(buttonToClick)
end

Then(/^"(.*?)" error message displays$/) do |error|
  page.has_text?(error)
end

Then(/^Rap name displays for "(.*?)"$/) do |firstName|
  page.has_text?("Your rap name is:                                ")
  page.has_xpath?('.//h1[contains(text(),' + firstName + ')]')
end

When(/^I "(.*?)" Use nickname checkbox$/) do |selectOrNot|
  shorten = shorten
  if selectOrNot == "select"
    check(shorten)
  else
    uncheck(shorten)
  end
end

When(/^I enter "(.*?)" in Last Initial field$/) do |lastInitial|
  fill_in('lastinitial', with: lastInitial)
end