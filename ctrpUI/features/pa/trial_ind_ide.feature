Feature: IND/IDE

  @pa_high @FDAAA @pa @CTRPMICRO-29
  Scenario: Verify the "Unknown" radio button is displayed in the IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    Then Availability of Expanded Access should display a dropdown "Yes" "No" and "Unknown"


  @pa_high @FDAAA @pa @CTRPMICRO-68
  Scenario: Verify the "Expanded Access Indicator:" has changed to "Availability of Expanded Access" in Trial IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    Then "Availability of Expanded Access" label is displayed

  @pa_high @FDAAA @pa @CTRPMICRO-234

  Scenario: Verify the "Expanded Access Indicator:" has changed to "Availability of Expanded Access" in Trial IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    Then Expanded Access Record label should not be displayed

  @pa_high @FDAAA @pa @CTRPMICRO-231
  Scenario: Verify the "Expanded Access Record" if  "Availability of Expanded Access" is Yes in Trial IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    When I select "Yes" for Availability of Expanded Access dropdown
    Then Expanded Access Record label should be displayed

  @pa_high @FDAAA @pa @CTRPMICRO-235
  Scenario: Verify the details filled are saved in IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    And I fill all details and click save in IND/IDE(PA) screen
    Then I verify confirm message "Message. Record Created." is displayed


  @pa_high @FDAAA @pa @CTRPMICRO-236
  Scenario Outline:To verify front end validations in IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    Then I verify validations for ind ide type "<ind_ide_type>",number "<number>",grantor "<grantor>",holder type "<holder_type>",error message "<error_message>"
   Examples:
     | ind_ide_type | number | grantor    | holder_type  | error_message                                        |
     |              | 2      | --Select-- | Investigator | IND/IDE Type must be Entered.Grantor must be Entered |
     | IDE          |        | CDRH       | Investigator | Number must be Entered                               |
     | IDE          | 2      | -Select-   | Investigator | Grantor must be Entered                              |
     | IDE          | 2      | CDRH       | -Select-     | Holder Type must be Entered                          |

  @pa_high @FDAAA @pa @CTRPMICRO-237
  Scenario:To verify All required field validations in IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    And I enter all details except mandatory fields in IND/IDE(PA) screen
    Then I verify below error messages are displayed in IND/IDE(PA) screen for mandatory fields
      | field_name                      | error_message                             |
      | IND/IDE_type                    | IND/IDE Type must be Entered              |
      | number                          | Number must be Entered                    |
      | grantor                         | Grantor must be Entered                   |
      | holder_type                     | Holder Type must be Entered               |

  @pa_high @FDAAA @pa @CTRPMICRO-244
  Scenario: Verify all the fields in the IND/IDE(PA) screen filled are saved for an imported trail
    Given I login into CTRP and search for an Imported trial with NCI ID "NCI-2017-01096"
    And I navigate to IND/IDE screen
    When I click on Add button
    And I fill all details and click save in IND/IDE(PA) screen
    Then I verify confirm message "Message. Record Created." is displayed
