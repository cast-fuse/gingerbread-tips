<?php
/*Plugin Name: Create Custom Taxonomy for Tips
Description: This plugin registers the 'topics' custom taxonomy.
Version: 1.0
License: GPLv2
*/

// Register Custom Taxonomy
function tip_topic_taxonomy() {

	$labels = array(
		'name'                       => _x( 'Topics', 'Taxonomy General Name', 'text_domain' ),
		'singular_name'              => _x( 'Topic', 'Taxonomy Singular Name', 'text_domain' ),
		'menu_name'                  => __( 'Topic', 'text_domain' ),
		'all_items'                  => __( 'All Topics', 'text_domain' ),
		'parent_item'                => __( 'Parent Topic', 'text_domain' ),
		'parent_item_colon'          => __( 'Parent Topic:', 'text_domain' ),
		'new_item_name'              => __( 'New Topic Name', 'text_domain' ),
		'add_new_item'               => __( 'Add New Topic', 'text_domain' ),
		'edit_item'                  => __( 'Edit Topic', 'text_domain' ),
		'update_item'                => __( 'Update Topic', 'text_domain' ),
		'view_item'                  => __( 'View Topic', 'text_domain' ),
		'separate_items_with_commas' => __( 'Separate topics with commas', 'text_domain' ),
		'add_or_remove_items'        => __( 'Add or remove topics', 'text_domain' ),
		'choose_from_most_used'      => __( 'Choose from the most used topics', 'text_domain' ),
		'popular_items'              => __( 'Popular Items', 'text_domain' ),
		'search_items'               => __( 'Search topics', 'text_domain' ),
		'not_found'                  => __( 'Not Found', 'text_domain' ),
		'no_terms'                   => __( 'No items', 'text_domain' ),
		'items_list'                 => __( 'Items list', 'text_domain' ),
		'items_list_navigation'      => __( 'Items list navigation', 'text_domain' ),
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
		'show_in_rest'               => true,
	);
	register_taxonomy( 'topic', array( 'tips' ), $args );

}
add_action( 'init', 'tip_topic_taxonomy', 0 );

?>
