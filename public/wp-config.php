<?php
define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
define('AUTH_KEY', getenv('AUTH_KEY'));
define('SECURE_AUTH_KEY', getenv('SECURE_AUTH_KEY'));
define('LOGGED_IN_KEY', getenv('LOGGED_IN_KEY'));
define('NONCE_KEY', getenv('NONCE_KEY'));
define('AUTH_SALT', getenv('AUTH_SALT'));
define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT'));
define('LOGGED_IN_SALT', getenv('LOGGED_IN_SALT'));
define('NONCE_SALT', getenv('NONCE_SALT'));
$table_prefix = 'wp_';
define('WPLANG', 'nl_NL');
define('WP_AUTO_UPDATE_CORE', false);
define('WP_ENV', getenv('WP_ENV'));
define('WP_DEBUG', getenv('WP_DEBUG') === 'true');
function generateWpHome()
{
    $httpHostParts = parse_url($_SERVER['HTTP_HOST']);

    $host = $httpHostParts['host'];
    $port = !empty($httpHostParts['port']) ? $httpHostParts['port'] : 80;

    return "http://$host:$port";
}
define('WP_HOME', generateWpHome());
define('WP_SITEURL', WP_HOME . '/wordpress');

define('WP_CONTENT_DIR', __DIR__ . '/wp-content');
define('WP_CONTENT_URL', WP_HOME . '/wp-content');

define('WP_SMTP_HOST', getenv('WP_SMTP_HOST'));
define('WP_SMTP_PORT', (int) getenv('WP_SMTP_PORT'));
define('WP_SMTP_ENCRYPTION', getenv('WP_SMTP_ENCRYPTION'));
define('WP_SMTP_USER', getenv('WP_SMTP_USER'));
define('WP_SMTP_PASSWORD', getenv('WP_SMTP_PASSWORD'));
define('WP_SMTP_FROM', getenv('WP_SMTP_FROM'));

/** Absolute path to the WordPress directory. */
if (!defined('ABSPATH'))
    define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
