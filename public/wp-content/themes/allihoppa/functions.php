<?php
//////// WIDGETS ///////
if ( function_exists('register_sidebar') ) {
    register_sidebar(array('name' => 'Sidebar','before_widget' => '<div class="sidebar_content">', 'after_widget' => '</div><div class="space">&nbsp;</div>', 'before_title' => '<h1>', 'after_title' => '</h1>') );
	register_sidebar(array('name' => 'Footer 1','before_widget' => '<div class="footer_content">', 'after_widget' => '</div>', 'before_title' => '<h3>', 'after_title' => '</h3>') );
	register_sidebar(array('name' => 'Footer 2','before_widget' => '<div class="footer_content">', 'after_widget' => '</div>', 'before_title' => '<h3>', 'after_title' => '</h3>') );
	register_sidebar(array('name' => 'Footer 3','before_widget' => '<div class="footer_content">', 'after_widget' => '</div>', 'before_title' => '<h3>', 'after_title' => '</h3>') );
}

function word_limiter($str, $n = 20, $end_char = '&#8230;') {
	if (strlen($str) < $n) {
		return $str;
	}

	$words = explode(' ', preg_replace("/\s+/", ' ', preg_replace("/(\r\n|\r|\n)/", " ", $str)));

	if (count($words) <= $n) {
		return $str;
	}

	$str = '';
	for ($i = 0; $i < $n; $i++) {
		$str .= $words[$i].' ';
	}

	return trim($str).$end_char;
}


function load_scripts() {

	$template_url = get_bloginfo('template_url');

	$functions_location = $template_url . "/js/functions.js";
	$jquery_location = $template_url . "/js/jquery.min.js";
	$jquery_jcarousel3_location = $template_url . "/js/jquery.jcarousel.min.js";
	$jquery_jcarousel3basic_location = $template_url . "/js/jcarousel.basic.js";
	$jquery_vgrid_location = $template_url . "/js/jquery.vgrid.min.js";
	$jquery_easing_location = $template_url . "/js/jquery.easing.min.js";

	wp_dequeue_script('jquery');
	wp_dequeue_script('jqueryui');
	wp_deregister_script('jquery');
	wp_deregister_script( 'jqueryui');

	wp_register_script('jquery', $jquery_location , false,  '1.11.0'); // extra jquery library

	wp_register_script('extra_functions', $functions_location , false); // extra functions


	wp_enqueue_script('jquery');
	wp_enqueue_script('extra_functions');


	if( is_single()) {
		wp_register_script('jquery_jcarousel', $jquery_jcarousel3_location, false); //carousel function
		wp_register_script('jquery_jcarousel3basic', $jquery_jcarousel3basic_location, false); //basic settings for carousel

		wp_enqueue_script('jquery_jcarousel');
		wp_enqueue_script('jquery_jcarousel3basic');

	} else {

		wp_register_script('jquery_vgrid', $jquery_vgrid_location , false); //jquery vgrid
		wp_register_script('jquery_easing', $jquery_easing_location , false); //jquery easing

		wp_enqueue_script('jquery_vgrid');
		wp_enqueue_script('jquery_easing');

	}

}

add_action('wp_enqueue_scripts','load_scripts');

function remove_default_image_sizes( $sizes) {
    unset($sizes['thumbnail']);
    unset($sizes['medium']);
    unset($sizes['large']);
    return $sizes;
}

add_filter('intermediate_image_sizes_advanced','remove_default_image_sizes');

/* add new images sizes */
if ( function_exists( 'add_image_size' ) ) {
	add_image_size( 'preview-slider', 959, 550, true ); //cropped
	add_image_size( 'preview-large', 618, 300, true ); //cropped
	add_image_size( 'preview-medium', 460, 300, true ); //cropped
	add_image_size( 'preview-small', 300, 300, true ); //cropped
}

/** Grab IDs from new WP 3.5 gallery **/
function lc_grab_ids_from_gallery() {
global $post;

	$attachment_ids = array();
	$pattern = get_shortcode_regex();
	$ids = array();

	if (preg_match_all( '/'. $pattern .'/s', $post->post_content, $matches ) ) { //finds the "gallery" shortcode and puts the image ids in an associative array at $matches[3]

		$count=count($matches[3]); //in case there is more than one gallery in the post.
		for ($i = 0; $i < $count; $i++){
		$atts = shortcode_parse_atts( $matches[3][$i] );
			if ( isset( $atts['ids'] ) ){
			$attachment_ids = explode( ',', $atts['ids'] );
			$ids = array_merge($ids, $attachment_ids);
			}
		}
	}
	return $ids;

}


function the_slug($id) {
	$post_data = get_post($id, ARRAY_A);
	$slug = $post_data['post_name'];
	return $slug;
}

/* a WP function for removing shortcodes */
function remove_shortcode_from($content) {
  $content = strip_shortcodes( $content );
  return $content;
}

function fixCategoryPagination($queryString) {
    if (isset($queryString['name']) && $queryString['name'] == 'page' && isset($queryString['page'])) {
        unset($queryString['name']);
        // 'page' in the query_string looks like '/2', so i'm exploding it
        list($delim, $page_index) = explode('/', $queryString['page']);
        $queryString['paged'] = $page_index;
    }
    return $queryString;
}

add_filter('request', 'fixCategoryPagination');

add_action( 'wp', 'lc_grab_ids_from_gallery' );
add_theme_support( 'post-formats', array( 'image', 'gallery', 'video' ) );
add_theme_support( 'post-thumbnails' );
// Make sure cron jobs such as those initiated by akismet plugin
// use the internal hostname and port
add_filter('site_url', 'filter_site_url_use_internal_url_for_cron_jobs');
function filter_site_url_use_internal_url_for_cron_jobs($url)
{
    if (strstr($url, 'wp-cron.php')) {
        return str_replace(getenv('WP_HOME'), getenv('INTERNAL_WP_HOME'), $url);
    }

    return $url;
}

?>
