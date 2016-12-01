Feature: books endpoints
  As an API user
  I want to call CRUD endpoints to manipulate books

  Scenario: POST to add a new book
    Given I send a POST request to "/books" in "books"
      | title                   | price | full_price | isbn       | brand         | description |
      | Pete the Cat: Scuba-Cat |   500 |        650 | 0062303880 | HarperCollins | New York Times bestselling author and artist James Dean brings Pete the Cat’s world to life under the sea in this new I Can Read book. |
    Then the response status should be "201"

  Scenario: POST to add a new book without required attributes
    Given I send a POST request to "/books" in "books"
      | price | full_price | isbn       | brand         | description |
      |   500 |        650 | 0062303880 | HarperCollins | New York Times bestselling author and artist James Dean brings Pete the Cat’s world to life under the sea in this new I Can Read book. |
    Then the response status should be "422"
    And the JSON response should include "title"

  Scenario: GET book details by slug for a book
    Given I create a dummy book
    And I send a GET request to "/books/slug/:book_slug" in "books"
    Then the response status should be "200"

  Scenario: GET book details by slug for an invalid book
    Given I send a GET request to "/books/slug/not-a-real-book" in "books"
    Then the response status should be "404"

  Scenario: GET book details by book id for a valid book
    Given I create a dummy book
    And I send a GET request to "/books/:book_id" in "books"
    Then the response status should be "200"

  Scenario: GET book details by book id for an invalid book
    Given I send a GET request to "/books/d3f764a5-2f09-457e-8a94-0128cd46ad3e" in "books"
    Then the response status should be "404"

  Scenario: POST to add a new category
    Given I send a POST request to "/categories" in "books"
      | name       | description       |
      | Tech Books | Books for techies |
    Then the response status should be "201"

  Scenario: GET list of categories
    Given I create a dummy category
    And I send a GET request to "/categories" in "books"
    Then the response status should be "200"
    And the response should be valid JSON
