<?php
/**
 * HostBill will load this file when it will need to list available Ports in PDU.
 *
 * Load available ports into $ports array - HostBill will read from it.
 * I.e.:
 * $ports = array(
 *  "0" => "Port name #0",
 *  "1" => "Port name #1"
 * );
 *
 * Connection details loaded from related App are available in $app array.
 * $app['ip'] - holds PDU ip address
 * $app['read'] - holds SNMP read community, default "public"
 * $app['write'] - holds SNMP write community, default "private"
 *
 *
 * If you wish to return error, throw new Exception.
 * like: throw new Exception('Something unexpected happen');
 */

$ports = array();

/**
 * We're using helper here, but you can use default snmp functions for php
 * http://www.php.net/manual/en/ref.snmp.php
 */




$snmp = HBLoader::LoadComponent('Net/SNMP_wrapper');
$snmp->Connect($app['ip'],161,$app['read']);



$tree = $snmp->GetTree('.1.3.6.1.4.1.30966.5.1.1.8');
if(is_array($tree) && !empty ($tree)) {
    foreach($tree as $key=>$itm) {
        $k = explode(".",$key);
        array_pop($k);
        $k = array_pop($k);
        $x=str_ireplace(array('STRING: ','"'), '', $itm);
        $ports[$k]=$x;
    }
}
