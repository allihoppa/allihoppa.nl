<form method="get" id="searchform" action="<?php bloginfo('url'); ?>/">
<div id="search">
	<div id="search_content">
		<h3>zoeken</h3>
		<input type="text" value="<?php the_search_query(); ?>" name="s" id="search_field" />
		<div id="search_button"><input type="submit" value=" " id="search_submit" /></div>
	</div>
</div>
</form>
