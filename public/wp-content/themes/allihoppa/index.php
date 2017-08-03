<?php get_header(); ?>

<div class="content_left">
<div id="grid-content">

<?php if (have_posts()) :  ?>
    <?php $n = 0; while (have_posts()) : the_post();

		//add number
		$n++;

		switch ($n) {
			case 1:
				$width_class = "width_large";
				$preview_size = "preview-large";
				break;
			case 2:
				$width_class = "width_small";
				$preview_size = "preview-small";
				break;
			case 3:
				$width_class = "width_small";
				$preview_size = "preview-small";
				break;
			case 4:
				$width_class = "width_small";
				$preview_size = "preview-small";
				break;
			case 5:
				$width_class = "width_small";
				$preview_size = "preview-small";

				break;
			case 6:
				$width_class = "width_small";
				$preview_size = "preview-small";
				break;
			case 7:
				$width_class = "width_large";
				$preview_size = "preview-large";
				$n = "0";
				break;

		}


		$post_id = $post->ID;

		$preview_image = get_the_post_thumbnail($post_id, $preview_size);
		$categories = get_the_category();
			$separator = ', ';
			$output = '';
			if($categories){
				foreach($categories as $category) {
					$output .= $category->cat_name . '' . $separator;
				}

			}

		?>
		<div class="content_item <?php echo $width_class; ?>">
			<a class="content_overlay_link" href="<?php the_permalink(); ?>">&nbsp;</a>

			<?php if ( has_post_format( 'video' )) { echo "<div class=\"playbutton\">&nbsp;</div>"; } ?>

			<div class="preview_picture">
					<?php
					echo $preview_image;
					?>
			</div>

			<div class="preview_content">
				<div class="item_type"><!-- categorie /--><?php echo trim($output, $separator); ?></div>
				<div class="item_title"><h1><?php the_title(); ?></h1></div>
			</div>

		</div>


	<?php endwhile; ?>

	<div class="navigation content_left">
		<?php if(function_exists('wp_pagenavi')) { wp_pagenavi(); } ?>
	</div>

<?php endif; ?>


</div><!-- /grid-content -->
</div><!-- / content_left -->

<?php get_footer(); ?>
