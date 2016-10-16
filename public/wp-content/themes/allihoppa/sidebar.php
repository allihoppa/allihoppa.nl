<div class="sidebar">
	
	<?php 
	
	$category_name = get_the_category();
	
	foreach($category_name as $category_name_attribute) {
		$the_category_slug = $category_name_attribute->slug;
	}
	//var_dump($the_category_slug);
	
	$args1 = "pagename=over-allihoppa";
	$loop1 = new WP_Query( $args1 );
	while ( $loop1->have_posts() ) : $loop1->the_post(); 
	$post_id = $post->ID;
	$excerpt = get_the_excerpt();
	$preview_image = get_the_post_thumbnail($post_id, 'medium');

	?>

	<div class="preview_picture">
		<a href="<?php bloginfo('url'); ?>/over-allihoppa"><?php echo $preview_image; ?></a>
	</div>

	<div class="sidebar_content border_bottom_gray">
	<?php echo $excerpt; ?>
	</div>
	
	<?php endwhile; ?>
	
	
	<div class="sidebar_content">
	<?php 
	
	if(is_home() || is_front_page()) {
		$advertentie_cat = "homepage";
	} else {
		$advertentie_cat = $the_category_slug;
	}
	
	$loop = new WP_Query( array( 
	
	'categorie' => $advertentie_cat, 
	'post_type' => 'advertenties',
	'posts_per_page' => 100,
	'orderby' => 'menu_order',
	'order' => 'ASC',
	) );
	
	//var_dump($loop);
	
	
	while ( $loop->have_posts() ) : $loop->the_post(); 
		$advertentie_id = $post->ID;
		//var_dump($advertentie_id);
		
		if(function_exists('get_field')) {
			$advertentie_image = get_field('advertentie');
			$advertentie_url = get_field('advertentie_link');
		}
		
		?>

		<?php if(!empty($advertentie_image)) { 
			$x++;
			if($x == "1") {
				echo "<h3 class=\"sidebar_title\">Advertenties</h3>"; 
			}
			?>
			
			
			
			<div class="sidebar_ad">
			<?php 
			if(!empty($advertentie_url)) {
				echo "<a target=\"_blank\" href=\"";
				echo $advertentie_url;
				echo "\">";
				echo "<img src=\"" . $advertentie_image . "\"/>";
				echo "</a>";
			} else {
				echo "<img src=\"" . $advertentie_image . "\"/>";
			}
			?>
			</div>
		<?php } ?>
		
	<?php endwhile; ?>
	</div>

</div>
	
