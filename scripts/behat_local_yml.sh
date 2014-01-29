#!/usr/bin/env bash

# Prepare ./tests/behat/behat.local.yml
sudo echo "default:
  extensions:
    Behat\MinkExtension\Extension:
      base_url: 'http://127.0.0.1:80'
      selenium2:
        wd_host: $SAUCE_USERNAME:$SAUCE_ACCESS_KEY@ondemand.saucelabs.com/wd/hub
    Drupal\DrupalExtension\Extension:
      blackbox: ~
      drupal:
        drupal_root: '$(pwd)/kickstart'" | sudo tee "$(pwd)/tests/behat/behat.local.yml" > /dev/null
cat "$(pwd)/tests/behat/behat.local.yml"
