<?php get_header(); ?>

<div class="content_left">
    <?php if (have_posts()) : ?>
        <?php while (have_posts()) : the_post();
            $post_id = $post->ID;

            ?>

            <div class="post">

                <div class="entry">
                    <div class="entry_head">
                        <div class="entry_head_content">
                            <h1><?php the_title(); ?></h1>
                        </div>
                    </div>
                    <div class="entry_content">
                        <?php the_content(); ?>
                        <?php edit_post_link('Edit'); ?>
                    </div>
                </div>

            </div>

        <?php endwhile; ?>

    <?php endif; ?>

</div>

<?php get_footer(); ?>
