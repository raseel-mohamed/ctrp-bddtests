@login_test
Feature: pa_login
	@PA_HIGH @PA_LOGIN
	Scenario: Valid_pa_login
		Given I am in the PA home page
		And I am able to login to the system with valid user credentials
		And I wait for 2 sec
		#Then I close browser

	@PA_HIGH @PA_LOGIN
	Scenario: Valid_pa_login test
		Given I am in the PA home page
		And I am able to login to the system with valid user credentials
		And I wait for 2 sec
  	#Then I close browser
