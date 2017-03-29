Feature: Import ct api

  @test
  Scenario: CT_API01. Import Trial with NCT ID: NCT03093480 to verify Lead Org Trial ID
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Lead Org Trial ID
      | clinical Trial field | CTRP fields       |
      | org_study_id         | Lead Org Trial ID |

  @ct_api
  Scenario: CT_API01. test Import Trial with NCT ID: NCT03093480 to verify Lead Org Trial ID
    Given test I want to Import a trial with NCT ID NCT03093480
    Then test I want to verify the Lead Org Trial ID
      | clinical Trial field | CTRP fields       |
      | org_study_id         | Lead Org Trial ID |

  Scenario: CT_API02. Import Trial with NCT ID: NCT03087201 to verify Secondary ID
    Given I want to Import a trial with NCT ID NCT03087201
    Then I want to verify the Secondary  ID
      | clinical Trial field | CTRP fields |
      | secondary_id         | Other ID    |

  Scenario: CT_API03. Import Trial with NCT ID: NCT03093480 to verify NCT ID
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the NCT ID
      | clinical Trial field | CTRP fields |
      | nct_id               | NCT ID      |

  Scenario: CT_API04. Import Trial with NCT ID: NCT03093480 to verify brief title
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Brief Title
      | clinical Trial field | CTRP fields |
      | brief_title          | brief title |

  Scenario: CT_API05. Import Trial with NCT ID: NCT03093480 to verify official Title
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Official Title
      | clinical Trial field | CTRP fields    |
      | official_title       | official title |

  Scenario: CT_API06. Import Trial with NCT ID: NCT00000369 to verify official title if official title is empty in clinical trials.gov
    Given I want to Import a trial with NCT ID NCT00000369
    Then I want to verify the Official title
      | clinical Trial field | CTRP fields    |
      | brief_title          | official title |

  Scenario: CT_API07. Import Trial with NCT ID: NCT03093636 to verify acronym
    Given I want to Import a trial with NCT ID NCT03093636
    Then I want to verify the acronym
      | clinical Trial field | CTRP fields |
      | acronym              | acronym     |

  Scenario: CT_API08. Import Trial with NCT ID: NCT03093480 to verify Lead Organization
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Lead Organization
      | clinical Trial field | CTRP fields       |
      | lead_sponsor.agency  | Lead Organization |

  Scenario: CT_API09. Import Trial with NCT ID: NCT03093480 to verify sponsor
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the sponsor
      | clinical Trial field | CTRP fields |
      | lead_sponsor.agency  | sponsor     |
    And I want to verify RO role is populated with this sponsor

  Scenario: CT_API10. Import Trial with NCT ID: NCT03088722 to verify collaborator
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the collaborator
      | clinical Trial field | CTRP fields  |
      | collaborator.agency  | collaborator |
    And I want to verify the collaborator Functional Code should be “Laboratory” by default

  Scenario: CT_API11. Import Trial with NCT ID: NCT03093480 to verify Data Monitoring Committee Appointed Indicator
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Data Monitoring Committee Appointed Indicator
      | clinical Trial field   | CTRP fields                                   |
      | oversight_info.has_dmc | Data Monitoring Committee Appointed Indicator |

  Scenario: CT_API12. Import Trial with NCT ID: NCT03087760 to verify FDA-regulated Drug Product
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA-regulated Drug Product
      | clinical Trial field                 | CTRP fields                |
      | oversight_info.is_fda_regulated_drug | FDA-regulated Drug Product |

  Scenario: CT_API13. Import Trial with NCT ID: NCT03087760 to verify FDA-regulated Device Product
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA-regulated Device Product
      | clinical Trial field                   | CTRP fields                  |
      | oversight_info.is_fda_regulated_device | FDA-regulated Device Product |

  Scenario: CT_API14. Import Trial with NCT ID: NCT03087760 to verify FDA Approval or Clearance
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA Approval or Clearance
      | clinical Trial field                | CTRP fields               |
      | oversight_info.is_unapproved_device | FDA Approval or Clearance |

  Scenario: CT_API15. Import Trial with NCT ID: NCT03087760 to verify Product Exported from the U.S
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the Product Exported from the U.S
      | clinical Trial field        | CTRP fields                   |
      | oversight_info.is_us_export | Product Exported from the U.S |

  Scenario: CT_API16. Import Trial with NCT ID: NCT03087760 to verify Brief Summary
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the brief summary
      | clinical Trial field | CTRP fields   |
      | brief_summary        | brief_summary |

  Scenario: CT_API17. Import Trial with NCT ID: NCT03095131 to verify Detailed description
    Given I want to Import a trial with NCT ID NCT03095131
    Then I want to verify the Detailed description
      | clinical Trial field | CTRP fields          |
      | detailed_description | Detailed Description |

  Scenario: CT_API18. Import Trial with NCT ID: NCT03088930 to verify Clinical Trial status: Not yet recruiting
    Given I want to Import a trial with NCT ID NCT03088930
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Not yet recruiting    | In Review         |

  Scenario: CT_API19. Import Trial with NCT ID: NCT02969174 to verify Clinical Trial status: Approved for marketing
    Given I want to Import a trial with NCT ID NCT02969174
    Then I want to verify the Trial status
      | clinical Trial status  | CTRP Trial status |
      | Approved for marketing | Approved          |

  Scenario: CT_API20. Import Trial with NCT ID: NCT03086395 to verify Clinical Trial status: Withdrawn
    Given I want to Import a trial with NCT ID NCT03086395
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Withdrawn             | Withdrawn         |

  Scenario: CT_API21. Import Trial with NCT ID: NCT03079687 to verify Clinical Trial status: Available
    Given I want to Import a trial with NCT ID NCT03079687
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Available             | Active            |

  Scenario: CT_API22. Import Trial with NCT ID: NCT03088904 to verify Clinical Trial status: Recruiting
    Given I want to Import a trial with NCT ID NCT03088904
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Recruiting            | Active            |

  Scenario: CT_API23. Import Trial with NCT ID: NCT03087812 to verify Clinical Trial status: Enrolling by invitation
    Given I want to Import a trial with NCT ID NCT03087812
    Then I want to verify the Trial status
      | clinical Trial status   | CTRP Trial status       |
      | Enrolling by invitation | Enrolling by invitation |

  Scenario: CT_API24. Import Trial with NCT ID: NCT03088449 to verify Clinical Trial status: Active, not recruiting
    Given I want to Import a trial with NCT ID NCT03088449
    Then I want to verify the Trial status
      | clinical Trial status  | CTRP Trial status |
      | Active, not recruiting | Closed to Accrual |

  Scenario: CT_API25. Import Trial with NCT ID: NCT03085186 to verify Clinical Trial status: No longer available
    Given I want to Import a trial with NCT ID NCT03085186
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status                  |
      | No longer available   | Closed to Accrual and Intervention |

  Scenario: CT_API26. Import Trial with NCT ID: NCT03057418 to verify Clinical Trial status: Suspended
    Given I want to Import a trial with NCT ID NCT03057418
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status                              |
      | Suspended             | Temporarily Closed to Accrual and Intervention |

  Scenario: CT_API27. Import Trial with NCT ID: NCT03088891 to verify Clinical Trial status: Completed
    Given I want to Import a trial with NCT ID NCT03088891
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Completed             | Complete          |

  Scenario: CT_API28. Import Trial with NCT ID: NCT03072901 to verify Clinical Trial status: Terminated
    Given I want to Import a trial with NCT ID NCT03072901
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status         |
      | Terminated            | Administratively Complete |

  Scenario: CT_API29. Import Trial with NCT ID: NCT03063710 to verify Clinical Trial status: Temporarily not available
    Given I want to Import a trial with NCT ID NCT03063710
    Then I want to verify the Trial status
      | clinical Trial status     | CTRP Trial status                              |
      | Temporarily not available | Temporarily Closed to Accrual and Intervention |

  Scenario: CT_API30. Import Trial with NCT ID: NCT03090061 to verify Trial Start Date and Trial Start Date option: Anticipated
    Given I want to Import a trial with NCT ID NCT03090061
    Then I want to verify the Trial Start Date
      | clinical Trial field | CTRP field              |
      | start_date           | Trial Start Date        |
      | start_date type      | Trial Start Date option |

  Scenario: CT_API31. Import Trial with NCT ID: NCT03088722 to verify Trial Start Date and Trial Start Date option: Actual
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the Trial Start Date
      | clinical Trial field | CTRP field              |
      | start_date           | Trial Start Date        |
      | start_date type      | Trial Start Date option |

  Scenario: CT_API32. Import Trial with NCT ID: NCT00000136 to verify Trial Start Date and no Trial Start Date option
    Given I want to Import a trial with NCT ID NCT00000136
    Then I want to verify the Trial Start Date
      | clinical Trial field | CTRP field       |
      | start_date           | Trial Start Date |
    And For the Trial Start Date in Past the Trial Start Date option should be populated as "Actual"

  Scenario: CT_API33. Import Trial with NCT ID: NCT03083132 to verify Completion Date and Completion Date option: Anticipated
    Given I want to Import a trial with NCT ID NCT03083132
    Then I want to verify the Completion Date
      | clinical Trial field | CTRP field             |
      | completion_date      | Completion Date        |
      | completion_date type | Completion Date option |

  Scenario: CT_API34. Import Trial with NCT ID: NCT03088722 to verify Completion Date and Completion Date option: Actual
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the Completion Date
      | clinical Trial field | CTRP field             |
      | completion_date      | Completion Date        |
      | completion_date type | Completion Date option |

  Scenario: CT_API35. Import Trial with NCT ID: NCT03083132 to verify Primary Completion Date and Primary Completion Date option: Anticipated
    Given I want to Import a trial with NCT ID NCT03083132
    Then I want to verify the Primary Completion Date
      | clinical Trial field         | CTRP field                     |
      | primary_completion_date      | Primary Completion Date        |
      | primary_completion_date type | Primary Completion Date option |

  Scenario: CT_API36. Import Trial with NCT ID: NCT03088722 to verify Primary Completion Date and Primary Completion Date option: Actual
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the Primary Completion Date
      | clinical Trial field         | CTRP field                     |
      | primary_completion_date      | Primary Completion Date        |
      | primary_completion_date type | Primary Completion Date option |

  Scenario: CT_API37. Import Trial with NCT ID: NCT03045770 to verify Start Date, Completion Date and Primary Completion Date with Month, Date and Year in it
    Given I want to Import a trial with NCT ID NCT03045770
    Then I want to verify the Date field
      | clinical Trial field    | CTRP field              |
      | start_date              | Trial Start Date        |
      | completion_date         | Completion Date         |
      | primary_completion_date | Primary Completion Date |

  Scenario: CT_API38. Import Trial with NCT ID: NCT00000142 to verify Start Date, Completion Date and Primary Completion Date with just Month and Year in it
    Given I want to Import a trial with NCT ID NCT00000142
    Then I want to verify the Date field
      | clinical Trial field    | CTRP field                                |
      | start_date              | Trial Start Date (DD should be 01)        |
      | completion_date         | Completion Date (DD should be 01)         |
      | primary_completion_date | Primary Completion Date (DD should be 01) |

  Scenario: CT_API39. Import Trial with NCT ID: NCT03090048 to verify Phase: Early Phase
    Given I want to Import a trial with NCT ID NCT03090048
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase    |
      | Early Phase 1        | Early Phase 1 |

  Scenario: CT_API40. Import Trial with NCT ID: NCT03089918 to verify Phase 1
    Given I want to Import a trial with NCT ID NCT03089918
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 1              | I          |

  Scenario: CT_API41. Import Trial with NCT ID: NCT03090165 to verify Phase 1/Phase 2
    Given I want to Import a trial with NCT ID NCT03090165
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 1/Phase 2      | I/II       |

  Scenario: CT_API42. Import Trial with NCT ID: NCT03090412 to verify Phase 2
    Given I want to Import a trial with NCT ID NCT03090412
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 2              | II         |

  Scenario: CT_API43. Import Trial with NCT ID: NCT03090516 to verify Phase 2/Phase 3
    Given I want to Import a trial with NCT ID NCT03090516
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 2/Phase 3      | II/III     |

  Scenario: CT_API44. Import Trial with NCT ID: NCT03090191 to verify Phase 3
    Given I want to Import a trial with NCT ID NCT03090191
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 3              | III        |

  Scenario: CT_API45. Import Trial with NCT ID: NCT03090503 to verify Phase 4
    Given I want to Import a trial with NCT ID NCT03090503
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 4              | IV         |

  Scenario: CT_API46. Import Trial with NCT ID: NCT03089892 to verify Phase: N/A
    Given I want to Import a trial with NCT ID NCT03089892
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | N/A                  | NA         |

  Scenario: CT_API47. Import Trial with NCT ID: NCT03089658 to verify Clinical Trial type: Expanded Access
    Given I want to Import a trial with NCT ID NCT03089658
    Then I want to verify the Trial Type
      | clinical Trial type | CTRP Study Type      |
      | Expanded Access     | Interventional Study |
    And Expanded Access should be "Yes"

  Scenario: CT_API48. Import Trial with NCT ID: NCT03095144 to verify Clinical Trial type: Interventional Study
    Given I want to Import a trial with NCT ID NCT03095144
    Then I want to verify the Trial Type
      | clinical Trial type | CTRP Study Type      |
      | Interventional      | Interventional Study |
    And Expanded Access should be "No"

  Scenario: CT_API49. Import Trial with NCT ID: NCT03090464 to verify Clinical Trial type: Observational Study
    Given I want to Import a trial with NCT ID NCT03090464
    Then I want to verify the Trial Type
      | clinical Trial type | CTRP Study Type          |
      | Observational       | Non-Interventional Study |
    And Expanded Access should be "No"

  Scenario: CT_API50. Import Trial with NCT ID: NCT03090308 to verify Clinical Trial type: Observational [Patient Registry] Study
    Given I want to Import a trial with NCT ID NCT03090308
    Then I want to verify the Trial Type
      | clinical Trial type              | CTRP Study Type          |
      | Observational [Patient Registry] | Non-Interventional Study |
    And Expanded Access should be "No"

  Scenario: CT_API51. Import Trial with NCT ID: NCT03090217 to verify Clinical Trial Allocation: Randomized
    Given I want to Import a trial with NCT ID NCT03090217
    Then I want to verify the Allocation
      | clinical Trial allocation | CTRP Study Allocation       |
      | Randomized                | Randomized Controlled Trial |

  Scenario: CT_API52. Import Trial with NCT ID: NCT03095248 to verify Clinical Trial Allocation: Non-Randomized
    Given I want to Import a trial with NCT ID NCT03095248
    Then I want to verify the Allocation
      | clinical Trial allocation | CTRP Study Allocation |
      | Non-Randomized            | Non-Randomized Trial  |

  Scenario: CT_API53. Import Trial with NCT ID: NCT03090347 to verify Clinical Trial Interventional Model: Single Group Assignment
    Given I want to Import a trial with NCT ID NCT03090347
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Single Group Assignment             | Single Group              |

  Scenario: CT_API54. Import Trial with NCT ID: NCT03095651 to verify Clinical Trial Interventional Model: Parallel Assignment
    Given I want to Import a trial with NCT ID NCT03095651
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Parallel Assignment                 | Parallel                  |

  Scenario: CT_API55. Import Trial with NCT ID: NCT03089723 to verify Clinical Trial Interventional Model: Crossover Assignment
    Given I want to Import a trial with NCT ID NCT03089723
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Crossover Assignment                | Cross-over                |

  Scenario: CT_API56. Import Trial with NCT ID: NCT01178892 to verify Clinical Trial Interventional Model: Factorial Assignment
    Given I want to Import a trial with NCT ID NCT01178892
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Factorial Assignment                | Factorial                 |

  Scenario: CT_API57. Import Trial with NCT ID: NCT03089203 to verify Clinical Trial Interventional Model: Sequential Assignment
    Given I want to Import a trial with NCT ID NCT03089203
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Sequential Assignment               | Sequential                |

  Scenario: CT_API58. Import Trial with NCT ID: NCT03090178 to verify Clinical Trial Primary Purpose: Other
    Given I want to Import a trial with NCT ID NCT03090178
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking |
      | Other                          | Other        |
    And Description should be populated

  Scenario: CT_API59. Import Trial with NCT ID: NCT02512757 to verify Study Model: Case-Control
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Study Model
      | clinical Trial Study Model | CTRP fields  |
      | Case-Control               | Case-Control |
