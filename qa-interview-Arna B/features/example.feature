Feature: An Example Feature

  Scenario: An example scenario
    Given   I am on the homepage
    Then    I see the text "You don't join us, we join you"
    
  Scenario: input fields exists
    Given   I am on the homepage
    Then    Input field for First Name exists
    And 		Input field for Last Initial exists

  Scenario Outline: negative scenarios using the input fields
    Given   I am on the homepage
    When    I enter <firstName> in First Name field
    And 		I click on <buttonToClick> button
    Then 		<error> error message displays
    Examples:
    | firstName  |buttonToClick           | error                              |
    | ""         |Suggest Male Rap Name   | "You must enter your first name."  |
    | "     "    |Suggest Male Rap Name   | "You must enter your first name."  |
    | ""         |Suggest Female Rap Name | "You must enter your first name."  |
    | "     "    |Suggest Female Rap Name | "You must enter your first name."  |
    #
  Scenario: submit male with a nickname
    Given   I am on the homepage
    When    I enter "Jackson" in First Name field
    And     I "select" Use nickname checkbox
    And 		I click on Suggest Male Rap Name button
    Then    Rap name displays for "Jackson"
    
  Scenario Outline: submit feamil with a last initial
    Given   I am on the homepage
    When    I enter <firstName> in First Name field
    And 		I enter <lastInitial> in Last Initial field
    And     I <selectOrNot> Use nickname checkbox
    And 		I click on <buttonToClick> button
    Then 		Rap name displays for <firstName>
    Examples:
    | firstName|lastInitial|selectOrNot  |buttonToClick          |
    | "John"   |    "R"    |"not select" |Suggest Female Rap Name|
    | "Luip"   |    "T"    |"not select" |Suggest Female Rap Name|