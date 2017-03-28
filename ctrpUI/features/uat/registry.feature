Feature: UAT test for Registry

  Scenario Outline: #1 Search a Trial
    Given I am logged in to the Registry
    And I want to search with criteria <criteria> with value <value> for type "All Trials"
    Then I should see the result <result>

    Examples:
      | criteria                | value                                                                                                                             | result |
      | Title                   | A Clinical Trial of Pembrolizumab (MK-3475) Evaluating Predictive Biomarkers in Subjects With Advanced Solid Tumors (KEYNOTE 158) | true   |
      | Phase                   | II                                                                                                                                | true   |
      | Purpose                 | Treatment                                                                                                                         | true   |
      | Pilot Trial             | Yes                                                                                                                               | true   |
      | Identifier              | NCI-2014-00004                                                                                                                    | true   |
      | Identifier              | NYU S12-03902                                                                                                                     | true   |
      | Identifier              | NCT01725633                                                                                                                       | true   |
      | Identifier              | abcd1234                                                                                                                          | false  |
      | Search By Trial Catgory | Abbreviated                                                                                                                       | true   |
