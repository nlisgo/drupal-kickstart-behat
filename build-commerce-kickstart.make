api = 2
core = 7.x
; Include the definition for how to build Drupal core directly, including patches:
includes[] = http://drupalcode.org/project/commerce_kickstart.git/blob_plain/refs/heads/7.x-2.x:/drupal-org-core.make
; Download the install profile and recursively build all its dependencies:
projects[commerce_kickstart][type] = "profile"
projects[commerce_kickstart][download][type] = "git"
projects[commerce_kickstart][download][url] = "http://git.drupal.org/project/commerce_kickstart.git"
projects[commerce_kickstart][download][branch] = "7.x-2.x"
projects[commerce_kickstart][download][revision] = "80358fdc384a0c933ab2426f11fdd47fc4cd7639"

