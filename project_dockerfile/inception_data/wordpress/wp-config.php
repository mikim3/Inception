<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'mydbname' );

/** Database username */
define( 'DB_USER', 'dbuser' );

/** Database password */
define( 'DB_PASSWORD', 'dbpwd' );

/** Database hostname */
define( 'DB_HOST', 'my_mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'CgB)%9]D`{RZ3^7r39lGiaMAD-,t$n_z0e%USE}j$7hY(~uvE=BLy8rqB}twAU)y' );
define( 'SECURE_AUTH_KEY',   '^(WL^|<F#$c9n3IF2}cKy9=}vq0|j|ij77./HA[%yRzzJ]*&:SmvD~0hpX|;ZPC_' );
define( 'LOGGED_IN_KEY',     '`A!+i0wA?,3joJ[<mG9]r ^BbfSh%}1Ntsy)Sq`0BUcqRqxb|Rd%/%14^TLyGUU!' );
define( 'NONCE_KEY',         'Mb3War}ko;$a6/(;^{fOvIEQ IG][ip`=]@z;1NEK3zbmTQC~EtqQ>BM DJGo2x:' );
define( 'AUTH_SALT',         'b{ku~,G`lylaJ75@ajR%*A:NzDsv~7nLv>=50Vl)X*N0p7k1cV9q0GaU_<)-bR>z' );
define( 'SECURE_AUTH_SALT',  'FBB8BAEMqW~3p+BHJ(jN ?&g_3gIAsB)CI1:[|br&l{Yy]fZ|!3EH(Z.eN_#@$l<' );
define( 'LOGGED_IN_SALT',    ',D:od4>KX}yb)ghK[9qCtm*GsjC<yxQ3lM?Uoa3Co*AD_cVH:phcfoOo7W]5T/{;' );
define( 'NONCE_SALT',        'etlyNJlMelVdV?[wV]^Bxu@BlO%SlW[br`cZ/?yloC;o9/8tOZCk&JjaWZ55;d?Z' );
define( 'WP_CACHE_KEY_SALT', 'D=m:qJ8Ae)qKz+E0k#&2~t5h7yz+hrNhJ5^VU[$mg}hG3G~eZD^CNfX(M<*Ig8.w' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
