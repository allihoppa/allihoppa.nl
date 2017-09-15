<?php
global $post;
$current_post_id = $post->ID;
$page_slug = $post->post_name;

$menu_name = 'mainmenu';

if (($menu = wp_get_nav_menu_object($menu_name)) && (isset($menu))) {
    $menu_items = wp_get_nav_menu_items($menu->term_id);
    $normal_menu = '<ul id="menu-' . $menu_name . '">';

    $x = 0;
    foreach ((array) $menu_items as $key => $menu_item) {
        $x++;

        $item_id = $menu_item->object_id;

        if (function_exists('the_slug')) {
            $item_slug = the_slug($item_id);
        }

        $title = $menu_item->title;
        $url = $menu_item->url;

        if ($x > "1") {
            $normal_menu .= '<li class="menu-item walker">/</li>';
        }
        if ($item_slug == $page_slug) {
            $selected = " current_page_item";
        } else {
            $selected = "";
        }
        $normal_menu .= '<li class="page_item' . $selected . '"><a href="' . $url . '">' . $title . '</a></li>';
    }

    $normal_menu .= '</ul>';
}

$args = array(
    'sort_order' => 'ASC',
    'sort_column' => 'menu_order',
    'hierarchical' => 1,
    'exclude' => '',
    'include' => '',
    'meta_key' => '',
    'meta_value' => '',
    'authors' => '',
    'child_of' => 0,
    'parent' => 0,
    'exclude_tree' => '',
    'number' => '',
    'offset' => 0,
    'post_type' => 'page',
    'post_status' => 'publish'
);

$pages = get_pages($args);

$mobile_menu = '';

foreach ($pages as $page) {

    //add x
    $x++;

    //set variables
    $page_id = $page->ID;
    $page_title = $page->post_title;
    $page_link = $page->guid;

    //create mobile menu
    $extra_walker = "";
    if ($page->post_parent) {
        $extra_walker = "- ";
    }
    $mobile_menu .= '<option value="' . get_page_link($page_id) . '">';
    $mobile_menu .= $extra_walker . $page_title;
    $mobile_menu .= '</option>';
}

?>

<div class="menu nomobile">
    <ul>
        <?php
        echo $normal_menu;
        ?>
    </ul>
</div>

<div class="mobile_menu mobile_only">
    <div class="container width_max">
        <select name="page-dropdown" class="page-dropdown"
                onchange='document.location.href=this.options[this.selectedIndex].value;'>
            <option value="">
                <?php echo esc_attr(__('Selecteer een pagina')); ?></option>
            <?php echo $mobile_menu; ?>
        </select>
    </div>
</div>
