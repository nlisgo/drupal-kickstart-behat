@todrink @cart
Feature: Add drinking item to cart
  In order to buy something to drink with
  As any user
  I should be able to add a coffee mug to my cart

  Scenario Outline: Check images styles are working
    When I go to "<image>"
    Then the response status code should be 200

    Examples:
      | image |
      | /sites/default/files/styles/hp_slideshow/public/field/image/slideshow/slideshow-1.jpg |
      | /sites/default/files/styles/hp_slideshow/public/field/image/slideshow/slideshow-2.jpg |

  Scenario: View the drinking options text and links on the page
    Given I am on the homepage
    When I follow "To drink with"
    Then I should see the heading "Coffee Mugs"
    And I should see the link "Drupal Commerce to Wake You Up"

  Scenario: View coffee mug product information
    When I go to "/drinks/drupal-commerce-wake-you"
    Then I should see the following <texts>
      | texts                           |
      | Drupal Commerce to Wake You Up  |
      | Acme gear                       |
      | $8.00                           |
      | Product Description             |
      | SKU: MG1-BLU-OS                 |

  Scenario: Add coffee mug to cart
    When I go to "/drinks/drupal-commerce-wake-you"
    And I press "Add to cart"
    Then I should see "ITEM SUCCESSFULLY ADDED TO YOUR CART"

  @javascript
  Scenario: Read more reveals more text
    When I go to "/drinks/drupal-commerce-wake-you"
    Then I should not see "ut lacus"

  @javascript
  Scenario: Read more reveals more text
    When I go to "/drinks/drupal-commerce-wake-you"
    And I follow "read more"
    Then I should see "ut lacus"
