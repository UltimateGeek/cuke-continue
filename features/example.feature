Feature: Test all thens
  Scenario: First then fails
    When I run `echo testing continues`
    Then the following expectations are met:
      | the exit status should be 1                 |
      | the output should match /testing continues/ |
