<?php get_header(); ?>

<div class="content_left">
	<?php if (have_posts()) :  ?>
		<?php while (have_posts()) : the_post();
		$post_id = $post->ID;
		$post_image = get_the_post_thumbnail($post_id, 'full');

		?>

		<div class="post">

			<div class="entry">
				<div class="entry_head">
					<div class="entry_head_imagewrap">

					<?php
					if ( has_post_format( 'image' ) && !empty($post_image)) {
						echo $post_image;

					} else if ( has_post_format( 'gallery' )) {

					  $gallery_image_ids = lc_grab_ids_from_gallery();

							$image_list .=	"<div class=\"jcarousel content_left_header\">\n";
							$image_list .=	"<ul id=\"mycarousel\" class=\"alignleft\">";
							foreach( $gallery_image_ids as $gallery_image_id ) {


								$attachment = get_post($gallery_image_id);
								$image_caption = $attachment->post_excerpt;

								$full_image = wp_get_attachment_image_src($gallery_image_id, 'preview-slider');
								$full_image = $full_image[0];

								$image_list .= '<li class="content_left_header"><div class="image_slider content_left_header"><img src="' . $full_image . '" class="content_left_header"></div></li>';
							}

							$image_list .= "</ul>\n";

							$image_list .= "<div class=\"jcarousel-pagination\">&nbsp;";
						    $image_list .=  "</div>";

							$image_list .= "</div>\n";


							echo $image_list;


					} else if ( has_post_format( 'video' )) {
						if(function_exists('get_field')) {

						$movie_url = get_field('movie_url');
						$movie_platform = get_field('platform');

						$video_list .= "<div class=\"entry_head_video\">\n";

						if( $movie_platform == "vimeo") {

							$video_id = explode('http://vimeo.com/', $movie_url);
							$video_id = $video_id[1];
							//build iframe embed
							$video_list .= "<iframe src=\"http://player.vimeo.com/video/". $video_id . "\" width=\"100%\" height=\"100%\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>";

						} else if( $movie_platform == "youtube") {
							//build iframe embed

							$video_id = explode('http://youtu.be/', $movie_url);
							$video_id = $video_id[1];

							$video_list .= "<iframe src=\"http://www.youtube.com/embed/" . $video_id  ."?rel=0\" width=\"100%\" height=\"100%\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>";
						} else {
							$video_list .= "<iframe src=\"" . $movie_url  ."?rel=0\" width=\"100%\" height=\"100%\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>";
						}

						$video_list .= "</div>";


						echo $video_list;
						}

					}



					?>

					</div>
					<div class="entry_head_content">
						<div class="item_type">
								<?php $categories = get_the_category();
										$separator = ', ';
										$output = '';
										if($categories){
											foreach($categories as $category) {
												$output .= '<a href="'.get_category_link( $category->term_id ).'" title="' . esc_attr( sprintf( __( "View all posts in %s" ), $category->name ) ) . '">'.$category->cat_name.'</a>'.$separator;
											}
										echo trim($output, $separator);
										}?>
						</div>
						<h1><?php the_title(); ?></h1>
					</div>

				</div>
				<div class="social_share_wrap">
					<div class="social_share">
						<a href="http://www.facebook.com/share.php?u=<?php print(urlencode(get_permalink())); ?>&title=<?php print(urlencode(the_title())); ?>" class="btn_social facebook">&nbsp;</a>
						<a href="http://twitter.com/home?status=<?php print(urlencode(get_permalink())); ?>+<?php print(urlencode(the_title())); ?>" class="btn_social twitter">&nbsp;</a>
						<a href="http://www.pinterest.com/pin/create/button/?url=<?php the_permalink(); ?>&media=<?php if(function_exists('the_post_thumbnail')) echo wp_get_attachment_url(get_post_thumbnail_id()); ?>&description=<?php echo get_the_title(); ?>" class="btn_social pinterest">&nbsp;</a>
					</div>
				</div>
				<div class="entry_content">
					<?php
					if ( has_post_format( 'gallery' )) {
						/* filter shortcode if has gallery */
						add_filter('the_content', 'remove_shortcode_from');
						the_content();
						remove_filter('the_content', 'remove_shortcode_from');

					} else {

						the_content();

					}

					echo "<br /><br />";

					the_tags('trefwoorden: ', ', ', '<br />');


					?>
					<?php edit_post_link('Edit'); ?>

					<div class="space">&nbsp;</div>
					<?php comments_template(); ?>
				</div>
			</div>

		</div>

	<?php endwhile; ?>

<?php endif; ?>

</div>

<?php get_footer(); ?>
