# Login to CTRP with NCI ID:
# param 1 : NCI_ID value
# param 2 : Optional parameter of type Hash
def login_to_ctrp_with_ncid(nci_id, login_data = {} )

  defaults = {
      :username => ENV['PA_USER_ID'],
      :password => ENV['PA_USER_PASS'],
      :module => ENV['PA_APP']
  }
  login = defaults.merge(login_data)
  puts login
  puts nci_id

  #step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I navigate to "#{login[:module]}"]
  #step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{login[:username]}" into input field having id "#{HomePagePA.username_id}"]
  #step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I enter "#{login[:password]}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  #step %[I enter "#{arg1}" into input field having id "#{SearchTrial.trial_search_text_id}"]
  step %[I enter "#{nci_id}" into input field having id "#{SearchTrial.trial_search_text_id}"]
  step %[I click on element having class "#{SearchTrial.trial_search_button_id}"]
  #step %[I click on link having text "#{arg1}"]
  step %[I click on link having text "#{nci_id}"]

  step %[I wait for 2 sec]
end

=begin
def login_to_ctrp_with_ncid(module_name, username, password, nci_id)
  #step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I navigate to "#{module_name}"]
  #step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{username}" into input field having id "#{HomePagePA.username_id}"]
  #step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I enter "#{password}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  #step %[I enter "#{arg1}" into input field having id "#{SearchTrial.trial_search_text_id}"]
  step %[I enter "#{nci_id}" into input field having id "#{SearchTrial.trial_search_text_id}"]
  step %[I click on element having class "#{SearchTrial.trial_search_button_id}"]
  #step %[I click on link having text "#{arg1}"]
  step %[I click on link having text "#{nci_id}"]

  step %[I wait for 2 sec]
end
=end