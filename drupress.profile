<?php
/**
 * @file
 * Enables modules and site configuration for a drupress site installation.
 */

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function drupress_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name.
  $form['site_information']['site_name']['#default_value'] = t('My DruPress Blog');
}

/**
 * Implements hook_form_alter().
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  foreach ($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'drupress';
  }
}

/**
 * Implements hook_install_tasks().
 */
function drupress_install_tasks(&$install_state) {
  $tasks = array(
    'drupress_enable_default_views' => array(),
  );
  return $tasks;
}

/**
 * Enable the archive and taxonomy views that ship with the views module.
 */
function drupress_enable_default_views() {
  $views_defaults = array(
    'archive' => FALSE,
    'taxonomy_term' => FALSE,
  );
  variable_set('views_defaults', $views_defaults);
}
