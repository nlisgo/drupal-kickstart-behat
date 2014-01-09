drupal-kickstart-behat
======================


A sandbox proof of concept for a session at Drupalcamp London (http://2013.drupalcamplondon.co.uk/session/zip-bdd-do-dah-zip-bdd-ay).

Uses the Drupal 7 Commerce Kickstart profile (http://drupal.org/project/commerce_kickstart),
with Behat/Mink testing using Travis CI (https://travis-ci.org)


[![Build Status](https://travis-ci.org/nlisgo/drupal-kickstart-behat.png?branch=master)](https://travis-ci.org/nlisgo/drupal-kickstart-behat)

## Installation

    # Clone repo
    git clone https://github.com/nlisgo/drupal-kickstart-behat.git public_html

    # Create Drupal codebase
    cd public_html
    drush make build-commerce-kickstart.make www

    # Create Drupal database
    mysql -e 'create database DB_NAME;' -u USERNAME -p PASSWORD

    # Install Drupal
    cd www
    drush si commerce_kickstart --sites-subdir=default --db-url=mysql://USERNAME:PASSWORD@localhost/DB_NAME --account-name=admin --account-pass=admin --site-mail=admin@example.com --site-name="Commerce Kickstart Profile" --yes

    # Start webserver
    drush rs 8888

    # Install testing tools
    cd ../../tests/behat
    curl -s http://getcomposer.org/installer | php
    php composer.phar install

##### Configure Behat
Modify `/tests/behat/behat.yml`
Set `base_url` to your local host

Copy `behat.local.yml.example` to `behat.local.yml` and set the drupal_root to the full path of the Drupal root

To run tests

    # Run tests
    cd /tests/behat
    ./bin/behat
