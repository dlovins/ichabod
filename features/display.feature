Feature: Display tests for various datasets
  As a patron, I want to see the type of record for NYU Press Open Access Books
  As a patron, I want to see the url for GIS data

  Scenario: Display "Online Resource" field in search results
    Given I am on the default search page
    When I perform an empty search
    And I limit my results to "Geospatial Data" under the "Format" category
    Then I should get "Online Resource" field in all results

  Scenario: Display "Online Resource" field in details display
    Given I limit my search to "Geospatial Data" under the "Format" category
    And I search for "Buenos Aires"
    When I navigate to details display of the first result
    Then I should get "Online Resource" field in the details display

  Scenario: Display "Book" field in the details display
    Given I limit my search to "NYU Press Open Access Books" under the "Collection" category
    When I navigate to details display of the first result
    Then I should see the value "Book" in the "Format:" field

  Scenario: Display "Creator" field in the details display
    Given I limit my search to "NYU Press Open Access Books" under the "Collection" category
    When I navigate to details display of the first result
    Then I should see the value "Jody David Armour" in the "Creator:" field