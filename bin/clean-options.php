<?php
require __DIR__ . '/../public/wordpress/wp-load.php';

$wpdb->db_connect();
$all = $wpdb->get_results("SELECT option_name FROM wp_options");

foreach ($all as $result) {
    $constantName = strtoupper($result->option_name);
    $prefixedConstantName = 'WP_' . $constantName;

    if (defined($constantName) || defined($prefixedConstantName)) {
        $query = "DELETE FROM wp_options WHERE wp_options.option_name = '$result->option_name'";
        $wpdb->query($query);
        echo "Executed: $query" . PHP_EOL;
    }
}


