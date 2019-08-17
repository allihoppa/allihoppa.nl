<?php
$pathToConfig = __DIR__ . '/../private/configProduction.php';
if (file_exists($pathToConfig)) {
    require_once $pathToConfig;
} else {
    require_once __DIR__ . '/../configFromEnv.php';
}

const LOCALHOST = 'localhost';

$table_prefix = 'wp_';
define('WPLANG', 'nl_NL');
define('WP_AUTO_UPDATE_CORE', false);
convinceWordPressToUseHttpsProtocolInUrlsWhenBehindAnSslOffloadingProxy();
function generateWpHome()
{
    if (!empty($_SERVER['HTTP_X_FORWARDED_HOST'])) {
        return $_SERVER['HTTP_X_FORWARDED_PROTO'] .'://'
            . $_SERVER['HTTP_X_FORWARDED_HOST'];
    }

    $httpHostParts = parse_url($_SERVER['HTTP_HOST']);

    $host = !empty($httpHostParts['host']) ? $httpHostParts['host'] : LOCALHOST;
    $port = getenv('HTTP_PORT');

    return "http://$host:$port";
}
define('WP_HOME', generateWpHome());
define('WP_SITEURL', WP_HOME . '/wordpress');
define('INTERNAL_WP_HOME', 'http://' . LOCALHOST . ':' . getenv('HTTP_PORT'));

define('WP_CONTENT_DIR', __DIR__ . '/wp-content');
define('WP_CONTENT_URL', WP_HOME . '/wp-content');

/** Absolute path to the WordPress directory. */
if (!defined('ABSPATH'))
    define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

function convinceWordPressToUseHttpsProtocolInUrlsWhenBehindAnSslOffloadingProxy()
{
    if ($_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
        $_SERVER['HTTPS'] = true;
    }
}
