api = 2
core = 7.x
projects[drupal][type] = core
projects[drupal][version] = 7.27

; This requires a core bug fix to not show the profile selection page when only
; one profile is visible.
; http://drupal.org/node/1074108#comment-6463662
; projects[drupal][patch][] = https://drupal.org/files/1074108-skip-profile-23.patch

; Allow to specify SCRIPT HTML element attributes through drupal_add_js()
; http://drupal.org/node/1664602#comment-7237570
; projects[drupal][patch][] = https://drupal.org/files/issues/js_attributes_1664602-54.patch
