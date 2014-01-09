#!/usr/bin/env bash

# Prepare ./tests/behat/behat.local.yml
sudo echo "default:
  extensions:
    Behat\MinkExtension\Extension:
      base_url: 'http://127.0.0.1:8888'
    Drupal\DrupalExtension\Extension:
      blackbox: ~
      drupal:
        drupal_root: '$(pwd)/kickstart'" | sudo tee "$(pwd)/tests/behat/behat.local.yml" > /dev/null
