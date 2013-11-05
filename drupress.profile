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
  $form['site_information']['site_name']['#default_value'] = t('My Drupress Blog');
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
    'drupress_set_default_theme' => array(),
    'drupress_set_jquery_version' => array(),
    'drupress_enable_default_views' => array(),
    'drupress_enable_archive_block' => array(),
    'drupress_enable_comments_block' => array(),
    'drupress_enable_categories_block' => array(),
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

/**
 * Set the bootstrap theme as default.
 */
function drupress_set_default_theme() {
  variable_set('theme_default', 'bootstrap');
}

/**
 * Pick the right jquery version.
 */
function drupress_set_jquery_version() {
  variable_set('jquery_update_jquery_version', '1.7');
}

/**
 * Enable the archive block.
 */
function drupress_enable_archive_block() {
  // The post archive block.
  $block = array(
    'module' => 'views',
    'delta' => 'archive-block',
    'theme' => variable_get('theme_default', 'bootstrap'),
    'status' => 1,
    'weight' => -9,
    'region' => 'sidebar_second',
    'custom' => 0,
    'visibility' => 0,
    'pages' => '',
    'title' => 'Archive',
    'cache' => DRUPAL_NO_CACHE,
  );

  // Oogly. It seems that depending on feature version, the blocks may or may
  // not get created as intended. Catch the AlreadyExists error and run an
  // update query in that case.
  try {
    db_insert('block')
      ->fields($block)
      ->execute();
  } catch (Exception $e) {
    db_update('block')
      ->fields($block)
      ->condition('module', $block['module'])
      ->condition('delta', $block['delta'])
      ->condition('theme', $block['theme'])
      ->execute();
  }
}

/**
 * Enable the recent comments block.
 */
function drupress_enable_comments_block() {
  // The recent comments block.
  $block = array(
    'module' => 'views',
    'delta' => 'comments_recent-block',
    'theme' => variable_get('theme_default', 'bootstrap'),
    'status' => 1,
    'weight' => -8,
    'region' => 'sidebar_second',
    'custom' => 0,
    'visibility' => 0,
    'pages' => '',
    'title' => 'Recent comments',
    'cache' => DRUPAL_NO_CACHE,
  );

  try {
    db_insert('block')
      ->fields($block)
      ->execute();
  } catch (Exception $e) {
    db_update('block')
      ->fields($block)
      ->condition('module', $block['module'])
      ->condition('delta', $block['delta'])
      ->condition('theme', $block['theme'])
      ->execute();
  }
}

/**
 * Enable the categories block.
 */
function drupress_enable_comments_block() {
  // The recent comments block.
  $block = array(
    'module' => 'views',
    'delta' => 'comments_recent-block',
    'theme' => variable_get('theme_default', 'bootstrap'),
    'status' => 1,
    'weight' => -7,
    'region' => 'sidebar_second',
    'custom' => 0,
    'visibility' => 0,
    'pages' => '',
    'title' => 'Recent comments',
    'cache' => DRUPAL_NO_CACHE,
  );

  try {
    db_insert('block')
      ->fields($block)
      ->execute();
  } catch (Exception $e) {
    db_update('block')
      ->fields($block)
      ->condition('module', $block['module'])
      ->condition('delta', $block['delta'])
      ->condition('theme', $block['theme'])
      ->execute();
  }
}
