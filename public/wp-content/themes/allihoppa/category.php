<?php get_header(); ?>

<div class="content_left">

    <div id="grid-content">

        <?php
        $option1 = !empty($_POST['option1']) ? $_POST['option1'] : '';
        $option2 = !empty($_POST['option2']) ? $_POST['option2'] : '';

        $all_values = $option1 . $option2;
        $values_array = array($option1, $option2);
        if (is_category('gedachtengoed')) {
            //do nothing
        } else {
            ?>
            <div class="filter_wrap">
                <form name="filterform" action="#" method="POST">
                    <ul class="postfilter">

                        <li<?php if (!empty($option1)) {
                            echo " class='checked'";
                        } ?>><input type="checkbox" name="option1" value="inspiratie" <?php if (!empty($option1)) {
                                echo " checked";
                            } ?>>inspiratie
                        </li>
                        <li> /</li>
                        <li<?php if (!empty($option2)) {
                            echo " class='checked'";
                        } ?>><input type="checkbox" name="option2" value="tutorials" <?php if (!empty($option2)) {
                                echo " checked";
                            } ?>>tutorials
                        </li>

                    </ul>
                </form>

            </div>
            <?php
        } // else end if is category

        $category = get_category(get_query_var('cat'));
        $cat_id = $category->cat_ID;

        $page = (get_query_var('paged')) ? get_query_var('paged') : 1;
        $args = array(
            'cat' => $cat_id,
            'post_type' => 'post',
            'paged' => $page,
        );

        query_posts($args);

        if (have_posts()) : ?>
            <?php while (have_posts()) : the_post();
                $post_id = $post->ID;

                $preview_image = get_the_post_thumbnail($post_id, 'preview-medium');
                $categories = get_the_category();
                $separator = ', ';
                $output = '';
                if ($categories) {
                    foreach ($categories as $category) {
                        $output .= $category->cat_name . '' . $separator;
                    }
                }

                $in_array = "";

                if (!empty($all_values)) {

                    if (function_exists('get_field')) {
                        $filter_post = get_field('soort_bericht');
                    }

                    if (in_array($filter_post, $values_array)) {
                        $in_array = "true";
                    } else {
                        $in_array = "false";
                    }

                    if ($in_array == "true") {
                        $showhide = "filter_show";
                    } else {
                        $showhide = "filter_hide";
                    }
                } else {
                    $showhide = "";
                }

                ?>
                <div class="content_item width_medium <?php echo $showhide; ?>">
                    <a class="content_overlay_link" href="<?php the_permalink(); ?>">&nbsp;</a>
                    <?php if (has_post_format('video')) {
                        echo "<div class=\"playbutton\">&nbsp;</div>";
                    } ?>
                    <div class="preview_picture">
                        <?php echo $preview_image; ?>
                    </div>

                    <div class="preview_content">
                        <div class="item_type"><?php echo trim($output, $separator); ?></div>
                        <div class="item_title"><h1><?php the_title(); ?></h1></div>
                    </div>

                </div>

            <?php endwhile;
            wp_reset_postdata();

            ?>

            <div class="navigation content_left">
                <?php if (function_exists('wp_pagenavi')) {
                    wp_pagenavi();
                } ?>
            </div>

        <?php endif; ?>

    </div><!-- /grid-content -->
</div><!-- / content_left -->

<?php get_footer(); ?>
