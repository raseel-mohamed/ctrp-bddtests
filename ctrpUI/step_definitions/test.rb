When(/^I open automationpractice website$/) do
  @browser.goto "http://automationpractice.com"
end

Then(/^I click sign in$/) do
  @home_page  = AutomationHomePage.new
  @home_page.sign_in.click
end

And(/^sign in to the application$/) do
  @signin_page = SignInPage.new
  @signin_page.username.set "blah"
end

And(/^verify phone number$/) do
  @home_page  = AutomationHomePage.new
  expect(@home_page.phone.text).to eql("01234567")
end

Then(/^I click contact us$/) do
  @home_page  = AutomationHomePage.new
  @home_page.contact_us.click
end

And(/^complete the contact us form$/) do
  @contactus_page = ContactUsPage.new
  @contactus_page.heading.set "blah"
  @contactus_page.message.set "blah"
end