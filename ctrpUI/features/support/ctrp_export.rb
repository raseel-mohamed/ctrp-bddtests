

Given(/^I click to view xml of "([^"]*)"$/) do |arg1|
  step %[I navigate to "#{ENV['REG_APP']}"]
  step %[I enter "#{ENV['REG_USER_ID']}" into input field having id "#{HomePageREG.username_id}"]
  step %[I enter "#{ENV['REG_USER_PASS']}" into input field having id "#{HomePageREG.password_id}"]
  step %[I click on element having id "#{HomePageREG.login_id}"]
  step %[I click on element having id "#{HomePageREG.accept_disclaimer_id}"]
  step %[I enter "#{arg1}" into input field having id "#{SearchTrialReg.trial_search_text_id}"]
  step %[I click on element having id "#{SearchTrialReg.trial_search_button_id}"]
  step %[I click on element having id "#{SearchTrialReg.trial_search_my_trial}"]
  # Remove columns for Action button to get visible
  $driver.find_element(:xpath, '//*[@id="row_wrapper"]/div[2]/button').click
  $driver.find_element(:xpath, '/html/body/ul[5]/li[2]').click
  $driver.find_element(:xpath, '/html/body/ul[5]/li[3]').click
  $driver.find_element(:xpath, '/html/body/ul[5]/li[4]').click
  $driver.find_element(:xpath, '/html/body/div[7]').click
  step %[I wait for 2 sec]
  $driver.find_element(:xpath, '//*[@id="row"]/tbody/tr/td[7]/div/button').click
  $driver.find_element(:xpath, '//*[@id="actmenu"]/li[5]/a').click
  step %[I switch to new window]
  @export_xml = $driver.page_source
  puts @export_xml
end

Then(/^the field "([^"]*)" should be there$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

