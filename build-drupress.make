api = 2
core = 7.x
; Include the definition for how to build Drupal core directly, including patches:
includes[] = drupal-org-core.make
; Download the Drupress install profile and recursively build all its dependencies:
projects[drupress][version] = 1.x-dev
