<?php
/*
* HOSTBILL CONFIGURATION: BASIC SETTINGS:
*/
// Database host / default: localhost
$db_host = 'localhost';

// Database name
$db_name = 'admin_clientes';

 // Database username
$db_user = 'root';

 // Database password
$db_pass = 'rojo2000';

// Please enter here Credit Card Encryption Hash used to encode credit cards details in Database. Use only ASCII letters and digits
$ccEncryptionHash = '5c14973fb84cbcfb57dd5d1a6860601d';
// Note, hash above has been automatically generated during installation.
// Please copy it into safe place or use your value.


 /*
  * ADVANCED SETTINGS:
  */

// Additional security settings:  http://wiki.hostbillapp.com/index.php?title=Additional_security
//Admininstrator folder name, default is admin
 $hb_admin_folder='admin';

 //Absolute location of templates_c dir - leave false for default
 $hb_templates_c_dir = false;

 //Absolute location of attachments dir - leave false for default
 $hb_attachments_dir = false;

 //Absolute location of downlods dir - leave false for default
 $hb_downloads_dir = false;


 // Advanced DB settings:
 //Database Port
$db_port = '3306';
 //Database Engine - mysql is default
$db_engine = 'mysql';
?>