Feature: Import ct api

  Scenario: #1 Import Trial with NCT ID: NCT02512757 to verify Lead Org Trial ID
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Lead Org Trial ID
      | clinical Trial field | CTRP fields       |
      | org_study_id         | Lead Org Trial ID |

  Scenario: #2 Import Trial with NCT ID: NCT02512757 to verify Secondary ID
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Secondary  ID
      | clinical Trial field | CTRP fields |
      | secondary_id         | Other ID    |

  Scenario: #3 Import Trial with NCT ID: NCT02512757 to verify NCT ID
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the NCT ID
      | clinical Trial field | CTRP fields |
      | nct_id               | NCT ID      |

  Scenario: #4 Import Trial with NCT ID: NCT02512757 to verify brief title
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Brief Title
      | clinical Trial field | CTRP fields |
      | brief_title          | brief title |

  Scenario: #5 Import Trial with NCT ID: NCT02512757 to verify official Title
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Official Title
      | clinical Trial field | CTRP fields    |
      | official_title       | official title |

  Scenario: #6 Import Trial with NCT ID: NCT02512757 to verify official title if official title is empty in clinical trials.gov
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Official title
      | clinical Trial field | CTRP fields    |  |
      | brief_title          | official title |  |

  Scenario: #7 Import Trial with NCT ID: NCT02512757 to verify acronym
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the acronym
      | clinical Trial field | CTRP fields |
      | acronym              | acronym     |

  Scenario: #8 Import Trial with NCT ID: NCT02512757 to verify Lead Organization
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Lead Org Trial ID
      | clinical Trial field | CTRP fields       |
      | lead_sponsor.agency  | Lead Organization |


  Scenario: #9 Import Trial with NCT ID: NCT02512757 to verify sponsor
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the sponsor
      | clinical Trial field | CTRP fields |
      | lead_sponsor.agency  | sponsor     |

  Scenario: #10 Import Trial with NCT ID: NCT02512757 to verify collaborator
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the collaborator
      | clinical Trial field | CTRP fields  |
      | collaborator.agency  | collaborator |
    And I want to verify the collaborator Functional Code should be “Laboratory” by default


      | lead_sponsor.agency     | if Org does not exist then Org should be created and RO should also be populated for Sponsor                                                     |                                                       |
      | collaborator.agency     | if Org does not exist then Org should be created and RO should also be populated. Collaborator Functional Code should be “Laboratory” by default |                                                       |
      | oversight_info. has_dmc | Data Monitoring Committee Appointed Indicator                                                                                                    | # This has more items see the new excel FDAAA changes |
      | brief_summary           | brief_summary                                                                                                                                    |                                                       |
      | detailed_description    | Detailed Description                                                                                                                             |                                                       |
      | overall_status          | current Trial status                                                                                                                             | #each status has its own mapping                      |








  NCT03087201 - Secondary ID
    # select one  with empty official title