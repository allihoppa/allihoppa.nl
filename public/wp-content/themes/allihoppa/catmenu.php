<?php
global $post;
$current_category_title = single_cat_title('',false);

$cat_id = get_cat_ID( $current_category_title );

$current_post_id = $post->ID;


$args = array(
	'type'                     => 'post',
	'child_of'                 => 0,
	'parent'                   => '',
	'orderby'                  => 'name',
	'order'                    => 'ASC',
	'hide_empty'               => 1,
	'hierarchical'             => 1,
	'exclude'                  => '',
	'include'                  => '',
	'number'                   => '',
	'taxonomy'                 => 'category',
	'pad_counts'               => false

	);

$categories = get_categories( $args );

$cat_list = '';
if(is_home() || is_front_page())  {
$cat_list .= "<li class=\"current_cat\">";
} else {
$cat_list .= "<li>";
}
$cat_list .= "<a href=\"". get_bloginfo('url') . "\">";
$cat_list .= "alles";
$cat_list .= "</a></li>\n";
$cat_list .= "<li> / </li>\n";

$y = 0;
foreach ( $categories as $category ) {

	//add x
	$y++;

	$category_id = $category->term_id;
	$category_name = $category->name;
	$category_nicename = $category->slug;

	if($y != "1") {
		$cat_list .= "<li> / </li>\n";
	}

	if($current_category_title == $category_name )  {
	$cat_list .= "<li class=\"current_cat\">";
	} else {
	$cat_list .= "<li>";
	}

	$cat_list .= "<a href=\"". get_bloginfo('url') . "/" . $category_nicename . "\">";
	$cat_list .= $category_name;
	$cat_list .= "</a></li>\n";
}
?>

<div class="catmenu">
	<div class="container width_max">
	<ul>
	<?php
	echo $cat_list;

	?>
	</ul>
	</div>
</div>
