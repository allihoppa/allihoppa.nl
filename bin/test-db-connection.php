#!/usr/bin/php
<?php
$_SERVER['SERVER_PROTOCOL'] = null;

define('WP_DEBUG_DISPLAY', false);

function myErrorHandler($errno, $errstr, $errfile, $errline)
{
    if (strstr($errstr, 'mysql')) {
        exit(1);
    }
}

set_error_handler("myErrorHandler");

require_once __DIR__ . '/../public/wordpress/wp-load.php';

/** \wpdb $wpdb */
global $wpdb;
if ($wpdb->query("SELECT 1") === false) {
    exit(1);
}


