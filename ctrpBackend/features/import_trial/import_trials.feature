Feature: Importing trial from clinical trials.gov
# The following features can be tested after FDAAA changes have been implemented.

  @pa_high @FDAAA @CTRPMICRO-59 @REST
# NCTID from CT.gov : NCT03051646
Scenario: Importing trial into CTRP that is created in CT.gov after 01/18/2017
  Given I Import a trial that is created in CT.gov after 01/18/2017 with NCT ID "NCT03049878" through rest service
  Then new trial is created in CTRP


  @pa_high @FDAAA @CTRPMICRO-60 @REST
# NCTID from CT.gov : NCT02804620
Scenario: Importing trial into CTRP that is created in CT.gov prior to 01/18/2017
  Scenario: Importing trial into CTRP that is created in CT.gov after 01/18/2017
    Given I Import a trial that is created in CT.gov prior to 01/18/2017 with NCT ID "NCT03049878" through rest service
    Then new trial is created in CTRP

  @pa_high @FDAAA @CTRPMICRO-61 @REST
# Comparing the new FDAAA fields with GET service
Scenario: Comparing the FDAAA fields that are created in the Trial with GET service

