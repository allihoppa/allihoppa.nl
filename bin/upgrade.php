#!/usr/bin/php
<?php
require __DIR__ . '/../public/wordpress/wp-load.php';
require __DIR__ . '/../public/wordpress/wp-admin/includes/upgrade.php';

wp_upgrade();
