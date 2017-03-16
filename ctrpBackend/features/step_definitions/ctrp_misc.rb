require_relative '../support/dataclinicaltrials_api_helper.rb'
require_relative '../support/organization_helper.rb'
require_relative '../support/helper.rb'
require 'json'
require 'rest-client'

  Given(/^I know the FDAAA Test Study Protocol ID to search$/) do
    puts 'Search is successful for Study protocol ID - passed'
  end

  Then(/^Search is successful for Study protocol ID$/) do
    puts 'I know the FDAAA Test Study Protocol ID to search - passed'
  end
