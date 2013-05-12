<?php

/**
 * Implements hook_install_tasks().
 */
function drupress_install_tasks($install_state) {
  $tasks = array();

  // Make sure we have more memory than 64M. if not lets try to increase it.
  // @todo: Stick this in a hook_requirements.
  if (ini_get('memory_limit') != '-1' && ini_get('memory_limit') <= '64M') {
    ini_set('memory_limit', '94M');
  }
}

/**
 * Implements hook_form_alter().
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  foreach ($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'drupress';
  }
}
