Feature: Gmail_login

	Scenario: Valid_gmail_login
		Given empty
		Given I navigate to "http://ctrp-pa-inttest-elb-330752222.us-east-1.elb.amazonaws.com:18080/pa/"
		And I enter "ctrpqatester1" into input field having id "j_username"
		And I enter "pass" into input field having id "j_password"
		When I click on element having id "loginLink"
		And I wait for 10 sec
		Then I close browser
