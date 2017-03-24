Feature: Import ct api

  Scenario: #1 Import Trial with NCT ID: NCT02512757 to verify Lead Org Trial ID
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Lead Org Trial ID
      | clinical Trial field | CTRP fields       |
      | org_study_id         | Lead Org Trial ID |

  Scenario: #2 Import Trial with NCT ID: NCT03087201 to verify Secondary ID
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
      | clinical Trial field | CTRP fields    |
      | brief_title          | official title |

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
    And I want to verify RO role is populated with this sponsor

  Scenario: #10 Import Trial with NCT ID: NCT02512757 to verify collaborator
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the collaborator
      | clinical Trial field | CTRP fields  |
      | collaborator.agency  | collaborator |
    And I want to verify the collaborator Functional Code should be “Laboratory” by default

  Scenario: #11 Import Trial with NCT ID: NCT02512757 to verify Data Monitoring Committee Appointed Indicator
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Data Monitoring Committee Appointed Indicator
      | clinical Trial field   | CTRP fields                                   |
      | oversight_info.has_dmc | Data Monitoring Committee Appointed Indicator |


  Scenario: #12 Import Trial with NCT ID: NCT03087760 to verify FDA-regulated Drug Product
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA-regulated Drug Product
      | clinical Trial field                 | CTRP fields                |
      | oversight_info.is_fda_regulated_drug | FDA-regulated Drug Product |


  Scenario: #13 Import Trial with NCT ID: NCT03087760 to verify FDA-regulated Device Product
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA-regulated Device Product
      | clinical Trial field                   | CTRP fields                  |
      | oversight_info.is_fda_regulated_device | FDA-regulated Device Product |


  Scenario: #14 Import Trial with NCT ID: NCT03087760 to verify FDA Approval or Clearance
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA Approval or Clearance
      | clinical Trial field                | CTRP fields               |
      | oversight_info.is_unapproved_device | FDA Approval or Clearance |


  Scenario: #15 Import Trial with NCT ID: NCT03087760 to verify Product Exported from the U.S
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the Product Exported from the U.S
      | clinical Trial field        | CTRP fields                   |
      | oversight_info.is_us_export | Product Exported from the U.S |

  Scenario: #16 Import Trial with NCT ID: NCT02512757 to verify Brief Summary
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the brief summary
      | clinical Trial field | CTRP fields   |
      | brief_summary        | brief_summary |

  Scenario: #17 Import Trial with NCT ID: NCT02512757 to verify Detailed description
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the brief summary
      | clinical Trial field | CTRP fields          |
      | detailed_description | Detailed Description |


  Scenario: #18 Import Trial with NCT ID: NCT03088930 to verify Clinical Trial status: Not yet recruiting
    Given I want to Import a trial with NCT ID NCT03088930
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Not yet recruiting    | In Review         |

  Scenario: #19 Import Trial with NCT ID: NCT02969174 to verify Clinical Trial status: Approved for marketing
    Given I want to Import a trial with NCT ID NCT02969174
    Then I want to verify the Trial status
      | clinical Trial status  | CTRP Trial status |
      | Approved for marketing | Approved          |

  Scenario: #20 Import Trial with NCT ID: NCT03086395 to verify Clinical Trial status: Withdrawn
    Given I want to Import a trial with NCT ID NCT03086395
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Withdrawn             | Withdrawn         |

  Scenario: #21 Import Trial with NCT ID: NCT03079687 to verify Clinical Trial status: Available
    Given I want to Import a trial with NCT ID NCT03079687
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Available             | Active            |

  Scenario: #22 Import Trial with NCT ID: NCT03088904 to verify Clinical Trial status: Recruiting
    Given I want to Import a trial with NCT ID NCT03088904
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Recruiting            | Active            |

  Scenario: #23 Import Trial with NCT ID: NCT03087812 to verify Clinical Trial status: Enrolling by invitation
    Given I want to Import a trial with NCT ID NCT03087812
    Then I want to verify the Trial status
      | clinical Trial status   | CTRP Trial status       |
      | Enrolling by invitation | Enrolling by invitation |

  Scenario: #24 Import Trial with NCT ID: NCT03088449 to verify Clinical Trial status: Active, not recruiting
    Given I want to Import a trial with NCT ID NCT03088449
    Then I want to verify the Trial status
      | clinical Trial status  | CTRP Trial status |
      | Active, not recruiting | Closed to Accrual |

  Scenario: #25 Import Trial with NCT ID: NCT03085186 to verify Clinical Trial status: No longer available
    Given I want to Import a trial with NCT ID NCT03085186
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status                  |
      | No longer available   | Closed to Accrual and Intervention |

  Scenario: #26 Import Trial with NCT ID: NCT03057418 to verify Clinical Trial status: Suspended
    Given I want to Import a trial with NCT ID NCT03057418
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status                              |
      | Suspended             | Temporarily Closed to Accrual and Intervention |

  Scenario: #27 Import Trial with NCT ID: NCT03088891 to verify Clinical Trial status: Completed
    Given I want to Import a trial with NCT ID NCT03088891
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Completed             | Complete          |

  Scenario: #28 Import Trial with NCT ID: NCT03072901 to verify Clinical Trial status: Terminated
    Given I want to Import a trial with NCT ID NCT03072901
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status         |
      | Terminated            | Administratively Complete |

  Scenario: #29 Import Trial with NCT ID: NCT03063710 to verify Clinical Trial status: Temporarily not available
    Given I want to Import a trial with NCT ID NCT03063710
    Then I want to verify the Trial status
      | clinical Trial status     | CTRP Trial status                              |
      | Temporarily not available | Temporarily Closed to Accrual and Intervention |

