<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

    <head profile="http://gmpg.org/xfn/11">
        <title><?php bloginfo('name'); ?><?php if (is_single()) { ?> &raquo; <?php } ?><?php wp_title(); ?></title>

        <meta http-equiv="Content-Type"
              content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>"/>
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>

        <!-- Zanox affialiate verification -->
        <meta name="verification" content="48aad21cf3aa4cca250d472f9e406d9a"/>

        <link href='https://fonts.googleapis.com/css?family=Nunito:300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/fonts.css" type="text/css" media="screen"/>
        <link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen"/>
        <link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/menu.css" type="text/css" media="screen"/>
        <link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/animated_items.css" type="text/css"
              media="screen"/>
        <?php if (is_single()) { ?>
            <link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/jcarousel.css" type="text/css"
                  media="screen"/>
        <?php } ?>
        <link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/responsive.css" type="text/css"
              media="screen"/>

        <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<?php bloginfo('rss2_url'); ?>"/>
        <link rel="alternate" type="text/xml" title="RSS .92" href="<?php bloginfo('rss_url'); ?>"/>
        <link rel="alternate" type="application/atom+xml" title="Atom 0.3" href="<?php bloginfo('atom_url'); ?>"/>
        <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>"/>

        <!--[if lt IE 9]>
        <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/browserfixes.css" type="text/css"
              media="screen"/>
        <![endif]-->

        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        <link rel="apple-touch-icon" href="/apple-touch-icon.png" />
        <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png" />

        <?php wp_head(); ?>

        <?php
        $site_images = "'" . get_bloginfo('template_url') . "/images/logo.png'";
        $site_images .= ",'" . get_bloginfo('template_url') . "/images/logo_footer.png'";

        ?>
        <script type="text/javascript">
            $(function () {
                preload_images(<?php echo $site_images; ?>);
            });
        </script>

        <?php if (!is_single()) { ?>
            <script type="text/javascript">
                //<![CDATA[
                $(function () {
                    var vg = $("#grid-content").vgrid({
                        easing: "easeOutQuint",
                        useLoadImageEvent: true,
                        time: 400,
                        delay: 20,
                        fadeIn: {
                            time: 500,
                            delay: 50,
                            wait: 500
                        }
                    });
                    $(window).load(function (e) {
                        vg.vgrefresh();
                    });
                });
                //]]>
            </script>

        <?php } ?>

        <?php
        if (have_posts()) {
            while (have_posts()) {
                the_post();
                $category = get_the_category();
                if (count($category) === 0) {
                    continue;
                }
                $the_category_id = $category[0]->cat_ID;
                if (function_exists('cc_get_color')) {
                    $category_color = cc_get_color($the_category_id);
                }
            }
        }

        if (empty($category_color) || $category_color == "default" || is_front_page()) {
            $category_color = "15adaa";
        }
        ?>

        <style type="text/css" media="screen">
            #header .menu, #footer_copy {
                background: #<?php echo $category_color; ?>;
            }

            #backtohome, #footer_logo a, .footer_line, a.btn_social {
                background-color: #<?php echo $category_color; ?>;
            }

            #header .catmenu {
                border-top: 1px solid #<?php echo $category_color; ?>;
                border-bottom: 1px solid #<?php echo $category_color; ?>;
            }

            .entry_head {
                border-bottom: 1px solid #<?php echo $category_color; ?>;
            }

            .content_left {
                border-right: 1px solid #<?php echo $category_color; ?>;
            }

            a:link, a:visited, #header .catmenu, .item_type, h1, h2, h3, h4, h5, h6, .footer, .postfilter {
                color: #<?php echo $category_color; ?>;
            }

            #search_field {
                border: 1px solid #<?php echo $category_color; ?>;
            }
        </style>

    </head>
    <body>

        <div id="horizon">
            <div id="header">

                <?php include('menu.php'); ?>

                <div class="container width_max">
                    <div id="header_logo">
                        <div id="backtohome" class="width_max_inside"><a href="<?php bloginfo('url'); ?>">&nbsp;</a>
                        </div>
                    </div>
                </div>

                <?php
                include('catmenu.php');
                ?>
            </div>

            <div id="container_wrap" class="width_max">
                <div class="container width_max">
                    <div class="container_abs width_max">
                        <div id="wrap" class="width_max">

                            <div id="content">
