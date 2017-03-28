Feature: Test external dependency

  Scenario: #1 Grants selection through Registry
    Given I am logged in to Registry
    And I select to create a Trial
    And I select the Funding Mechanism as "P30"
    And I select the Institute code as "CA"
    And In the Serial number I typed in 14
    Then It should give the list of grants to select

  Scenario: #2 Grants selection through PA
    Given I am logged in to PA
    And I select a Trial
    And I select Trial Funding
    And I select the Funding Mechanism as "P30"
    And I select the Institute code as "CA"
    And In the Serial number I typed in 14
    Then It should give the list of grants to select

  Scenario: #3 Grants validation through PA
    Given I am logged in to Registry
    And I select a Trial
    And I select Trial Funding
    And I select the Funding Mechanism as "P30"
    And I select the Institute code as "CA"
    And In the Serial number I typed in 123456
    And I select the NCI Division/Program as "OD"
    And I click to Save
    Then In the Abstraction Validation, it should have a warning for incorrect Grant

  Scenario: #4 Grants validation through DW table
    Given I deleted some items from dw_grants_i2e table in DW db
    And let the job complete
    Then the items should be back in dw_grants_i2e table

  Scenario: #5 Clinical trials ftp for export
    Given I can run the command " " from UAT box with success


  Scenario: #6 EVS connection
    Given I can run the curl command "curl https://lexevs64cts2.nci.nih.gov/lexevscts2/codesystem/NCI_Thesaurus/entity" from UAT box with success
    And look at the log after the build job

  Scenario: #7 caDSR connection
    Given I deleted some items from planned_marker_sync table in PA db
    And let the job complete
    Then the items should be back in planned_marker_sync table

  Scenario: #8 caDSR connection from PA
    Given I am logged in to PA
    And I select a Trial
    And I select Markers
    And I do a search for a term "Brain" in caDSR
    Then it should list the result


