<?php
if (isset($_SERVER['SERVER_PROTOCOL']) === false) {
    $_SERVER['SERVER_PROTOCOL'] = 'cli';
}

$pathToConfig = __DIR__ . '/../private/configProduction.php';
if (file_exists($pathToConfig)) {
    require_once $pathToConfig;
} else {
    require_once __DIR__ . '/../configFromEnv.php';
}

const LOCALHOST = 'localhost';

$table_prefix = 'wp_';
define('WPLANG', 'nl_NL');
define('WP_AUTOMATIC_UPDATER_DISABLED', false);
convinceWordPressToUseHttpsProtocolInUrlsWhenBehindAnSslOffloadingProxy();
function generateWpHome()
{
    if (!empty($_SERVER['HTTP_X_FORWARDED_HOST'])) {
        return $_SERVER['HTTP_X_FORWARDED_PROTO'] .'://'
            . $_SERVER['HTTP_X_FORWARDED_HOST'];
    }

    $httpHostParts = isset($_SERVER['HTTP_HOST']) ? parse_url($_SERVER['HTTP_HOST']) : '';

    $host = !empty($httpHostParts['host']) ? $httpHostParts['host'] : LOCALHOST;
    $port = getenv('HTTP_PORT');

    return "http://$host:$port";
}
define('WP_ADMIN_EMAIL', 'me@lucasvanlierop.nl');
define('WP_HOME', generateWpHome());
define('WP_SITEURL', WP_HOME . '/wordpress');
define('INTERNAL_WP_HOME', 'http://' . LOCALHOST . ':' . getenv('HTTP_PORT'));

define('WP_CONTENT_DIR', __DIR__ . '/wp-content');
define('WP_CONTENT_URL', WP_HOME . '/wp-content');

define(
    'WP_ACTIVE_PLUGINS',
    serialize(
        array(
            0 => 'adminimize/adminimize.php',
            1 => 'advanced-custom-fields/acf.php',
            2 => 'akismet/akismet.php',
            3 => 'all-in-one-seo-pack/all_in_one_seo_pack.php',
            4 => 'category-colors/cc-index.php',
            5 => 'custom-post-type-ui/custom-post-type-ui.php',
            7 => 'page-excerpt/pageExcerpt.php',
            8 => 'pinterest-verify/pinterest-verify.php',
            9 => 'post-thumbnail-editor/post-thumbnail-editor.php',
            10 => 'public-post-preview/public-post-preview.php',
            11 => 'simple-page-ordering/simple-page-ordering.php',
            12 => 'taxonomy-terms-order/taxonomy-terms-order.php',
            14 => 'wp-pagenavi/wp-pagenavi.php',
            15 => 'wp-smtp-config/wp-smtp-config.php',
        )));
define('WP_TEMPLATE', 'allihoppa');
define('WP_STYLESHEET', 'allihoppa');
define('WP_TIMEZONE_STRING', 'Europe/Amsterdam');
define('WP_CURRENT_THEME', 'Allihoppa');

// Just here so bin/clean-options removes them from the database
define('WP_UNINSTALL_PLUGINS', serialize([]));
define('WP_THEME_MODS_TWENTYFOURTEEN', serialize([]));
define('WP_AUTO_CORE_UPDATE_NOTIFIED', false);
define('WP_MAILSERVER_URL', 'mail.example.com');
define('WP_MAILSERVER_LOGIN', 'login@example.com');
define('WP_MAILSERVER_PASS', 'password');
define('WP_MAILSERVER_PORT', 110);
/** Absolute path to the WordPress directory. */
if (!defined('ABSPATH'))
    define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

function convinceWordPressToUseHttpsProtocolInUrlsWhenBehindAnSslOffloadingProxy()
{
    if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
        $_SERVER['HTTPS'] = true;
    }
}
