Feature: Tests Datawarehouse

  @CTRP_DWH
  Scenario: CTRP_DWH_API01. Test Data warehouse should be successful
    Given I know Datawarehouse build
    Then Build should be successful
