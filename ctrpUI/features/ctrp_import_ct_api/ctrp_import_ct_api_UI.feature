Feature: Import Trial from PA

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_01 Import Trial from PA
    Given I am logged in to PA
    And I want to Import the trial with NCT ID "NCT03093480"
    Then the import should be "Message. Trial NCT03093480 has been imported and registered in CTRP system successfully."


  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_02 Import Trial from Registry
    Given I am logged in to Registry
    And I want to Import the trial with NCT ID NCT03093480
    Then the import should be successful

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_03 Import Trial from PA - Update
    Given I am logged in to PA
    And I want to make an update to the Imported trial with NCT ID NCT03093480
    Then the update of an import should be successful

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_04 View log for Imported trials
    Given I am logged in to PA
    And I want to Import the trial with NCT ID NCT03093480
    Then I should be able to View the log of Imported Trial