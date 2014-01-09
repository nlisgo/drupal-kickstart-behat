@images
Feature: Images arve available
  In order to have a good experience
  As any user
  I should be able to see images

  Scenario: Images loading
    When I go to "/sites/default/files/field/image/slideshow/slideshow-1.jpg"
    Then I should get a "200" HTTP response

  Scenario: Image caches loading
    When I go to "/sites/default/files/styles/hp_slideshow/public/field/image/slideshow/slideshow-1.jpg"
    Then I should get a "200" HTTP response
