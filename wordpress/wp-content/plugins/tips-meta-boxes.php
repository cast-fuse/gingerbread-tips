<?php
/*Plugin Name: Tips Meta Boxes
Description: This plugin registers the extra meta boxes in the admin area.
Version: 1.0
License: GPLv2
*/
add_filter( 'rwmb_meta_boxes', 'register_tips_meta_boxes' );

function register_tips_meta_boxes ( $meta_boxes ) {

  $prefix = 'tips_meta_';

  $meta_boxes[] = array(
      'id'         => 'attribution',
      'title'      => esc_html__( 'Attribution', 'metabox-online-generator' ),
      'post_types' => array( 'tips' ),
      'context'    => 'side',
      'priority'   => 'default',
      'autosave'   => true,
      'fields' => array(
          array(
              'id' => $prefix . 'attribution',
              'type' => 'text',
              'name' => esc_html__( 'Attribution', 'metabox-online-generator' ),
              'desc' => esc_html__( 'Who wrote the tip (i.e. Mum of 2, Dad of 3)', 'metabox-online-generator' ),
              'placeholder' => esc_html__( 'Mum, 2 kids, aged 4 and 6', 'metabox-online-generator' ),
          ),
      )
  );

  return $meta_boxes;
}

?>
