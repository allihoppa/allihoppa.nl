
 	</div> <!--/ content -->
		<?php get_sidebar(); ?>
	</div><!-- / wrap -->
	
</div> <!-- /container_abs -->	
</div> <!-- /container -->
</div> <!-- /container_wrap -->

<div class="footer_wrap"> 
<div class="container width_max">

		
	<div class="footer width_max_inside">
	<div class="footer_line">&nbsp;</div>
		<div class="max_width_inside">
			<div id="footer_logo" class="nomobile"><a href="<?php bloginfo('url'); ?>">&nbsp;</a></div>
			<div class="footer_left">
			
				<?php if (!function_exists('dynamic_sidebar') || !dynamic_sidebar('Footer 1')) { } ?>
				<?php if (!function_exists('dynamic_sidebar') || !dynamic_sidebar('Footer 2')) { } ?>
				<?php if (!function_exists('dynamic_sidebar') || !dynamic_sidebar('Footer 3')) { } ?>
				
			</div>	
			
			<div class="footer_right">
				<?php include('searchform.php'); ?>
			</div>	
		</div>
	</div><!-- /footer -->
</div><!-- /container-->
</div><!-- /footer_wrap -->
	
<div id="footer_copy">
	<div class="container width_max">
	<div class="alignright">&copy; <?php echo date('Y'); ?> All Rights Reserved. | <?php bloginfo('name'); ?></div>
	</div>
</div>

</div> <!-- /horizon -->

<?php wp_footer(); ?>

</body>
</html>