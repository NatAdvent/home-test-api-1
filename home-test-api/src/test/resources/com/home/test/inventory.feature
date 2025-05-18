Feature: Inventory API Testing

  Background:
    # Set the base URL for all requests
    Given url 'http://localhost:3100/api'

 Scenario: Get all menu items
  Given path 'inventory'
  When method get
  Then status 200
  And assert response.data.length >= 9
  And match each response.data contains { id: '#notnull', name: '#notnull', price: '#notnull', image: '#notnull' }

  Scenario: Filter by id = 3
    Given path 'inventory/filter'
    And param id = 3
    When method get
    Then status 200
    And match response == { id: "3", name: "Baked Rolls x 8", image: "roll.png", price: "$10" }

  Scenario: Add item with non-existent id = 10
    Given path 'inventory/add'
    And request { id: '10', name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }
    When method post
    Then status 400

  Scenario: Add item with existing id = 10 again
    Given path 'inventory/add'
    And request { id: '10', name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }
    When method post
    Then status 400

  Scenario: Add item missing id field
    Given path 'inventory/add'
    And request { name: 'Veggie', image: 'veggie.png', price: '$12' }
    When method post
    Then status 400
    And match response contains "Not all requirements are met"


  Scenario: Verify recently added item (id=10) is present
    Given path 'inventory'
    When method get
    Then status 200
    And match response.data contains { id: "10", name: "Hawaiian", image: "hawaiian.png", price: "$14" }
