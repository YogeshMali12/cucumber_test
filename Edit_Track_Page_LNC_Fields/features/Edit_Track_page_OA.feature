Feature: TestCase is for EditTrack page
  In this test cases i have covered all fields
  Validation for individual fields is also covered
  Unsuccessful and Confirmation message also covered for edit_track page

  Background: login to OA side
    Given I have to login to OA side always
    Then Go to the Edit Track page on OA side


  Scenario: Verify the confirmation message on OA Edit_track page
    Given Filled all mandatory fields on edit track page
    And Click on the Update button
    Then verify the confirmation message


  Scenario:International Standard Musical Work Code (ISWC) - Invalid
    When I enter an invalid ISWC
    Then Save the track
    Then I should see an ISWC validation error


  @this_one
  Scenario Outline: Publishing Admin (3rd party publishers)
    When I select "<option1>" and save the track
    Then Verify that no is saved successfully
  Examples:
    | option1 |
    | YES |
    | NO  |

